# Package imports
import os
import sys
import ast
import tqdm
import pandas as pd
import traceback
import time
import random
import requests
import re
from git import Repo
from datetime import datetime

# Global Variables
PATH_OF_GIT_REPO = ".git"  # make sure .git folder is properly configured
COMMIT_MESSAGE = 'News scrape'

# Functions
def save(fileName: str, response: str):
    '''
    Saves an HTTP request response to file.
    Arguments:
        fileName: the name with path where to save.
        response: the HTTP request response to save.
    '''
    # Open file and write file
    with open(fileName, "w", encoding="utf-8") as pf:
        pf.write("{}\n".format(response))

def scrapeNewsList(page: int, source: str, url: str, errorFolder: str, timestamp: str) -> str:
    '''
    A basic scraper for news links.
    Arguments:
        page: the page number being scraped.
        source: the name of the source.
        url: the URL to be scraped. Source specific, with page to be injected.
        errorFolder: the folder where errors are to be saved.
        timestamp: the timestamp of the execution of the application for naming purposes.
    '''
    # Create header to bypass Mod_Security
    headers = {
        'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:55.0) Gecko/20100101 Firefox/55.0',
    }

    # Wait for a few milliseconds so not to be blocked
    time.sleep(random.randint(0, 10)/10)

    # Get list of news
    response = requests.get(url.format(page), headers=headers)

    # Verify that response is what was expected
    if (response.status_code!=200):
        save(os.path.join(errorFolder,"{}_{}_{:05d}.html".format(timestamp, source, page)), response.text)
        raise ValueError("Unexcepcted response code. News page: {:05d}\n Response Code: {:0d}"\
            .format(page, response.status_code))
    
    return response.text

def parseLinks(response: str, source: str, regex: str, prefix: str, priorFirst: str | None) -> list:
    '''
    Parses a news portal response to extract all links.
    Arguments:
        response: the HTML response with the links.
        source: the source identifier
        regex: the source specific regular expression to extract the links.
        prefix: the prefix to add to the extracted links.
        priorFirst: the first link extracted in a prior run.
    '''
    links = list()
    pattern = re.compile(regex)

    x = re.findall(pattern, response)

    # Iteratre through all found links and add to a list. This can have duplicates but it allows retrieval of most recent and latest.
    for link in x:
        if source=='ToM':
            link = "{}{}{}".format("{\"@context\":\"http://schema.org\",\"@graph\":[{\"@type\":\"NewsArticle\"", link, "}]}]}]}")
            jsonObject = ast.literal_eval(link)
            articles = jsonObject['@graph']
            
            for article in articles:
                fields = dict(article)
                
                if not fields.__contains__('url'):
                    continue
                
                fullLink = str(fields.get('url'))
                if priorFirst is not None and fullLink==priorFirst:
                    break
                links.append(fullLink.strip())
            
            continue

        fullLink="{}{}".format(prefix,link).strip()

        if priorFirst is not None and fullLink==priorFirst:
            break

        # Some source specific cleaning
        if source == 'IN':
            start_pos = fullLink.rfind('/local-news/')
            end_pos = fullLink.rfind('-')
            if start_pos!=-1 and end_pos!=-1:
                fullLink = "{}/local-news/{}".format(fullLink[0:start_pos], fullLink[end_pos+1:])
        elif source == 'MT':
            fullLink = fullLink.replace(' ', '-')
            fullLink = fullLink.replace(',', '-')
            fullLink = fullLink.replace(';', '-')
        elif source == 'TVM' and fullLink.__contains__(' rel=bookmark'):
            fullLink = fullLink.replace(' rel=bookmark', '')
        
        links.append(fullLink.strip())

    return links

def logStart(lf):
    '''
    Log start of application.
    Arguments:
        lf: the log file.
    '''
    lf.write("[{}] Maltese news links scraper started.\n".format(datetime.now().strftime("%d/%m/%Y %H:%M:%S")))
    lf.write("[{}] Updating local repository.\n".format(datetime.now().strftime("%d/%m/%Y %H:%M:%S")))
    gitPull()

def logSourceStart(lf, source: str):
    '''
    Log the start of scrapping for a specific source.
    Arguments:
        lf: the log file.
        source: the name of the source.
    '''
    lf.write("[{}] Started scraping source {}.\n".format(datetime.now().strftime("%d/%m/%Y %H:%M:%S"), source))

def logSourceNoLinks(lf, source, page):
    '''
    Log that no links were returned.
    Arguments:
        lf: the log file.
        source: the name of the source.
        page: the page number currently being scraped.
    '''
    lf.write("[{}] Scraping of {} interrupted due to a lack of links found for page {:d}.\n".format(datetime.now().strftime("%d/%m/%Y %H:%M:%S"), source, page))

def logLinks(links: set, lf, dataFolder: str, source: str, timestamp: str):
    '''
    Logs links links that have been scraped.
    Arguments:
        links: set of links.
        lf: the log file.
        dataFolder: the data folder where to save the links.
        source: the name of the source.
    '''
    # Log and save any links (or lack of)
    if links.__len__() > 0:
        with open(os.path.join(dataFolder, "{}_{}.csv".format(source, timestamp)), "a", encoding="utf-8") as pf:
            lf.write("[{}] Saving links from {} in file: {}\n".format(datetime.now().strftime("%d/%m/%Y %H:%M:%S"), source, pf.name))
            for link in links:
                pf.write("{}\n".format(link))
            lf.write("[{}] Saved {:d} links.\n".format(datetime.now().strftime("%d/%m/%Y %H:%M:%S"), links.__len__()))
    else: lf.write("[{}] No links to save for source {}.\n".format(datetime.now().strftime("%d/%m/%Y %H:%M:%S"), source))

def logEnd(runFolder: str, timestamp: str, lf, data: pd.DataFrame, history:pd.DataFrame):
    '''
    Logs the end of the scraper.
    Arguments:
        runFolder: The folder where the log of the run is being logged.
        timestamp: The timestamp when the application started.
        lf: the log file.
        data: the data to be saved.
        history: a dataframe containing the first link extracted from each source in a prior run.
    '''
    df = os.path.join(runFolder, "links_scraper_{}.csv".format(timestamp))
    lf.write("[{}] Saving statistics for run in {}.\n".format(datetime.now().strftime("%d/%m/%Y %H:%M:%S"), df))
    data.to_csv(path_or_buf=df, sep=",", index=False, encoding="utf-8", header=True)

    lf.write("[{}] Updating links scraper history file.\n".format(datetime.now().strftime("%d/%m/%Y %H:%M:%S")))
    history=history.reset_index()
    history.to_csv("links_scraper_history.csv", index=False, encoding="utf-8", header=True)

    lf.write("[{}] Updating repository.\n".format(datetime.now().strftime("%d/%m/%Y %H:%M:%S")))
    gitPush(timestamp)

    # End gracefully
    lf.write("[{}] Maltese news links scraper ended.".format(datetime.now().strftime("%d/%m/%Y %H:%M:%S")))

def registerLinks(lf, source:str, page: int, links: set, first: str | None, last: str | None, aLinks: list | None) -> tuple[str, str] | None:
    '''
    Registers links that have been scraped for a specific source.
    Arguments:
        lf: the log file.
        source: the name of the source.
        page: the page number that has been scraped.
        links: the set of links scraped so far.
        first: the first link that has been scraped.
        last: the last link that has been scraped.
        aLinks: the links that have been scraped from the specific source page.
    '''
    if aLinks is None:
        logSourceNoLinks(lf, source, page)
        return (None, None)

    # Second stopping condition: check if links have been returned
    if aLinks.__len__() == 0:
        logSourceNoLinks(lf, source, page)
        return (None, None)
    
    # Register the first and last scraped link
    if first==None:
        first = aLinks[0]

    last=aLinks[-1]

    # Add link in set to remove duplicate
    for link in aLinks:
        links.add(link)

    return (first, last)

def gitPull():
    '''
    Retrieves latest from repository.
    '''
    try:
        repo = Repo(PATH_OF_GIT_REPO)
        repo.git.pull()
    except:
        print('Some error occured while pulling the code') 

def gitPush(timestamp: str):
    '''
    Commits to repository
    '''
    try:
        repo = Repo(PATH_OF_GIT_REPO)
        repo.git.pull()
        repo.git.add(update=True)
        repo.index.commit("{} {}".format(COMMIT_MESSAGE, timestamp))
        origin = repo.remote(name='origin')
        origin.push()
    except:
        print('Some error occured while pushing the code')  

def main():
    outputFolder = os.path.join(".", "dump")
    dataFolder = os.path.join(outputFolder, "staging")
    errorFolder = os.path.join(outputFolder, "errors")
    logFolder = os.path.join(outputFolder, "logs")
    runFolder = os.path.join(outputFolder, "runs")

    timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
    data = pd.DataFrame({"source":[], "pages":[] , "articles": [], "first": [], "last": []})

    sources = {'ToM': 'https://timesofmalta.com/articles/tags/national/page:{:d}', 
           'MT': 'https://www.maltatoday.com.mt/news/national/{:d}/', 
           'IN': 'https://www.independent.com.mt/local?pg={:d}',
           'TVM': 'https://tvmnews.mt/en/ahbarijiet_category/local/page/{:d}/',
           'NB': 'https://newsbook.com.mt/en/category/news/local/page/{:d}/'}
    reg = {"IN": "\<a href\=\"articles\/(.*?)\"\>", 
        "MT": "a href\=\"\/news\/national\/(.*?)\"\>\<span\>", 
        "ToM": "\{\"@context\":\"http://schema.org\",\"@graph\":\[\{\"@type\":\"NewsArticle\"(.*?)\}\]\}\]\}\]\}",
        "TVM": "href\=https\:\/\/tvmnews\.mt\/en\/news\/(.*?) title=",
        "NB": "class\=td-module-image\>\<div\nclass\=td-module-thumb\>\<a\nhref\=(.*?)rel\=bookmark"}
    prefix = {"IN": "https://www.independent.com.mt/articles/", 
            "MT": "https://www.maltatoday.com.mt/news/national/", 
            "ToM": "",
            "TVM": "https://tvmnews.mt/en/news/",
            "NB": ""}

    history = pd.read_csv("links_scraper_history.csv", encoding="utf-8", sep=",")
    history = history.set_index("source")

    # Start the scraper
    with open(os.path.join(logFolder, "links_scraper_{}.txt".format(timestamp)), "a", encoding="utf-8") as lf:
        logStart(lf)

        for source in tqdm.tqdm(sources):
            links = set()
            first = None
            last = None
            logSourceStart(lf, source)

            # Loop for pages in source until first stopping condition reached, the maximum number of pages.
            for page in range(1,int(history.loc[source].maxPages)):
                try:
                    # Scrape news list, parse links
                    priorFirst = history.loc[source].link
                    response = scrapeNewsList(page, source, sources[source], errorFolder, timestamp)
                    aLinks = parseLinks(response, source, reg.get(source), prefix.get(source), priorFirst)                
                    
                    # Register extracted links
                    first, last = registerLinks(lf, source, page, links, first, last, aLinks)

                    if aLinks is None or first is None or last is None:
                        break

                    if (priorFirst is not None and aLinks.__contains__(priorFirst)):
                        break

                except:
                    traceback.print_exception(*sys.exc_info(), file=open("{}_{:06d}.txt".format(os.path.join(errorFolder, source), page), "w", encoding="utf-8"))
                    break

            # Register some statistics for the run.
            if first is not None:
                history.loc[source,'link'] = first
            data = pd.concat([data, pd.DataFrame({"source":source, "pages":page , "articles":links.__len__(), "first": first, "last": last}, index=[source])])

            # Log links
            logLinks(links, lf, dataFolder, source, timestamp)

        # Save and log all statistics for the run.
        logEnd(runFolder, timestamp, lf, data, history)

if __name__=="__main__":
    main()
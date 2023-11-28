# Package imports
import os
import sys
import tqdm
import pandas as pd
import traceback
import time
import random
import requests
import re
from datetime import datetime

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

def main():
    # Common variable declarations
    outputFolder = os.path.join(".", "dump")
    dataFolder = os.path.join(outputFolder, "staging")
    errorFolder = os.path.join(outputFolder, "errors")

    timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")

    source = 'https://timesofmalta.com/articles/tags/national/page:{:d}'
    reg = "\{\"@context\":\"http://schema.org\",\"@graph\":\[\{\"@type\":\"NewsArticle\"(.*?)\}\]\}\]\}\]\}"

    timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
    data = pd.DataFrame({"source":[], "pages":[] , "articles": [], "first": [], "last": []})

    with open(os.path.join(dataFolder, "tom_links_{}.txt".format(timestamp)), "a", encoding="utf-8") as f:
        for page in tqdm.tqdm(range(1,3952)):
            try:
                # Scrape news list, parse links
                response = scrapeNewsList(page, 'ToM', source, errorFolder, timestamp)

                pattern = re.compile(reg)

                matches = re.findall(pattern, response)

                # Iteratre through all found links and add to a list. This can have duplicates but it allows retrieval of most recent and latest.
                for match in matches:
                    f.write("{}{}{}".format("{\"@context\":\"http://schema.org\",\"@graph\":[{\"@type\":\"NewsArticle\"", match, "}]}]}]}\n"))
                        
            except:
                traceback.print_exception(*sys.exc_info(), file=open("{}_{}_{:06d}.txt".format(os.path.join(errorFolder, 'ToM'), timestamp,page), "w", encoding="utf-8"))
                break

if __name__=="__main__":
    main()
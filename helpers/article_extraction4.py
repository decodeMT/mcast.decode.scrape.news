import os
import pandas as pd
import bs4 as bs
from datetime import datetime
import time
import random
import csv
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.chrome.options import Options
import shutil
from git import Repo
from tqdm import tqdm
import constants

PATH_OF_GIT_REPO = os.path.join(".git")
DATA_HEADERS = ['title', 'sub-title', 'author',
                'date', 'article', 'link', 'tags']

SCRIPT_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))


HISTORY_LOG_FILE = os.path.join(SCRIPT_DIR, "article_scraper_history.csv")
DATA_FOLDER = os.path.join(SCRIPT_DIR, "data")
DUMP_FOLDER = os.path.join(SCRIPT_DIR, "dump")

STAGING_FOLDER = os.path.join(DUMP_FOLDER, "staging4")
ERROR_FOLDER = os.path.join(DUMP_FOLDER, "errors")
LOG_FOLDER = os.path.join(DUMP_FOLDER, "logs")
RUN_FOLDER = os.path.join(DUMP_FOLDER, "runs")
PROCESSED_FOLDER = os.path.join(DUMP_FOLDER, "processed")

NEWS_PARSER = constants.NEWS_PARSER


def get_selenium_driver():
    options = Options()
    options.add_argument("headless")
    options.add_argument("log-level=3")
    options.add_argument('--ignore-certificate-errors')
    options.add_argument('--ignore-ssl-errors')
    return webdriver.Chrome(service=Service(
        ChromeDriverManager().install()), options=options)


def git_pull():
    '''
    Retrieves latest from repository.
    '''
    try:
        repo = Repo(PATH_OF_GIT_REPO)
        repo.git.pull()
    except Exception as e:
        print('Error: {}'.format(str(e)))


def git_push(timestamp: str, message: str = "News Articles scrape"):
    '''
    Commits to repository
    '''
    try:
        repo = Repo(PATH_OF_GIT_REPO)
        repo.git.add(update=True)
        repo.index.commit("{} {}".format(message, timestamp))
        origin = repo.remote(name='origin')
        origin.push()
    except Exception as e:
        print('Error: {}'.format(str(e)))


def get_timestamp():
    return datetime.now().strftime("%Y%m%d_%H%M%S")


def get_files_to_process():
    files = [f for f in os.listdir(STAGING_FOLDER) if os.path.isfile(
        os.path.join(STAGING_FOLDER, f)) and f != ".gitkeep"]
    return files


def create_log_message(message: str, timestamp: str):
    with open(os.path.join(LOG_FOLDER, "article_scraper_{}.txt".format(timestamp)), "a", encoding="utf-8") as lf:
        lf.write("[{}] {}.\n".format(
            datetime.now().strftime("%d/%m/%Y %H:%M:%S"), message))
    lf.close()


def create_error_message(message: str, timestamp: str):
    with open(os.path.join(ERROR_FOLDER, "article_scraper_{}.txt".format(timestamp)), "a", encoding="utf-8") as ef:
        ef.write("[{}] {}.\n".format(
            datetime.now().strftime("%d/%m/%Y %H:%M:%S"), message))
    ef.close()


def get_newspaper(filename: str):
    newspaper = filename.split('_')[0]
    if not (newspaper in NEWS_PARSER.keys()):
        raise Exception(
            "Newspaper {} from file {} not implemented yet.".format(newspaper, filename))
    else:
        return newspaper


def get_file_data(filename: str):
    links = list()
    with open(os.path.join(STAGING_FOLDER, filename), "r", encoding="utf-8") as f:
        for line in f.readlines():
            links.append(line)

    # file = open(os.path.join(STAGING_FOLDER, filename), encoding='utf8')
    # data = list(csv.reader(file))
    # file.close()
    return links


def get_article_html_content(link: str, driver: webdriver.Chrome):
    driver.get(link)
    return bs.BeautifulSoup(driver.page_source, 'html.parser')


def extract_elements_general(article: str, parts: list):
    data = {}
    for element in DATA_HEADERS:
        data[element] = None
    for part in parts:
        type = parts[part]["type"]
        found = None
        if (type == 'class'):
            found = article.find(class_=part)
        elif (type == 'name'):
            found = article.find(name=part)

        if (found != None):
            found = found.get_text().strip()
        elif 'failsafe' in list(parts[part].keys()):
            part_temp = parts[part]['failsafe']
            part_temp_key = list(part_temp.keys())[0]
            if part_temp[part_temp_key]["type"] == 'class':
                found = article.find(class_=part_temp_key)
            elif part_temp[part_temp_key]["type"] == 'name':
                found = article.find(name=part_temp_key)
            if (found != None):
                found = found.get_text().strip()

        data[parts[part]["maps"]] = [found]

    return pd.DataFrame(data)


def extract_elements_from_article(newspaper: str, article: str):
    if not (newspaper in NEWS_PARSER.keys()):
        return None
    return extract_elements_general(article, NEWS_PARSER[newspaper]["scrape"])


def get_tags_ToM(article):
    x = article.find(class_='wi-WidgetKeywords-container')
    if x == None:
        return None
    list = []
    for result in x:
        list.append(result.get_text())
    return ','.join(list)


def get_tags_NB(article):
    x = article.find(class_='td-tags td-post-small-box clearfix')
    if x == None:
        return None
    list = []
    for result in x:
        if (result.get_text() != 'TAGS'):
            list.append(result.get_text())
    return ','.join(list)


def get_tags_TVM(article):
    x = article.find(class_='post-tags')
    if x == None:
        return None
    list = []
    for result in x:
        if (result.get_text() != '\\n'):
            list.append(result.get_text())
    return ','.join(list)


def load_scraper_history():
    log = ''
    try:
        log = pd.read_csv(HISTORY_LOG_FILE, index_col=0)
        return log
    except:
        log = pd.DataFrame(columns=['file', 'link'])
        log.to_csv(HISTORY_LOG_FILE, index=False)
        return log


def update_scraper_history(file, link):
    log = load_scraper_history()
    log.loc[file] = link
    log.to_csv(HISTORY_LOG_FILE, mode='w', index=True)


def check_next_article(file):
    history = load_scraper_history()
    try:
        result = str(history.loc[file].link)
        if (result == 'nan'):
            return ''
        return result
    except:
        return ''


def process_file(filename: str, timestamp: str):
    driver = get_selenium_driver()
    newspaper = get_newspaper(filename)
    result_df = pd.DataFrame(columns=DATA_HEADERS)
    error_df = pd.DataFrame(columns=['article', 'error'])
    records = get_file_data(filename)
    create_log_message(
        'Start processing articles from file {}'.format(filename), timestamp)
    total_count = 0
    successful_count = 0
    error_count = 0
    file_date = datetime.now().strftime("%Y%m%d_%H%M%S")
    saveFile = ''
    needs_to_continue = check_next_article(filename)
    for link in tqdm(records):
        try:
            if (needs_to_continue != ''):
                if (link != needs_to_continue):
                    continue
                else:
                    needs_to_continue = ''
                    update_scraper_history(filename, '')
                    continue
            total_count += 1
            article = get_article_html_content(link, driver)
            result_df = extract_elements_from_article(newspaper, article)
            result_df['link'] = link
            if (newspaper == 'ToM'):
                result_df['tags'] = get_tags_ToM(article)
            elif (newspaper == 'NB'):
                result_df['tags'] = get_tags_NB(article)
            elif (newspaper == 'TVM'):
                result_df['tags'] = get_tags_TVM(article)
            filename = '{}_{}.csv'.format(newspaper, file_date)
            saveFile = os.path.join(DATA_FOLDER, filename)
            result_df.to_csv(saveFile, index=False,
                             encoding='utf-8', mode='a', header=False, sep=chr(31))
            successful_count += 1
        except Exception as e:
            error_count += 1
            create_error_message(
                "Article {} from file {} was not processed successfully.".format(link[0], filename), timestamp)
            error_df = pd.DataFrame(
                columns=['link', 'error'], data=[[link, str(e)]])
            error_df.to_csv(os.path.join(
                ERROR_FOLDER, filename), index=False, encoding='utf-8', mode='a', header=False)
            update_scraper_history(filename, link)
        time.sleep(random.randint(1, 5))
    create_log_message("End processing succesfully {}/{} articles from file {}".format(
        successful_count, total_count, filename), timestamp)
    create_log_message(
        "Scraped articles saved in {}".format(saveFile), timestamp)
    if (error_count > 0):
        create_error_message("{} articles were not scraped, saved in {}".format(
            error_count, ERROR_FOLDER+'/'+filename), timestamp)


def start_process():
    timestamp = get_timestamp()
    files = get_files_to_process()
    create_log_message("Processing {} files".format(len(files)), timestamp)
    for index, filename in enumerate(files):
        try:
            print('Processing file {} name {} of {} '.format(
                index+1, filename, len(files)))
            process_file(filename, timestamp)
            shutil.copyfile(os.path.join(STAGING_FOLDER, filename),
                            os.path.join(PROCESSED_FOLDER, filename))
            os.remove(os.path.join(STAGING_FOLDER, filename))
        except Exception as e:
            create_error_message(str(e), timestamp)
    create_log_message("Process ended successfully", timestamp)

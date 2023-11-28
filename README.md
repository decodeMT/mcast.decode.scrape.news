# com.mcast.res.localNewsScraper
A news scraper of Maltese news articles.

# Folders
- **data**: All extracted data from the project. A file per source per year will be made available in zip format.
- **dump**: Contains all data gathered from scraper and parser, which has not been migrated to the dataset folder.
-- **errors**: Any error log and/or response is made available here.
-- **logs**: Any log output from the scripts.
-- **processed**: The article content of links from the staging folder are dumped here, ready to be migrated to the data folder.
-- **runs**: Statistics about each run.
-- **staging**: The initial scraper would retrieve a page from a source and store the links in a csv. Said csv is saved here.
- **notebooks**: All code wrapped in a notebook for testing is available here.
- **setup**: Setup scripts made available here.

# Python environment setup on a Windows system
To setup a python environment in order to run the notebooks and scripts:

- Step 01: Install Python. Ideally 3.10 or later
- Step 02: Ensure that python is registered in your Environment Variable. Check the version on your system by running:

`python --version

- Step 03: Navigate to the root folder of the repository and open a terminal window. Create a virtual environment by running the following:

```
pip install virtualenv
python -m venv news-venv
.\news-venv\Scripts\activate
pip install jupyter
ipython kernel install --name "news-venv-kernel" --user
pip install tqdm
pip install bs4
pip install requests
pip install gitpython
.\sudoku-venv\Scripts\deactivate
```
# Python environment setup on a Debian/Ubuntu/Raspberry Pi system
Either ssh to your system or open a terminal window and do the following.

- Step 01: Update your system `sudo apt update && upgrade
- Step 02: Install python 3 `sudo apt install python3
- Step 03: Navigate to your workspace folder
- Step 04: Clone the repository
- Step 05: Change directory to the repository folder.
- Step 06: Run the following commands.

```
pip3 install virtualenv
python3 -m venv news-venv
source ./news-venv/bin/activate
pip install tqdm bs4 requests gitpython pandas
source ./news-venv/bin/deactivate
```

# Sources
News articles are gathered from the following sources:
- [MaltaToday](https://www.maltatoday.com.mt/)
- [NewsBook](https://newsbook.com.mt/en/)
- [The Malta Independent](https://www.independent.com.mt/)
- [Times of Malta](https://timesofmalta.com/)
- [TvmNews](https://timesofmalta.com/)

# Resources
- [Regex101](https://regex101.com/)
- [Regex Tester](https://www.regextester.com/)
- [Regexr](https://regexr.com/)

# Usage
- First run linksScraper.py which will gather all links from all sources. The links_scraper_history.csv will be updated with each run.

# DB
The data has been migrated to a postgreSQL DB which has dump was exported. To load a dump use

```
psql -U postgres -h 127.0.0.1 -p 5432 -f c:\test\localnews_20230424_105945.sql
```
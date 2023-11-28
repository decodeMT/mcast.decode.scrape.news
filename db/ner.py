import queue
import multiprocessing
import psycopg2
import spacy
from dotenv import load_dotenv
import os
import time

nlp = spacy.load("en_core_web_trf")

load_dotenv(os.path.join("..", "settings", "local.env"))

db_host = os.getenv("DB_HOST")
db_port = os.getenv("DB_PORT")
db_name = os.getenv("DB_NAME")
db_username = os.getenv("DB_USERNAME")
db_password = os.getenv("DB_PASSWORD")
db_batch_size = 950  # Maximum of postgresql is 1000, some articles have up to 700 named entities.
n_processes = 4
batch_size = 512

conn = psycopg2.connect(database=db_name, user=db_username, password=db_password, host=db_host, port=db_port)
conn.autocommit=True

def worker(q):
    cur = conn.cursor()

    while True:
        try:
            items = q.get(block=False)
        except queue.Empty:
            break

        # Process the batch of items here
        values = []
        for item in items:
            doc = nlp(item[1], disable=["tagger", "parser", "attribute_ruler", "lemmatizer"])

            for ent in doc.ents:
                if ent.label_ not in ['DATE', 'CARDINAL', 'ORDINAL', 'QUANTITY', 'MONEY', 'TIME', 'PERCENT']:
                    values.append((item[0], ent.text, ent.label_))

                if values.__len__() >= db_batch_size:
                    cur.executemany("INSERT INTO localnews.named_entities (articleId, entity, entityType) VALUES (%s, %s, %s)", values)
                    values.clear()

        if values.__len__() > 0:
            cur.executemany("INSERT INTO localnews.named_entities (articleId, entity, entityType) VALUES (%s, %s, %s)", values) 
            values.clear()

def main():
    start_time = time.time()
    cur = conn.cursor()   

    year = 2015
    cur.execute("SELECT entryId, article FROM localnews.articles WHERE date_part('year',parseddate) = {}"
        " and entryId NOT IN (SELECT DISTINCT articleId FROM localnews.named_entities)".format(year))
    records = cur.fetchall() 

    # Create a queue and add items to it
    q = multiprocessing.Queue()

    # Adding items in batches
    for i in range(0, records.__len__(), batch_size):
        q.put(records[i:i+batch_size])

    # Create worker processes
    processes = []
    for i in range(n_processes):
        p = multiprocessing.Process(target=worker, args=(q,))
        p.start()
        processes.append(p)

    # Wait for all processes to finish
    for p in processes:
        p.join()

    print("--- %s seconds ---" % (time.time() - start_time))

if __name__=="__main__":
    main()
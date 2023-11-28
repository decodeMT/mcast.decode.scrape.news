SELECT entryId, TRIM(unnest(author2)) FROM localnews.articles WHERE author_temp LIKE '%,%' ORDER BY length(author_temp) DESC LIMIT 10;

CREATE TABLE localnews.authors (
    entryID BIGSERIAL CONSTRAINT auth_pk PRIMARY KEY,
    articleID BIGINT CONSTRAINT auth_aid_fk REFERENCES localnews.articles(entryID) NOT NULL,
    author VARCHAR(256) NOT NULL
);

INSERT INTO localnews.authors (articleID, author)
(SELECT entryId, TRIM(unnest(author2)) FROM localnews.articles WHERE author_temp IS NOT NULL ORDER BY entryID);

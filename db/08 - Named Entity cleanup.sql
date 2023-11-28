-- Check the total number of named entities entries.
SELECT count(*) FROM localnews.named_entities;

-- Get number of problematic named_entities rows
SELECT COUNT(*) 
FROM localnews.named_entities 
WHERE entityType NOT IN ('PERSON', 'NORP', 'FAC', 'ORG', 'GPE', 'LOC', 'PRODUCT', 'EVENT', 'WORK_OF_ART', 'LAW', 'LANGUAGE', 'DATE', 'TIME', 'PERCENT', 'MONEY', 'QUANTITY', 'ORDINAL', 'CARDINAL');

-- Get years of problematic named_entities rows
SELECT DISTINCT date_part('year', a.parseddate)
FROM localnews.named_entities e JOIN localnews.articles a ON (a.entryid=e.articleId)
WHERE entityType NOT IN ('PERSON', 'NORP', 'FAC', 'ORG', 'GPE', 'LOC', 'PRODUCT', 'EVENT', 'WORK_OF_ART', 'LAW', 'LANGUAGE', 'DATE', 'TIME', 'PERCENT', 'MONEY', 'QUANTITY', 'ORDINAL', 'CARDINAL') ORDER BY 1;

-- Swap entityType with entity columns
ALTER TABLE localnews.named_entities ADD COLUMN temp_col VARCHAR(2048) DEFAULT NULL;

UPDATE localnews.named_entities SET temp_col=entityType WHERE entityType NOT IN ('PERSON', 'NORP', 'FAC', 'ORG', 'GPE', 'LOC', 'PRODUCT', 'EVENT', 'WORK_OF_ART', 'LAW', 'LANGUAGE', 'DATE', 'TIME', 'PERCENT', 'MONEY', 'QUANTITY', 'ORDINAL', 'CARDINAL');

UPDATE localnews.named_entities SET entityType=entity WHERE temp_col IS NOT NULL;
UPDATE localnews.named_entities SET entity=temp_col WHERE temp_col IS NOT NULL;

ALTER TABLE localnews.named_entities DROP COLUMN temp_col;

-- Checking
SELECT COUNT(*) 
FROM localnews.named_entities 
WHERE entityType NOT IN ('PERSON', 'NORP', 'FAC', 'ORG', 'GPE', 'LOC', 'PRODUCT', 'EVENT', 'WORK_OF_ART', 'LAW', 'LANGUAGE', 'DATE', 'TIME', 'PERCENT', 'MONEY', 'QUANTITY', 'ORDINAL', 'CARDINAL');

SELECT e.*
FROM localnews.named_entities e JOIN localnews.articles a ON (a.entryid=e.articleId) 
WHERE date_part('year', a.parseddate) <2015
LIMIT 10;

SELECT source, count(*) FROM localnews.articles GROUP BY ROLLUP(source) ORDER BY 1;


WITH articlesPerSourceByYear (yr, sIn, sMT, sNb, sTom, sTvm) AS
(SELECT  date_part( 'YEAR', parsedDate), 
        CASE WHEN source='IN' THEN 1 ELSE 0 END,
        CASE WHEN source='MT' THEN 1 ELSE 0 END,
        CASE WHEN source='NB' THEN 1 ELSE 0 END,
        CASE WHEN source='ToM' THEN 1 ELSE 0 END,
        CASE WHEN source='TVM' THEN 1 ELSE 0 END
FROM    localnews.Articles)
SELECT  yr, SUM(sIn) "IN", SUM(sMt) "MT", SUM(sNb) "NB", SUM(sTom) "ToM", SUM(sTvm) "TVM"
FROM    articlesPerSourceByYear
GROUP BY yr
ORDER BY yr;


WITH authorStats (author, eId) AS 
(SELECT DISTINCT LEFT(author, 10), entryId 
FROM localnews.articles
WHERE author IS NOT NULL AND author NOT LIKE '% and %' AND author NOT LIKE '%,%')
SELECT author, count(eid)
FROM authorStats
GROUP BY author
HAVING count(eid) > 500
ORDER BY 2 DESC;
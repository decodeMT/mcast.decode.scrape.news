-- Remove duplicates
WITH duplicates AS (
  SELECT
    *,
    ROW_NUMBER() OVER (PARTITION BY link ORDER BY entryID DESC) AS row_num
  FROM
    localNews.articles
)
--DELETE FROM localNews.articles
SELECT * FROM localnews.Articles
WHERE entryId IN (SELECT entryId FROM duplicates WHERE row_num > 1);

-- Remove white spaces in article links for ToM
UPDATE localNews.articles SET link = regexp_replace(link, '\s', '', 'g') WHERE source='ToM';

-- Clean authors for ToM
UPDATE localNews.articles SET author=REPLACE(author, '| ','') WHERE source='ToM';
UPDATE localNews.articles SET author=TRIM(author) WHERE source='ToM';

-- Extensive cleaning
UPDATE localnews.articles SET parsedDate = '2018-07-17 21:22'::TIMESTAMP(0) WHERE entryID=626036;
UPDATE localnews.articles SET parsedDate = '2020-03-14 12:34'::TIMESTAMP(0) WHERE entryID=626037;
UPDATE localnews.articles SET parsedDate = '2016-04-04 20:06'::TIMESTAMP(0) WHERE entryID=626038;
UPDATE localnews.articles SET parsedDate = '2014-03-29 18:53'::TIMESTAMP(0) WHERE entryID=626039;
UPDATE localnews.articles SET parsedDate = '2016-04-18 22:35'::TIMESTAMP(0) WHERE entryID=626044;
UPDATE localnews.articles SET parsedDate = '2020-01-12 19:17'::TIMESTAMP(0) WHERE entryID=626053;
UPDATE localnews.articles SET parsedDate = '2015-05-19 20:13'::TIMESTAMP(0) WHERE entryID=626054;
UPDATE localnews.articles SET parsedDate = '2017-11-14 16:50'::TIMESTAMP(0) WHERE entryID=626040;
UPDATE localnews.articles SET parsedDate = '2020-01-11 16:58'::TIMESTAMP(0) WHERE entryID=626042;
UPDATE localnews.articles SET parsedDate = '2015-12-16 21:30'::TIMESTAMP(0) WHERE entryID=626043;
UPDATE localnews.articles SET parsedDate = '2023-03-28 16:24'::TIMESTAMP(0) WHERE entryID=626045;
UPDATE localnews.articles SET parsedDate = '2020-07-29 11:05'::TIMESTAMP(0) WHERE entryID=626047;
UPDATE localnews.articles SET parsedDate = '2014-04-14 22:43'::TIMESTAMP(0) WHERE entryID=626049;
UPDATE localnews.articles SET parsedDate = '2021-07-29 11:41'::TIMESTAMP(0) WHERE entryID=626051;
UPDATE localnews.articles SET parsedDate = '2014-12-9 13:57'::TIMESTAMP(0) WHERE entryID=626052;
UPDATE localnews.articles SET parsedDate = '2015-4-19 17:18'::TIMESTAMP(0) WHERE entryID=626041;
UPDATE localnews.articles SET parsedDate = '2015-11-11 10:24'::TIMESTAMP(0) WHERE entryID=626046;
UPDATE localnews.articles SET parsedDate = '2015-4-12 16:05'::TIMESTAMP(0) WHERE entryID=626048;
UPDATE localnews.articles SET parsedDate = '2017-12-18 10:21'::TIMESTAMP(0) WHERE entryID=626050;

DELETE FROM localnews.articles WHERE date_part('YEAR', parsedDate) = 2023;

UPDATE localnews.articles SET author='Rod Paige' WHERE entryId=598141;
UPDATE localnews.articles SET author=NULL WHERE author='Admission is free.'; -- 573141,411996
UPDATE localnews.articles SET author='Adrian Zahra' WHERE entryId=572363;
UPDATE localnews.articles SET author='AFP' WHERE author='AFP, AFP';
UPDATE localnews.articles SET author='Adriana Scicluna' WHERE entryId=610784;
UPDATE localnews.articles SET author='Alan Deidun' WHERE author LIKE 'Alan Deidun%';
UPDATE localnews.articles SET author='Albert W Agius' WHERE author LIKE 'Albert W Agius%';
UPDATE localnews.articles SET author='Albert W. Agius' WHERE author LIKE 'Albert W Agius%';
UPDATE localnews.articles SET author='Albert W. Agius' WHERE author LIKE 'Albert W. Agius%';
UPDATE localnews.articles SET author='Alexei Pace' WHERE author LIKE 'Alexei Pace%';
UPDATE localnews.articles SET author='Andrew Borg' WHERE author LIKE 'Andrew Borg%';
UPDATE localnews.articles SET author='Anthony R. Mangion' WHERE author LIKE 'Anthony R. Mangion%';
UPDATE localnews.articles SET author=NULL WHERE entryid=176417;
UPDATE localnews.articles SET author=NULL WHERE author='By  -';
UPDATE localnews.articles SET author=REPLACE(author,' -', '') WHERE author LIKE '% -';
UPDATE localnews.articles SET author='Cecilia Vella' WHERE author LIKE 'Cecilia Vella%';
UPDATE localnews.articles SET author='Charles Debono' WHERE author LIKE 'Charles Debono%';
UPDATE localnews.articles SET author=NULL WHERE author ='com.mt.';
UPDATE localnews.articles SET author=NULL WHERE author ='cruise';
UPDATE localnews.articles SET author='Don McKinnon' WHERE author ='Commonwealth Secretary-General Don McKinnon';
UPDATE localnews.articles SET author='Cynthia Busuttil' WHERE author IN ('Cynthia Busutti', 'Cynthia Bususttil', 'Cynthia Busutiil', 'Cynthia Busutil', 'Cynthia Busutill' ,'Cynthia Busutti' ,'Cynthia Busuttil');
UPDATE localnews.articles SET author=NULL WHERE entryID=405852;
UPDATE localnews.articles SET author=NULL WHERE entryID=603039;
UPDATE localnews.articles SET author=NULL WHERE author='eleonoray86cws Ca?uana';
UPDATE localnews.articles SET author=NULL WHERE entryId=581413;
UPDATE localnews.articles SET author='George Cini' WHERE author IN ('George Cini' ,'George Cini.');
UPDATE localnews.articles SET author='Herbert Messina-Ferrante' WHERE author ='Herbert Messina Ferrante';
UPDATE localnews.articles SET author='Herman Grech' WHERE author ='Herman Grech.';
UPDATE localnews.articles SET author='Herman Grech, Mark Micallef' WHERE author IN ('Herman Grechand Mark Micallef', 'Herman Grech and Mark Micallef');
UPDATE localnews.articles SET author=NULL WHERE entryId=325320;
UPDATE localnews.articles SET author='Ibn Campusino' WHERE author IN ('Ibn Campsino', 'ibn Campusino', 'Ibn Campusino', 'IBN Campusino', 'IBN CAMPUSINO' ,'Ibn Capusino' );
UPDATE localnews.articles SET author='Isabelle Vella-Gregory' WHERE author ='Isabelle Vella Gregory';
UPDATE localnews.articles SET author='Ivan Camilleri' WHERE author IN ('Ivan Camileri', 'Ivan Camill;eri', 'Ivan Camiller', 'Ivan Camilleri.');
UPDATE localnews.articles SET author='Malcolm Scerri-Ferrante' WHERE author IN ('Malcolm Scerri Ferrante');
UPDATE localnews.articles SET author=NULL WHERE entryId=321566;
UPDATE localnews.articles SET author=NULL WHERE entryId=590064;
UPDATE localnews.articles SET author=NULL WHERE entryId=375963;
UPDATE localnews.articles SET author=NULL WHERE author IN ('national');
UPDATE localnews.articles SET author=NULL WHERE author IN ('No one was injured.');
UPDATE localnews.articles SET author=NULL WHERE author LIKE 'Photo: %';
UPDATE localnews.articles SET author=NULL WHERE author LIKE 'Picture: %';
UPDATE localnews.articles SET author=NULL WHERE entryId=598712;
UPDATE localnews.articles SET author='Reuters' WHERE author LIKE 'Rueters';
UPDATE localnews.articles SET author=NULL WHERE author='Staff Reporter';
UPDATE localnews.articles SET author=NULL WHERE author='Staff';
UPDATE localnews.articles SET author=REPLACE(author,'Staff Reporter / ', '') WHERE author LIKE 'Staff Reporter %';
UPDATE localnews.articles SET author=NULL WHERE author IN('The Award', 'The case continues.', 'The damaged lava paving cannot be replaced.', 'The debate continues.' ,'The European Movement' ,'The free car wash offered at the Attard Youth Fest 2002', 'The Hypogeum in Tarxien', 'The kissing marathon underway at Bay Street yesterday. Photo: Jason Borg', 'The little grebe adult and, right, chick. Photos: Ray Galea.', 'The Mosta dome lit up at festa time', 'The new high performance British sports car, the Westfield Speed Sport 1800', 'The Radisson Ballroom', 'The scarifying of two parts of Zebbug Road leading from Rabat to Zebbug and Qormi was started last week.', 'The winning team exhibiting their alien species project (from left) Brandon Lee Pullicino, Daniel Calleja, Science teacher Judith Smith, Mark Galea, Jocelyn Daja and Mark Jones.','This and forthcoming articles on MGSS-sponsored research are presented in collaboration with the National Commission for Higher Education.');
UPDATE localnews.articles SET author=NULL WHERE author IN('Times of Malta', 'Times of Malta, AFP', 'Times of Malta, Press Release');
UPDATE localnews.articles SET author=REPLACE(author,'AFP, ', '') WHERE author LIKE 'AFP, %';
UPDATE localnews.articles SET author=NULL WHERE author IN('AFP');
UPDATE localnews.articles SET author=REPLACE(author,'Times of Malta, ', '') WHERE author LIKE 'Times of Malta, %';
UPDATE localnews.articles SET author=NULL WHERE author IN('Times of Malta');
UPDATE localnews.articles SET author=NULL WHERE author IN('UK resident Marika Gatt Sacco gives a first hand account of the cold snap in the North East of England', 'uniontac@gmail.com');
UPDATE localnews.articles SET author=REPLACE(author,'By ', '') WHERE author LIKE 'By %';

UPDATE localnews.articles
SET article = REGEXP_REPLACE(article, 'Aqra bil-\nMalti','')
WHERE source = 'TVM';

UPDATE localnews.articles
SET article = REGEXP_REPLACE(article, '(?<!http|https|www)\.(?=[^.]*$).*$', '.', 'g')
WHERE source = 'TVM';

UPDATE localnews.articles
SET article = REGEXP_REPLACE(article, 'See also:https?://[^\s]+$', '', 'g')
WHERE source = 'TVM';

UPDATE localnews.articles
SET article = REGEXP_REPLACE(article, 'Also see:https?://[^\s]+$', '', 'g')
WHERE source = 'TVM';
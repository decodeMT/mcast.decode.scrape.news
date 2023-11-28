
-- add a new column that will store an array of the authors
ALTER TABLE localnews.articles 
ADD author2 TEXT[];

-- add a field to store authors without affecting original authors,
-- can be deleted afterwards
ALTER TABLE localnews.articles
ADD author_temp VARCHAR(500);

UPDATE localnews.articles
SET author_temp = author;

UPDATE localnews.articles
SET author_temp = lower(author);

-- start cleaning

UPDATE localnews.articles SET author_temp = 'correspondent'
WHERE author_temp IN ('a correspondent','a special correspondent','our correspondent', 'special correspondent');

UPDATE localnews.articles SET author_temp = 'reporter'
WHERE author_temp IN ('a staff reporter','our reporters','staff reporter');

UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,', head of school','')
WHERE author_temp LIKE '%head of school%';

UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,', md, ph.d.','')
WHERE author_temp LIKE '%, md, ph.d.%';

UPDATE localnews.articles
SET author_temp = 'alfie sultana peregin'
WHERE author_temp = 'alfie sultana peregin, complementary teacher at st elmo primary school, valletta, and patri guz&egrave; delia primary, siggiewi.';

UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,', assistant head','')
WHERE author_temp LIKE '%, assistant head%';

UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,', university of malta','')
WHERE author_temp LIKE '%, university of malta%';

UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,', junior 6 class teacher','')
WHERE author_temp LIKE '%junior 6 class teacher%';


UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,', ksu president','')
WHERE author_temp LIKE '%, ksu president%';

UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,', project co-ordinator','')
WHERE author_temp LIKE '%project co-ordinator%';

UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,', ksu','')
WHERE author_temp LIKE '%ksu%';

UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,' in london','')
WHERE author_temp LIKE '% in london';

UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,' in surrey','')
WHERE author_temp LIKE '% in surrey';

UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,' in the hague','')
WHERE author_temp LIKE '% in the hague';


UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,', london','')
WHERE author_temp LIKE '%, london';

UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,'; stagno','')
WHERE author_temp LIKE '%; stagno';

UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,', foi president','')
WHERE author_temp LIKE '%, foi president';

UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,'masa','massa')
WHERE author_temp LIKE '% masa%';

UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,' in athens','')
WHERE author_temp LIKE '% in athens';

UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,' in beijing','')
WHERE author_temp LIKE '% in beijing';

UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,' in belgrade','')
WHERE author_temp LIKE '% in belgrade';

UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,' in brussels','')
WHERE author_temp LIKE '% in brussels';

UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,' in copenhagen','')
WHERE author_temp LIKE '% in copenhagen';

UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,' in doha','')
WHERE author_temp LIKE '% in doha';

UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,' in frankfurt','')
WHERE author_temp LIKE '% in frankfurt';

UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,' in guiyang, china','')
WHERE author_temp LIKE '% in guiyang%';

UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,' in helsinki','')
WHERE author_temp LIKE '% in helsinki';

UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,' in istanbul','')
WHERE author_temp LIKE '% in istanbul';

UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,' in kiev','')
WHERE author_temp LIKE '% in kiev%';

UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,' in kuwait','')
WHERE author_temp LIKE '% in kuwait';

UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,' in latvia','')
WHERE author_temp LIKE '% in latvia';

UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,' in moscow','')
WHERE author_temp LIKE '% in moscow';

UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,' in paris','')
WHERE author_temp LIKE '% in paris';

UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,', belgrade','')
WHERE author_temp LIKE '% , belgrade';

UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,', brussels','')
WHERE author_temp LIKE '% , brussels';

UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,', doha','')
WHERE author_temp LIKE '% , doha';

UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,', frankfurt','')
WHERE author_temp LIKE '% , frankfurt';


UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,', lisbon','')
WHERE author_temp LIKE '% , lisbon';

UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,', moscow','')
WHERE author_temp LIKE '% , moscow';

UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,', rome','')
WHERE author_temp LIKE '% , rome';

UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,'massa.','massa')
WHERE author_temp LIKE '%massa.';

UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,'/',',')
WHERE author_temp LIKE 'ariadne massa/juan ameen';

UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,'(left) with the director of gallery k',',')
WHERE author_temp LIKE '%(left) with the director of gallery k%';

UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,', spokeswoman for flimkien ghal ambjent ahjar.',',')
WHERE author_temp LIKE '%spokeswoman for flimkien ghal ambjent ahjar.';

UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,', subject co-ordinator (mathematics)','')
WHERE author_temp LIKE '%subject co-ordinator (mathematics)';

UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,', assistant head of school','')
WHERE author_temp LIKE '%assistant head of school';

UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,', english subject co-ordinator','')
WHERE author_temp LIKE '%english subject co-ordinator';

UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,', university of hull','')
WHERE author_temp LIKE '%university of hull';


UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,', foi executive - information and communications','')
WHERE author_temp LIKE '%foi executive - information and communications';

UPDATE localnews.articles
SET author_temp = NULL
WHERE author_temp = 'certainly, not making hay... photo: darrin zammit lupi.';

UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,', sdb','')
WHERE author_temp LIKE '%, sdb';

UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,' department of technology in education','')
WHERE author_temp LIKE '% department of technology in education';

UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,' communications office','')
WHERE author_temp LIKE '% communications office';

UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,' president','')
WHERE author_temp LIKE '% president';


UPDATE localnews.articles
SET author_temp = 'anthony manduca'
WHERE author_temp = 'anthony mandua';

UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,', belgrade','')
WHERE author_temp LIKE '%, belgrade';

UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,', brussels','')
WHERE author_temp LIKE '%, brussels';

UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,', doha','')
WHERE author_temp LIKE '%, doha';


UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,', frankfurt','')
WHERE author_temp LIKE '%, frankfurt';

UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,', lisbon','')
WHERE author_temp LIKE '%, lisbon';


UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,', moscow','')
WHERE author_temp LIKE '%, moscow';


UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,', rome','')
WHERE author_temp LIKE '%, rome';

UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,' of school','')
WHERE author_temp LIKE '%of school';

UPDATE localnews.articles
SET author_temp = 'chris mangion , paul cocks'
WHERE author_temp ='chris mangion / paul cocks';

UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,', brussels','')
WHERE author_temp LIKE '%, brussels';

UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,', chairman, science-on-stage - malta','')
WHERE author_temp LIKE '%, chairman, science-on-stage - malta';


UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,', science co-ordinator for church schools','')
WHERE author_temp LIKE '%, science co-ordinator for church schools';


UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,',  brussels','')
WHERE author_temp LIKE '%,  brussels';


UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,'  brussels','')
WHERE author_temp LIKE '%  brussels';

UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,', copenhagen','')
WHERE author_temp LIKE '%, copenhagen';

UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,', oslo','')
WHERE author_temp LIKE '%, oslo';

UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,', tripoli','')
WHERE author_temp LIKE '%, tripoli';

UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,' in bordeaux','')
WHERE author_temp LIKE '%in bordeaux';

UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,', class teachers','')
WHERE author_temp LIKE '%, class teachers';

UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,' in prague','')
WHERE author_temp LIKE '%in prague';

UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,', ma','')
WHERE author_temp LIKE '%, ma';

UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,' / ',',')
WHERE author_temp LIKE '% / %';

UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,' in colombo, sri lanka','')
WHERE author_temp LIKE '% in colombo, sri lanka';

UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,' in galle, sri lanka','')
WHERE author_temp LIKE '% in galle, sri lanka';

UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,', l''aquila, italy','')
WHERE author_temp LIKE '%l''aquila, italy';

UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,', misurata','')
WHERE author_temp LIKE '%misurata';

UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,', nairobi, kenya','')
WHERE author_temp LIKE '%, nairobi, kenya';

UPDATE localnews.articles
SET author_temp = 'dr anthony pace'
WHERE author_temp = 'dr anthony pace, director, department of museums, on behalf of all the staff';


UPDATE localnews.articles
SET author_temp = 'dr hubert dalli'
WHERE author_temp = 'dr hubert dalli, secretary-general, european movement (malta)';


UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,', school head','')
WHERE author_temp LIKE '%, school head';

UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,', sociologist','')
WHERE author_temp LIKE '%, sociologist';

UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,', for executive','')
WHERE author_temp LIKE '%, for executive';

UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,', foi legal affairs executive','')
WHERE author_temp LIKE '%, foi legal affairs executive';

UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,', victoria, gozo','')
WHERE author_temp LIKE '%, victoria, gozo';

UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,', junior associate at azzopardi, borg and associates advocates','')
WHERE author_temp LIKE '%, junior associate at azzopardi, borg and associates advocates';

UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,' was counsel to the defendants.','')
WHERE author_temp LIKE '% was counsel to the defendants.';

UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,', vice-principal and co-ordinator, louise-otto-peters-school','')
WHERE author_temp LIKE '%, vice-principal and co-ordinator, louise-otto-peters-school';

UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,', maltacom''s financial director, formed part of the maltese delegation in cyprus.','')
WHERE author_temp LIKE '%, maltacom''s financial director, formed part of the maltese delegation in cyprus.';


UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,', mic deputy head','')
WHERE author_temp LIKE '%, mic deputy head';

UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,', national','')
WHERE author_temp LIKE '%, national';


UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,', first year student','')
WHERE author_temp LIKE '%, first year student';


UPDATE localnews.articles
SET author_temp = 'emanuel attard, emmanuel zahra'
WHERE author_temp = 'emanuel attard (left) and emmanuel zahra at the facult&eacute; des metiers de l''essonne.';

UPDATE localnews.articles
SET author_temp = NULL
WHERE author_temp= 'entrance is free.';

UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,', year 6 teacher','')
WHERE author_temp LIKE '%, year 6 teacher';


UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,' in bologna','')
WHERE author_temp LIKE '%in bologna';

UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,' in piacenza','')
WHERE author_temp LIKE '%in piacenza';

UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,' in rome','')
WHERE author_temp LIKE '%in rome';


UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,' in strasbourg','')
WHERE author_temp LIKE '%in strasbourg';


UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,', kandinsky college','')
WHERE author_temp LIKE '%, kandinsky college';


UPDATE localnews.articles
SET author_temp = NULL
WHERE author_temp = 'chinese market.';

UPDATE localnews.articles
SET author_temp = 'chris tanti'
WHERE author_temp = 'chris tanthi';

UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,', berlin','')
WHERE author_temp LIKE '%, berlin';

UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,', wasteserv malta ltd.','')
WHERE author_temp LIKE '%, wasteserv malta ltd.';

UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,', wasteserv malta ltd.','')
WHERE author_temp LIKE '%, wasteserv malta ltd.';


UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,', foi executive','')
WHERE author_temp LIKE '%, foi executive';

UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,', foi executive','')
WHERE author_temp LIKE '%, foi executive';


UPDATE localnews.articles
SET author_temp = 'edward rizzo'
WHERE author_temp IN ('edward rizzo director rizzo farrugia and co (stockbrokers) limited',
'edward rizzo, director,  rizzo, farrugia and co (stockbrokers) limited',
'edward rizzo, director, rizzo, farrugia and co (stockbrokers) limited');

UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,',  national','')
WHERE author_temp LIKE '%,  national';


UPDATE localnews.articles
SET author_temp  = 'cecilia vella'
WHERE author_temp IN ('federation of industry executive cecilia vella', 'foi executive cecilia vella');


UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,', lourdes','')
WHERE author_temp LIKE '%, lourdes';

UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,', ofm conv.','')
WHERE author_temp LIKE '%, ofm conv.';

UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,', osa','')
WHERE author_temp LIKE '%, osa';


UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,', sj college rector','')
WHERE author_temp LIKE '%, sj college rector';

UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,', peripatetic primary science teacher','')
WHERE author_temp LIKE '%, peripatetic primary science teacher';

UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,', president, physically handicapped rehabilitation fund.','')
WHERE author_temp LIKE '%, president, physically handicapped rehabilitation fund.';

UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,' in abuja, nigeria','')
WHERE author_temp LIKE '%in abuja, nigeria';


UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,' in newfoundland','')
WHERE author_temp LIKE '% in newfoundland';


UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,' science co-ordinator, st augustine college','')
WHERE author_temp LIKE '% science co-ordinator, st augustine college';

UPDATE localnews.articles
SET author_temp = NULL
WHERE author_temp = 'gonzi meets libyan rebel council member';


UPDATE localnews.articles
SET author_temp = REPLACE(author_temp,', an old boy','')
WHERE author_temp LIKE '%, an old boy';


-- Replace commas


UPDATE localnews.articles
SET author_temp = REPLACE(author_temp, ' and ', ',');

UPDATE localnews.articles
SET author_temp = REPLACE(author_temp, ',,', ',');



-- Check distinct values

SELECT DISTINCT (author_temp)
FROM localnews.articles ORDER BY 1 ASC;



-- Copy strings to array column


UPDATE localnews.articles
SET author2 = string_to_array(author_temp, ',');

SELECT  *
FROM localnews.articles
LIMIT 1000;


SELECT  *
FROM localnews.articles
WHERE 'kurt sansone' = ANY(author2);

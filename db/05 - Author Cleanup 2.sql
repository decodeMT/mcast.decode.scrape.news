-- Cleanup
UPDATE localnews.articles SET author_temp= 'foi' WHERE author_temp='f.o.i';

UPDATE localnews.articles SET author_temp = REPLACE(author_temp, '&igrave;', 'ì');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, '&egrave;', 'è');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, '&eacute;', 'é');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, '&ccedil;', 'ç');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, '&agrave;', 'à');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, '&auml;', 'ä');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, '&ograve;', 'ò');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, '&igrave;', 'ì');

UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ' in bonn', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ' in cairo', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ' in jerusalem', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ' in johannesburg, south africa', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ' in kairouan, tunisia', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ' in nicosia', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ' in portoroz, slovenia', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ' in sibiu, romania', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', cairo', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', vatican city', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', wilton park.', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', ba (educ.), deam (m.ed. student)', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', mcast student, council president', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', mcast student, council secretary general', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', st aloysius'' college sixth form', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', sixth form assistant head', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ' in nantes', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ' in lancashire', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ' in geneva', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', pro, marsa scout group', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', analyst within the financial stability function at the mfsa', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', b.sc., m.sc., miirsm, miosh, mbcs', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', class teacher', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, 'steve mallia.', 'steve mallia');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ' in washington', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ' in sydney', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ' in melbourne', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ' in dubai', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ' in canberra', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ' in adelaide', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', b.ed. (hons), dip. librarianship', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', a/head', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', humanities co-ordinator,history teacher, san andrea senior school', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', jerusalem', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', bethlehem', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', year 3 teacher', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', teacher of english', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', vice-chairman, european movement', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ' - year 6 pupils at st benedict college''s carmelo caruana primary school, safi', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', dsh', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, 'abela head', 'abela');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, 'zammit head', 'zammit');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, 'corkscrew at the eden ice arena', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', amsterdam', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', u3e', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ' institute of health,safety', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', cct news', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ' in new york', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', literacy support teacher', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', school pro', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ' brussels', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ' in brussels', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ' in ,', ',');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ' in lisbon', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ' in ljubljana, slovenia', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ' in luxembourg', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ' in marseille', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ' in porto', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ' in vienna', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ' is strasbourg', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', ,', ',');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', cairo, egypt', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', luxembourg', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', madrid', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', paris', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', prague', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', starsbourg', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', stockholm', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', strasbourg', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', tallinn', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ' in algiers', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', junior associate at azzopardi, borg,associates', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ' in budapest', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ' in porto carras, greece', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ' in seville', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', shanghai', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', warsaw', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', b.ed. (hons), pe teacher, san andrea early school', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', director, quality schools international malta', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', st paul''s bay', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', president, foundation for human resources development', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', de la salle sixth form', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', st paul''s bay youth mayor', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', parent ecocouncillor', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', learning assistant, year 5', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', teacher/project co-ordinator', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', director of information,support services.', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', b.a. (hons) tourism studies, second year', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, '  in dalian, china', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ' in dalian, china', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ' in madrid', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', strasbourg', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ' de la salle college senior school', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', federation of industry executive', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ' in berlin', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ' in jerusalem', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ' in madrid', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ' in ramallah', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ' in tripoli', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', jerusalem', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ' jerusalem', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, '-malta', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ' (form v)', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, 'labour mp ', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', prime minister', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', klabb tal-bizzilla maltija', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', malta council for science,technology', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', parent', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', ba(hons), b.ed.(queens), mba (leicester)', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', afm', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, 'philip leone ganado', 'philip leone-ganado');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ' ceo, foundation for human resources development', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', ceo, fhrd', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', fhrd', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', uniform committee facilitator', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ' reporting from cannes', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', year 3 teacher', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ' st joseph school, blata l-bajda.', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ' ceo, fhrd', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', ceo', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', ceo, fhrd', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', chief executive officer', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', chief executive officer, fhrd', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', chief executive officer, foundation for human resources development', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', fhrd ceo', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', principal health promotion officer, health promotion department', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', school pro', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', head, de la salle college, junior school', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', m.ed.', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ' in abu dhabi', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ' in doha, qatar', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ' in luxembourg', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ' in kampala, uganda', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ' in kampala', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ' in ragusa', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', abu dhabi', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', bahrain', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', benghazi', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', brega', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', doha, qatar', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', kuwait city', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', kuwait', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', naples', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, 'mark micallef.', 'mark micallef');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ' in milan', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ' in palermo', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', the vatican', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', co-ordinating teacher', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', parent-member of the school council', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', lecturer, institute of building,construction engineering, mcast', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', malta standards authority', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ' in brno', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ' in tripoli', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ' in vienna', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, 'massimo farrugia.', 'massimo farrugia');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', law, third year', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ' vice-president', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ' in ,rosanne zammit', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ' in lisbon', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', stuttgart', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', warsaw', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, 'melissa macelhatton', 'melissa mcelhatton');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', minister of tourism', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ' in tunis', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', sixth form, st aloysius'' college', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', b.psy. (hons.)', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', teachers at msida primary school', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', b.ed. (hons)', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', b.com., pgce', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', manager, public programmes, heritage malta', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', school pro', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, 'ms m. bartolo head', 'ms m. bartolo');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', ceo, foundation for human resources development', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', school webmistress', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ' in auckland', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ' in canberra', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ' in dubai', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ' in melbourne', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ' in sydney', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ' in wellington', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', information secretary, european movement', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', teacher of english', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', b.ed. (hons), m.ed', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', cct news', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', siggiewi primary c', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', acting head', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', from the vat department''s legal section, prosecuted.', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', ll.d., ll.m. (london), ph.d. (cambridge) is professor of european,comparative law in the faculty of law at the university of malta. he is also chairman of the university of malta''s european documentation,research centre, which is', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', lecturer, institute of community services, mcast', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ' in stockholm', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, 'philip leone ganado,  phi', 'philip leone-ganado');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, 'philip leone ganado,  philip leone-ganado', 'philip leone-ganado');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, 'philip leone ganado', 'philip leone-ganado');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ' (president of the nationalist party''s administrative council).', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, 'press release,  ', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ',architects ', ', ');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', head of the metallurgy,materials engineering department, showing one of the exhibits.', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', european movement (malta)', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ' social policy co-ordinator', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ' in vienna', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', headmaster', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', teacher of maltese, european school, luxembourg', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', school counsellor', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', year 4 teacher', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', ekoskola co-ordinator', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ' subject co-ordinator', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', co-ordinator gew', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', project manager,group leader', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', geography co-ordinator', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', subject co-ordinator, geography', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', ninu cremona lyceum complex', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', shape-up project member', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', central information management unit', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ' in berlin', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ' in sirte', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ' in tripoli', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', ict teacher', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', year 3 teacher at st albert the great college', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', assistant director of education', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', link teacher, st theresa girls'' junior lyceum, mriehel', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', sdb, headmaster, savio college, dingli', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', afp', '');
UPDATE localnews.articles SET author_temp = REPLACE(author_temp, ', the old mysterious nun who is afraid to part with her past secrets.', '');
UPDATE localnews.articles SET author_temp = NULL WHERE author_temp='promotional material for lowenbrau''s 10th anniversary';

UPDATE localnews.articles SET author_temp = NULL WHERE author_temp='karmenu mifsud bonnici, laying flowers at the independence monument in floriana.';
UPDATE localnews.articles SET author_temp = NULL WHERE author_temp='kevin casha''s winning digital print';
UPDATE localnews.articles SET author_temp = NULL WHERE author_temp='scientist';
UPDATE localnews.articles SET author_temp = NULL WHERE author_temp='kristina chetcuti reporting - err, shoulder high - from ta qali';

UPDATE localnews.articles SET author_temp = 'j.a. mizzi' WHERE author_temp='j.a.mizzi';
UPDATE localnews.articles SET author_temp = 'maurice tanti burlò' WHERE author_temp='maurice tanti burlo’';
UPDATE localnews.articles SET author_temp = 'nataša pantović' WHERE author_temp IN ('natasa pantovic', 'nataša pantovic');
UPDATE localnews.articles SET author_temp = 'malcolm j. naudi' WHERE author_temp IN ('malcolm j.naudi', 'malcolm naudi');
UPDATE localnews.articles SET author_temp = 'castelain' WHERE author_temp IN ('castelain', 'castelian', 'castlain', 'castleain', 'castlelain');
UPDATE localnews.articles SET author_temp = 'sarah carabott' WHERE author_temp IN ('sarah carabot', 'sarah carabott');
UPDATE localnews.articles SET author_temp = 'waylon johnston' WHERE author_temp IN ('waylon johnson', 'waylon johnston', 'waylon johnston’');

UPDATE localnews.articles SET author_temp=NULL 
WHERE author_temp IN 
    ('air-malta','all are welcome.','ap news','correspondent','edu-choice','edu first','edu health','edu ii','euroepan movement','european movement',
    'foi','fhrd','ibn campusino','info@set.com.mt','inkwina','l.j.s.',
    'm.c.w.o. delegates, from left: anna borg, dr romina bartolo,kate bonello sullivan with ewl president kirsti kolthoff (second from right) at the ewl general assembly','malta-eu information centre',
    'nasa','newsbook','newsroom staff','p.x.','pa media','press digest','press release','press release,  press','pro-culture','pro-diversity','pro-eu directives','pro-harmonisation','pro-language',
    'pro-new graduates','pro-science','pro democracy','pro europe','pro libris','pro tertiary education',
    'reporter','restoration of comino tower','students studying at the swatar training centre,who are sponsored by maltacom.','the malta press club','v.w-l.');

UPDATE localnews.articles SET author_temp='céline abela' WHERE author_temp='cé;line abela';
UPDATE localnews.articles SET author_temp='edwina brincat' WHERE author_temp='edwina brincat, times of malta';
UPDATE localnews.articles SET author_temp='frank a. tabone' WHERE author_temp='frank a.tabone';
UPDATE localnews.articles SET author_temp='giulia magri' WHERE author_temp='giulia magri,  giu';
UPDATE localnews.articles SET author_temp='stefan de marco' WHERE author_temp='ing. stefan de marco, b.eng. (hons)';
UPDATE localnews.articles SET author_temp='ingrid buhagiar' WHERE author_temp='ingrid buhagiar, ll.d.';
UPDATE localnews.articles SET author_temp='ivan camilleri' WHERE author_temp='ivan camilleri in brussles';
UPDATE localnews.articles SET author_temp='ivan camilleri, mark micallef' WHERE author_temp='ivan camilleri in, mark micallef';
UPDATE localnews.articles SET author_temp='ivan camilleri, nikki abela mercieca' WHERE author_temp='ivan camilleri in, nikki abela mercieca';
UPDATE localnews.articles SET author_temp='ivan camilleri,cynthia busuttil' WHERE author_temp='ivan camilleri in,cynthia busuttil';

UPDATE localnews.articles SET author_temp=NULL WHERE author_temp='air';
UPDATE localnews.articles SET author_temp=NULL WHERE author_temp='press';
UPDATE localnews.articles SET author_temp=REPLACE(author_temp,'profs. ','');
UPDATE localnews.articles SET author_temp=REPLACE(author_temp,'professor ',''); 
UPDATE localnews.articles SET author_temp='ivan camilleri' WHERE author_temp='ivan camilleri, egypt';
UPDATE localnews.articles SET author_temp='ivan camilleri' WHERE author_temp='ivan camilleri,brussels';
UPDATE localnews.articles SET author_temp='jennifer mifsud, marlene galea' WHERE author_temp='jennifer mifsud, marlene galea for sbs radio';
UPDATE localnews.articles SET author_temp='jonathan micallef' WHERE author_temp='jonathan micallef youth mayor';
UPDATE localnews.articles SET author_temp='joseph cuschieri' WHERE author_temp='joseph cuschieri mep';
UPDATE localnews.articles SET author_temp='julia grech' WHERE author_temp='julia grech, b.a. (hons) tourism studies, second year';
UPDATE localnews.articles SET author_temp='justin cauchi' WHERE author_temp='justin cauchi, biologist';
UPDATE localnews.articles SET author_temp='lara buttigieg' WHERE author_temp='lara buttigieg, form 4a, st francis secondary sliema';
UPDATE localnews.articles SET author_temp='marcette pulè, maria bugeja' WHERE author_temp='marcette pulè;, maria bugeja';
UPDATE localnews.articles SET author_temp='maria pia' WHERE author_temp='maria pia chircop ceo';
UPDATE localnews.articles SET author_temp='maria pia' WHERE author_temp='maria pia chircop, foundation for human resources development';
UPDATE localnews.articles SET author_temp='marthese matusiak' WHERE author_temp='marthese matusiak-member of the school council';
UPDATE localnews.articles SET author_temp='matthew xuereb,rosanne zammit' WHERE author_temp='matthew xuereb in,rosanne zammit';
UPDATE localnews.articles SET author_temp='matthew xuereb' WHERE author_temp='matthew xuereb, hamburg';
UPDATE localnews.articles SET author_temp='charles psaila' WHERE author_temp='mr charles psaila, guardamangia';
UPDATE localnews.articles SET author_temp='pierre cassar' WHERE author_temp='mr pierre cassar';
UPDATE localnews.articles SET author_temp='g. formosa' WHERE author_temp='mrs g. formosa';
UPDATE localnews.articles SET author_temp='a. galea' WHERE author_temp='ms a. galea, teacher';
UPDATE localnews.articles SET author_temp='m. bartolo' WHERE author_temp='ms m. bartolo';
UPDATE localnews.articles SET author_temp='maria pia chircop' WHERE author_temp='ms maria pia chircop,';
UPDATE localnews.articles SET author_temp='r. borg magro' WHERE author_temp='ms r. borg magro';
UPDATE localnews.articles SET author_temp='natalino fenech' WHERE author_temp='natalino fenech.';
UPDATE localnews.articles SET author_temp='ninette pace balzan' WHERE author_temp='ninette pace balzan, m.ed';
UPDATE localnews.articles SET author_temp='reno saliba' WHERE author_temp='reno saliba, teacher of maltese, european school';
UPDATE localnews.articles SET author_temp='rose dingli' WHERE author_temp='rose dingli at st albert the great college';
UPDATE localnews.articles SET author_temp='sandro camilleri' WHERE author_temp='sandro camilleri, sdb, savio college, dingli';
UPDATE localnews.articles SET author_temp='anthony h. gioia' WHERE author_temp='us ambassador anthony h. gioia';

UPDATE localnews.articles
SET author_temp = REPLACE(author_temp, ',,', ',');

-- Check distinct values
SELECT DISTINCT (author_temp)
FROM localnews.articles ORDER BY 1 ASC;

-- Copy strings to array column
UPDATE localnews.articles
SET author2 = string_to_array(author_temp, ',');

-- Research
SELECT DISTINCT author_temp FROM localnews.articles WHERE author_temp LIKE '%carmelina grech pro, u3e%';
SELECT DISTINCT author_temp FROM localnews.articles WHERE author_temp LIKE 'maurice tanti burl%';
SELECT author_temp, COUNT(*) FROM localnews.articles WHERE author_temp IN ('philip leone-ganado') GROUP BY author_temp;

SELECT COUNT(*) FROM localnews.articles WHERE author_temp LIKE '%foi%';

SELECT author_temp, COUNT(*)
FROM localnews.articles
WHERE author_temp IN 
    ('air-malta','all are welcome.','ap news','correspondent','edu-choice','edu first','edu health','edu ii','euroepan movement','european movement',
    'foi','fhrd','ibn campusino','info@set.com.mt','inkwina','l.j.s.',
    'm.c.w.o. delegates, from left: anna borg, dr romina bartolo,kate bonello sullivan with ewl president kirsti kolthoff (second from right) at the ewl general assembly','malta-eu information centre',
    'nasa','newsbook','newsroom staff','p.x.','pa media','press digest','press release','press release,  press','pro-culture','pro-diversity','pro-eu directives','pro-harmonisation','pro-language',
    'pro-new graduates','pro-science','pro democracy','pro europe','pro libris','pro tertiary education',
    'reporter','restoration of comino tower','reuters','students studying at the swatar training centre,who are sponsored by maltacom.','the malta press club','v.w-l.')
GROUP BY author_temp
ORDER BY 1 ASC;


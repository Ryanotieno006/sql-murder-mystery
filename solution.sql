SELECT * FROM crime_scene_report
WHERE type='murder' AND city='SQL City'
ORDER BY date ASC LIMIT 1; 

SELECT * FROM person
WHERE address_street_name ='Northwestern Dr'
ORDER BY address_number DESC LIMIT 1;

SELECT * FROM person
WHERE name LIKE '%Annabel%' AND address_street_name ='Franklin Ave';

SELECT p.name, i.transcript
FROM person p
JOIN interview i ON p.id=i.person_id
WHERE p.id IN (14887, 16371);            
			
SELECT g.person_id, g.name, g.id
FROM get_fit_now_member g
WHERE g.id LIKE '48Z%';

SELECT p.name, d.plate_number, d.car_make
FROM person p
JOIN drivers_license d ON p.license_id=d.id
WHERE p.name IN ('Tomas Bailey', 'Joe Germuska', 'Jeremy Bowers');
	
INSERT INTO solution VALUES(1, 'Jeremy Bowers');
SELECT * FROM solution;	

SELECT i.transcript, p.name
FROM interview i
JOIN person p ON i.person_id=p.id
WHERE p.name ='Jeremy Bowers';

SELECT p.name, p.id
FROM person p
JOIN drivers_license dl ON p.license_id = dl.id
JOIN income i ON p.ssn = i.ssn
JOIN facebook_event_checkin fb ON p.id = fb.person_id
WHERE 
    dl.gender = 'female'
    AND dl.hair_color = 'red'
    AND dl.car_make = 'Tesla'
    AND dl.car_model = 'Model S'
    AND dl.height BETWEEN 65 AND 67
    AND fb.event_name = 'SQL Symphony Concert'
    AND fb.date BETWEEN 20171201 AND 20171231
GROUP BY p.id
HAVING COUNT(*) >= 3;

INSERT INTO solution VALUES (1, 'Miranda Priestly');
SELECT value FROM solution;


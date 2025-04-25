# sql-murder-mystery
# SQL Murder Mystery Case Solution
 
*Case solved by [Ryan otieno] on [23/4/2025]*

##  Case Overview
Solved the SQL City murder mystery by analyzing database clues, witness statements, and connecting evidence across multiple tables.

##  Step-by-Step Investigation

### 1. Crime Scene Analysis
```sql
SELECT * FROM crime_scene_report
WHERE type='murder' AND city='SQL City'
ORDER BY date ASC LIMIT 1;
```
- Identified the murder case details and witness information

### 2. Witness Identification
```sql
-- First witness (last house on Northwestern Dr)
SELECT * FROM person
WHERE address_street_name ='Northwestern Dr'
ORDER BY address_number DESC LIMIT 1;

-- Second witness (Annabel on Franklin Ave)
SELECT * FROM person
WHERE name LIKE '%Annabel%' AND address_street_name ='Franklin Ave';
```

### 3. Witness Interviews
```sql
SELECT p.name, i.transcript
FROM person p
JOIN interview i ON p.id=i.person_id
WHERE p.id IN (14887, 16371);
```
- Key clues: Gym membership starting with "48Z" and Tesla car

### 4. Suspect Identification
```sql
SELECT g.person_id, g.name, g.id
FROM get_fit_now_member g
WHERE g.id LIKE '48Z%';
```

### 5. Vehicle Evidence
```sql
SELECT p.name, d.plate_number, d.car_make
FROM person p
JOIN drivers_license d ON p.license_id=d.id
WHERE p.name IN ('Tomas Bailey', 'Joe Germuska', 'Jeremy Bowers');
```

### 6. Murderer Confirmation
```sql
INSERT INTO solution VALUES(1, 'Jeremy Bowers');
SELECT * FROM solution;
```

### 7. Uncovering the Mastermind
```sql
SELECT i.transcript, p.name
FROM interview i
JOIN person p ON i.person_id=p.id
WHERE p.name ='Jeremy Bowers';

-- Found the real villain:
SELECT p.name, p.id
FROM person p
JOIN drivers_license dl ON p.license_id = dl.id
/* ... full query ... */;

INSERT INTO solution VALUES (1, 'Miranda Priestly');
SELECT value FROM solution;
```

##  Key SQL Skills Demonstrated
| Skill | Example Queries |
|-------|----------------|
| JOIN Operations | Connected person, interview, and drivers_license tables |
| Pattern Matching | Used `LIKE '48Z%'` for gym membership search |
| Subqueries | Nested queries to filter suspects |
| Date Filtering | `BETWEEN` for concert dates |

##  Lessons Learned
1. How to methodically analyze database clues
2. The power of JOINs in connecting evidence
3. Importance of witness statement analysis
4. Real-world application of SQL in investigations

##  Future Improvements
- [ ] Add visual schema diagram
- [ ] Include query execution screenshots
- [ ] Create case timeline visualization

> "The data never lies - you just have to ask the right questions."  
> *- SQL Detective [Ryan otieno]*

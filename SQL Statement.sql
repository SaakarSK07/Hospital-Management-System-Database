
-- what is the age group of most of the patients?
SELECT DATEDIFF(year,pat_dob,GETDATE()) Age, count(*) pat_count FROM [Hospital_System.Patient]
GROUP BY DATEDIFF(year,pat_dob,GETDATE())
ORDER BY count(*) DESC

-- which department has the most doctors?
SELECT o. dep_ID AS 'Department ID' , d. dep_Name AS 'Department Name', count(*) AS 'Number of Doctor'
FROM [Hospital_System.Dept] d,[Hospital_System.Doctor] o
WHERE d.dep_ID=o.dep_ID
GROUP BY o.dep_ID, d.dep_Name
ORDER BY 'Number of Doctor' DESC

-- what kind of room is preferred by most patients?
SELECT rom_Type AS 'Room Prefered', COUNT(pat_ID) AS 'Number of Patients'
FROM [Hospital_System.Room]
GROUP BY rom_Type


-- which doctor prescribed the most medicines? 
SELECT d.doc_ID, CONCAT (d.doc_FirstName,' ' ,d.doc_LastName) AS 'Doctor Name',  COUNT(distinct med_ID) AS count_med 
FROM [Hospital_System.Doctor] d, [Hospital_System.Medicine] m
WHERE d.doc_ID = m.doc_ID
GROUP BY d.doc_ID, CONCAT (d.doc_FirstName,' ' ,d.doc_LastName)
ORDER BY COUNT(DISTINCT med_ID) DESC


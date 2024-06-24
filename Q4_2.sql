-- Quels cours ont eu le plus d'étudiants en échec lors des derniers
-- semestres de 2021 et 2020 ?

WITH l_semester_2020 AS
(
SELECT 
	COUNT(g.student_id) as nb_students_failed,
  	YEAR(g.date) as annee,
  	MONTH(g.date) as month,
    c.course_name
from	
	grades as g
left join courses as c on(c.course_id=g.course_id) 
WHERE g.grade < '50' and (MONTH(g.date) BETWEEN '7' and '12') and YEAR(g.date)='2020'
group by c.course_name
order by nb_students_failed DESC
)
,
l_semester_2021 AS
(
SELECT 
	COUNT(g.student_id) as nb_students_failed,
  	YEAR(g.date) as annee,
  	MONTH(g.date) as month,
    c.course_name
from	
	grades as g
left join courses as c on(c.course_id=g.course_id) 
WHERE g.grade < '50' and (MONTH(g.date) BETWEEN '7' and '12') and YEAR(g.date)='2021'
group by c.course_name
order by nb_students_failed DESC
)
SELECT
	annee as last_semester_of,
	max(l_semester_2020.nb_students_failed) as nb_students_failed,
    l_semester_2020.course_name
    
from 
	l_semester_2020 
UNION 
SELECT 
	annee as last_semester_of,
	MAx(l_semester_2021.nb_students_failed) as nb_students_failed,
    l_semester_2021.course_name
From 
	l_semester_2021
-- Quels cours ont eu le plus d'étudiants en échec lors du dernier
-- semestre de 2021 ?



with g_c AS
(
SELECT 
	g.student_id,
  	YEAR(g.date) as annee,
  	MONTH(g.date) as month,
    g.grade,
  	c.course_id,
    c.course_name
from	
	grades as g
left join courses as c on(c.course_id=g.course_id) 
HAVING annee like '2021' and month between '7' and '12'
)
SELECT
	g_c.course_name,
    COUNT(g_c.student_id) as nb_students_failed
FROM 
	g_c
WHERE 
	g_c.grade < '50'
GROUP by g_c.course_id
ORDER by nb_students_failed DESC

    


-- Pour chaque étudiant, récupérez le nom de l'étudiant, sa spécialité,
-- et le nombre de cours auxquels il est inscrit, ainsi qu'un classement
-- des étudiants par le nombre de cours auxquels ils sont inscrits.
-- L'étudiant avec le plus de cours devrait être classé 1, et les étudiants
-- avec le même nombre de cours devraient être classés avec le même numero

SELECT 
    s.student_name,
    s.major,
    COUNT(DISTINCT(g.course_id)) as nb_cours_engage,
    DENSE_RANK() OVER(Order by nb_cours_engage desc) as rnk
   
from 
	student as s
    LEFT join grades as g on(g.student_id=s.student_id)
GROUP by s.student_name

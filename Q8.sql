-- Pour chaque étudiant, récupérez le nom de l'étudiant, sa spécialité,
-- et le nombre de cours auxquels il est inscrit.

SELECT
	s.student_id,
    s.student_name,
    s.major,
    COUNT(DISTINCT(g.course_id)) as nb_cours_engage
from 
	student as s
    LEFT join grades as g on(g.student_id=s.student_id)
GROUP by s.student_id

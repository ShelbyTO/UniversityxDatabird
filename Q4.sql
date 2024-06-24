-- Quel est le nom et la spécialité (major) de chaque étudiant inscrit en
-- économy 1 ?

SELECT
	major,
    student_name,
    c.course_id
from student as s
	left JOIN grades as g on(g.student_id=s.student_id)
    left join courses as c on(c.course_id=g.course_id)
where c.course_id='21'
GROUP by student_name



-- Quels étudiants sont inscrits dans au moins un cours enseigné par
-- un enseignant comportant “Smith” dans son nom ?

SELECT
	student_name,
    t.teacher_name
from 
	student as s
	LEFT join grades as g on(g.student_id=s.student_id)
    LEFT join courses as c on(c.course_id=g.course_id)
    left join offering as o on(o.course_id=g.course_id)
    LEFT join teachers as t on(t.teacher_id=o.teacher_id)
WHERE t.teacher_name like '%Smith%'
group by student_name


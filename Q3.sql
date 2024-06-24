-- Combien de cours chaque enseignant propose-t-il ?

select 
	teacher_name,
    COUNT(course_id) as nb_courses_offering
from 
	teachers as t
    left join offering as o using(teacher_id)
group by teacher_name

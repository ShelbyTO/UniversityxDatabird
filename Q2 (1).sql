-- Quel est le nom de chaque cours proposé, et qui l'enseigne ?

select 
	DISTINCT(course_name),
    teacher_name
from 
	courses as c
    left join offering as o on(o.course_id=c.course_id)
    left join teachers as t on(t.teacher_id=o.teacher_id)
    
group by course_name


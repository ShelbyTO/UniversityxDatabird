-- Quels cours sont proposés dans le bâtiment 'Science' ?

SELECT 
	course_name,
    cl.building
from courses as c
	LEFT join offering as o on(o.course_id=c.course_id)
    LEFT join classroom as cl on(cl.classroom_id=o.classroom_id)
WHERE cl.building='Science'
group by course_name

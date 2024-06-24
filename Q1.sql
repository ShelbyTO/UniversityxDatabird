-- Combien d'étudiants sont inscrits dans chaque cours ?

select 
	course_name as cours,
  	COUNT(student_id) as total_student
from 
	student
    left join grades using(student_id)
    LEFT join courses using(course_id)
WHERE course_name is not NULL
group by course_name





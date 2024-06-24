-- Quel est le nombre d'étudiants réussissant et échouant dans chaque
-- cours, classés par le nombre d'étudiants en échec en ordre
-- décroissant ?

with stat_per_students as 
(
select 	
    c.course_name as c_name,
    g.student_id as s_id,
    case when g.grade < '50' then 'failed'
    else 'succeed'
    end as stat_per_courses   	
from	
	grades as g
left join 
	courses as c on(c.course_id=g.course_id) 
order by 
	stat_per_courses
)
,
stat_per_failed AS
(
SELECT 
	COUNT(stat_per_courses) OVER(PARTITION by c_name order by c_name) as stat_failed,
    c_name,
    stat_per_courses as f_stat_per_courses
from stat_per_students
where stat_per_courses='failed'
)
,
stat_per_succeed AS
(
SELECT 
	COUNT(stat_per_courses) OVER(PARTITION by c_name order by c_name) as stat_succeed,
    c_name,
    stat_per_courses as s_stat_per_courses
from stat_per_students
where stat_per_courses='succeed'
)

select 
	DISTINCT(c_name) as course,
    stat_failed as nb_failed,
    stat_succeed as nb_succeed
from
	stat_per_failed left join stat_per_succeed using(c_name)
order by nb_failed DESC


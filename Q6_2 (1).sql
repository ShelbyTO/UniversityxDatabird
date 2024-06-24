-- Quel est le cours le plus difficile, en utilisant un ratio d'échec ?

SELECT 
	course,
	nb_failed,
    nb_succeed,
    ROUND((nb_failed/(nb_failed+nb_succeed))*100, 2) as failed_ratio
From 
	failed_succeed
order by failed_ratio DESC
Limit 3
select u.id
	,u.first_name
	,u.last_name
	,u.phone
	,coalesce(u.sex,um.sex) as sex
	,u.birth_date
from {{source('scooters_raw','users')}} as u
left join {{ref("first_name_sex")}} as um
on u.first_name = um.first_name
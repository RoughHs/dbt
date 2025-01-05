with cte as ( 
select started_at::date as date
	 ,extract('year' from t.started_at) - extract('year' from u.birth_date) as age
	 ,count(1) as cnt_trips
from scooters_raw.trips as t
join scooters_raw.users as u
on t.user_id = u.id
group by started_at::date , extract('year' from t.started_at) - extract('year' from u.birth_date)
)
select age
      ,avg(cnt_trips) as trips_stat_age
from cte
group by age
order by age
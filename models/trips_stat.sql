select count(1) as trips
	  ,count(distinct user_id) as users
	  ,avg(extract(epoch from (finished_at - started_at))) / 60 as avg_duration_m 
	  ,sum(price) / 100 as revenue_rub
	  ,((select count(1) from scooters_raw.trips where price = 0)::float / count(1)) * 100 as free_trips_pct
FROM scooters_raw.trips
select count(1) as trips
	  ,count(distinct user_id) as users
	  ,avg(duration_s) / 60 as avg_duration_m 
	  ,sum(price_rub) as revenue_rub
	  ,count(is_free or null) / cast(count(*) as real) * 100 as free_trips_pct
	  ,sum(distance_m / 1000) as sum_distance_km
FROM {{ ref("trips_prep") }}
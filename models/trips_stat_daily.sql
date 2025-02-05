select date
 	  ,count(1) as trips
 	  ,max(price_rub) / 100 as max_price_rub 
 	  ,avg(distance_m) / 1000 as avg_distance_km
	  ,avg(price_rub) / avg(duration_s) * 60 as avg_price_rub_per_min
FROM {{ ref('trips_prep') }}
group by date
order by date
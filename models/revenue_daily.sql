select date
      ,now() at time zone 'utc' as updated_at
	  ,sum(price_rub) as revenue_rub
from {{ ref('trips_prep') }}
{% if is_incremental() %}
where
    date >= (select max(date) - interval '2' day from {{ this }})
{% endif %}
group by 1,2
order by date
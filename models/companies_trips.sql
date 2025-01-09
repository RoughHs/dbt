with models as (
select c.company
	  ,s.hardware_id
from {{ ref("companies") }} as c
join {{ ref("scooters") }} as s
on c.company = s.company
),
cnt_trips as (
select m.company
      ,count(1) as trips
from {{ ref("trips_prep") }} as tp
left join models as m
on tp.scooter_hw_id = m.hardware_id
group by m.company
)
select ct.company
      ,ct.trips
      ,c.scooters
      ,ct.trips / cast(c.scooters as float) as trips_per_scooter
from cnt_trips as ct
left join {{ ref("companies") }} as c
on ct.company = c.company


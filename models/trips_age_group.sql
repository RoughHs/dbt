select ag.group
      ,count(1) as trips
      ,sum(price_rub) as revenue_rub
from {{ref("trips_users")}} as tu
left join {{ref('age_groups')}} as ag
on tu.age between ag.age_start and age_end
group by ag.group
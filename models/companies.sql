select company
      ,count(model) as models
      ,count(scooters) as scooters
from {{ ref("scooters") }}
group by company
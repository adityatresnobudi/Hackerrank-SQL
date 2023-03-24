select distinct city
from STATION
where city regexp '^[aeiouAEIOU].*'
order by city;

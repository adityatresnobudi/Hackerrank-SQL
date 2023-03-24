(select city, length(city)
from STATION
order by length(city) desc, city asc 
limit 1)
union
(select city, length(city)
from STATION
order by length(city) asc, city asc 
limit 1);

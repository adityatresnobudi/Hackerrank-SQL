select round(long_w, 4)
from STATION
where lat_n < 137.2345
order by lat_n desc
limit 1;

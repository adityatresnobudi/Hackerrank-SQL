select truncate(max(lat_n), 4) as max_lat_n
from STATION
where lat_n < 137.2345;

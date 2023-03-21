select distinct city
from STATION
where mod(ID,2) = 0;

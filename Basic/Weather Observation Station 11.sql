select distinct city
from STATION
where city not regexp '^[aeiouAEIOU].*' or city not regexp '^.*[aeiouAEIOU]$';

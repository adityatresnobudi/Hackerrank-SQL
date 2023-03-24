select 
    round(lat_n,4) 
from 
    (select 
        row_number() over(order by lat_n) as med,
        lat_n 
     from station) x 
where x.med = (select round(count(*)/2)
                from station)

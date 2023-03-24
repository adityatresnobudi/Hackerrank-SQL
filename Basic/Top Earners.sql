select months*salary as total_earnings, count(months*salary)
from Employee
group by total_earnings
order by total_earnings desc
limit 1;

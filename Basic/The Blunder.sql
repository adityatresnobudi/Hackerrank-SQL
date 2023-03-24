select ceil(avg(salary) - avg(replace(salary,'0',''))) as dif_salary
from EMPLOYEES;

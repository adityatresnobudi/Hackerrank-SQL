select 
    name_o
from
    (
        select concat(name, '(', left(occupation, 1), ')') as name_o
        from occupations
    ) as table1 
union
select
    count_o 
from
    (
        select concat('There are a total of ', count(occupation),' ', lower(occupation), 's.') as count_o
        from occupations 
        group by occupation 
        order by count(occupation), occupation asc
    ) as table2
order by name_o;

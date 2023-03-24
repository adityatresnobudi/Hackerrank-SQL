select
    case when grades.grade > 7 then students.name else NULL end as Names,
    grades.grade,
    students.marks
from students
join grades on students.marks between grades.min_mark and grades.max_mark
order by grades.grade desc, Names asc, students.marks asc;

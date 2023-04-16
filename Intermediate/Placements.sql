SELECT s.name
FROM students AS s 
INNER JOIN friends AS f ON s.ID = f.ID
INNER JOIN packages AS p1 ON s.ID = p1.ID
INNER JOIN packages AS p2 ON f.friend_ID = p2.ID
WHERE p2.salary > p1.salary
ORDER BY p2.salary;

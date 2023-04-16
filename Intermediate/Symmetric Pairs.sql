SELECT
    X, Y
FROM 
    functions as f1
WHERE EXISTS
(
    SELECT * 
    FROM functions AS f2
    WHERE f2.Y = f1.X AND f2.X = f1.Y AND f2.X > f1.X
) AND (X != Y)
UNION
SELECT 
    X,Y
FROM
    functions AS f1
WHERE X = Y AND ((SELECT COUNT(*)
                  FROM functions
                  WHERE X = f1.X AND Y = f1.X) > 1)
ORDER BY X;

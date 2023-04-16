SELECT
    w.id,
    wp.age,
    w.coins_needed,
    w.power
FROM
    wands AS w
INNER JOIN wands_property AS wp ON w.code = wp.code
WHERE wp.is_evil = 0 AND w.coins_needed = (SELECT MIN(x.coins_needed)
                                          FROM wands AS x
                                          INNER JOIN wands_property AS y
                                           ON x.code = y.code
                                          WHERE x.power = w.power AND y.age = wp.age)
ORDER BY w.power DESC, wp.age DESC;

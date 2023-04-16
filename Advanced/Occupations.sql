SELECT
    Doctor,
    Professor,
    Singer,
    Actor
FROM 
(
    SELECT
        NameOrder,
        MAX(CASE occupation WHEN 'Doctor' THEN name END) AS Doctor,
        MAX(CASE occupation WHEN 'Professor' THEN name END) AS Professor,
        MAX(CASE occupation WHEN 'Singer' THEN name END) AS Singer,
        MAX(CASE occupation WHEN 'Actor' THEN name END) AS Actor
    FROM
    (
        SELECT
            occupation,
            name,
            ROW_NUMBER() OVER(PARTITION BY occupation ORDER BY name ASC) AS NameOrder
        FROM occupations
    ) AS NameLists
    GROUP BY NameOrder
) as names

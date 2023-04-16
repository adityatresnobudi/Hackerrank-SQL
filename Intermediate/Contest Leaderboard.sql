SELECT 
    h.hacker_id, 
    h.name, 
    t1.total_score
FROM
(
    SELECT hacker_id, SUM(max_score) AS total_score
    FROM 
    (
        SELECT hacker_id, MAX(score) AS max_score
        FROM submissions
        GROUP BY hacker_id, challenge_id
    ) AS t
    GROUP BY hacker_id
) AS t1
INNER JOIN hackers AS h ON h.hacker_id = t1.hacker_id
WHERE t1.total_score != 0
ORDER BY total_score DESC, h.hacker_id;

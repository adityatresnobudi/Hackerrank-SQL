SELECT
    h.hacker_id,
    h.name,
    COUNT(c.challenge_id) AS c_count
FROM
    hackers AS h
INNER JOIN challenges AS c ON h.hacker_id = c.hacker_id
GROUP BY h.hacker_id, h.name
HAVING c_count = 
    (
      SELECT COUNT(c2.challenge_id) AS c_max
      FROM challenges AS c2
      GROUP BY c2.hacker_id
      ORDER BY c_max DESC
      LIMIT 1
    )
    OR c_count IN
    (
      SELECT c_compare
      FROM
        (
          SELECT h2.hacker_id, h2.name, COUNT(challenge_id) AS c_compare
          FROM hackers as h2
          INNER JOIN challenges AS c ON c.hacker_id = h2.hacker_id
          GROUP BY h2.hacker_id, h2.name
        ) AS counts
      GROUP BY c_compare
      HAVING COUNT(c_compare) = 1
    )
ORDER BY COUNT(c.challenge_id) DESC, h.hacker_id

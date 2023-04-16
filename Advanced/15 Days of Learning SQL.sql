SELECT
    submission_date,
    (
      SELECT COUNT(DISTINCT hacker_id)  
      FROM submissions AS s2
      WHERE s2.submission_date = s1.submission_date AND (SELECT COUNT(DISTINCT s3.submission_date)
                                                        FROM submissions AS s3
                                                        WHERE s3.hacker_id = s2.hacker_is AND s3.submission_date < s1.submission_date) = DATEDIFF(s1.submission_date , '2016-03-01')
    ),
    (
      SELECT hacker_id
      FROM submissions AS s2
      WHERE s2.submission_date = s1.submission_date 
      GROUP BY hacker_id 
      ORDER BY COUNT(submission_id) DESC, hacker_id 
      LIMIT 1
    ) AS tmp,
    (
      SELECT name 
      FROM hackers 
      WHERE hacker_id = tmp
    )
FROM
(
    SELECT DISTINCT submission_date 
    FROM submissions) AS s1
GROUP BY submission_date;

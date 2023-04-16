SELECT 
    a.contest_id,
    a.hacker_id,
    a.name,
    SUM(total_submissions) AS total_submissions, 
    SUM(total_accepted_submissions) AS total_accepted_submissions,
    SUM(total_views) AS total_views,
    SUM(total_unique_views) AS total_unique_views
FROM
    contests AS a
LEFT JOIN colleges AS b ON a.contest_id = b.contest_id
LEFT JOIN challenges AS c ON b.college_id = c.college_id 
LEFT JOIN (SELECT challenge_id, SUM(total_views) AS total_views, 
                  SUM(total_unique_views) AS total_unique_views
           FROM view_stats
           GROUP BY challenge_id) AS d 
    ON c.challenge_id = d.challenge_id 
LEFT JOIN (SELECT challenge_id, SUM(total_submissions) AS total_submissions, 
                  SUM(total_accepted_submissions) AS total_accepted_submissions
           FROM submission_stats
           GROUP BY challenge_id) AS e
    ON c.challenge_id = e.challenge_id
GROUP BY a.contest_id, a.hacker_id, a.name
HAVING (total_submissions + total_accepted_submissions + total_views + total_unique_views) > 0 
ORDER BY a.contest_id;

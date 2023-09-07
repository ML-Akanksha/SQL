SELECT * FROM yourdb.ipl_ball_by_ball_2008_2022;

- ### find the top 5 batsman in IPL

SELECT batter,
SUM(batsman_run) AS 'total_runs'
FROM yourdb.ipl_ball_by_ball_2008_2022
GROUP BY batter
ORDER BY total_runs DESC
LIMIT 5;

- ### find the 2nd highest six hitter in IPL

SELECT batter,
COUNT(*) AS 'num_of_sixex'
FROM yourdb.ipl_ball_by_ball_2008_2022
WHERE batsman_run = 6
GROUP BY batter
ORDER BY num_of_sixex DESC
LIMIT 1,1;

- ### find top 10 batsman with centuries in IPL

SELECT batter,ID,
SUM(batsman_run) AS 'runs'
FROM yourdb.ipl_ball_by_ball_2008_2022
GROUP BY batter, ID
HAVING runs >= 100
ORDER BY batter DESC;

- ### find the top 5 batsman with highest strike rate who have played a minimum of 1000 balls

SELECT batter,SUM(batsman_run),COUNT(batsman_run),
ROUND((SUM(batsman_run)/COUNT(batsman_run))* 100,2) AS 'sr'
FROM yourdb.ipl_ball_by_ball_2008_2022
GROUP BY batter
HAVING COUNT(batsman_run) > 1000
ORDER BY sr DESC
LIMIT 5;
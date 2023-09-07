SELECT * FROM sql_cx_live.user_1 t1
CROSS JOIN sql_cx_live.groups t2;

SELECT * FROM sql_cx_live.membership t1
INNER JOIN sql_cx_live.user_1 t2
ON t1.user_id = t2.user_id;

SELECT * FROM sql_cx_live.membership t1
LEFT JOIN sql_cx_live.user_1 t2
ON t1.user_id = t2.user_id;

SELECT * FROM sql_cx_live.membership t1
RIGHT JOIN sql_cx_live.user_1 t2
ON t1.user_id = t2.user_id;

/*SELECT * FROM sql_cx_live.membership t1
FULL OUTER JOIN sql_cx_live.user_1 t2
ON t1.user_id = t2.user_id;*/

/*SELECT * FROM sql_cx_live.membership t1
FULL JOIN sql_cx_live.user_1 t2
ON t1.user_id = t2.user_id;*/

SELECT * FROM sql_cx_live.membership t1
LEFT JOIN sql_cx_live.user_1 t2
ON t1.user_id = t2.user_id
UNION 
SELECT * FROM sql_cx_live.membership t1
RIGHT JOIN sql_cx_live.user_1 t2
ON t1.user_id = t2.user_id;
-- set operation : UNION, UNIONALL, INTERSCT, EXCEPT

SELECT * FROM sql_cx_live.person1
UNION
SELECT * FROM sql_cx_live.person2;

SELECT * FROM sql_cx_live.person1
UNION ALL
SELECT * FROM sql_cx_live.person2;

SELECT * FROM sql_cx_live.person1
INTERSECT
SELECT * FROM sql_cx_live.person2;

SELECT * FROM sql_cx_live.person1
EXCEPT
SELECT * FROM sql_cx_live.person2;

SELECT * FROM sql_cx_live.person2
EXCEPT
SELECT * FROM sql_cx_live.person1;
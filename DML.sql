select student_name
from student as s 
where s.level='SR'
AND s.student_id IN
(	select student_id 
 	from enrolled as e NATURAL JOIN semester_course as sc 
 	where sc.prof_id=1 
);


SELECT MAX(age) 
FROM student as s
WHERE s.age IN
(	SELECT age
	FROM student as s1
 	WHERE s1.major='History'
 	UNION
 	SELECT age
 	FROM student as s2 NATURAL JOIN enrolled as e2 NATURAL JOIN semester_course as sc2 NATURAL JOIN professor as p2
 	WHERE p2.prof_name= 'Michael Miller'
);


SELECT DISTINCT s.student_name,c.name
FROM student as s NATURAL LEFT JOIN (enrolled as e NATURAL JOIN course as c);


SELECT p.prof_name
FROM professor as p NATURAL JOIN semester_course
GROUP BY p.prof_id
HAVING COUNT(*)<5;


SELECT s.student_name 
FROM student as s NATURAL JOIN enrolled as e
where e.course_code= ALL 
( 
    SELECT sc1.course_code 
    FROM semester_course as sc1
    WHERE sc1.prof_id=2
);


SELECT * 
FROM course as c 
WHERE NOT EXISTS (
	SELECT * 
    FROM semester_course as sc1
    WHERE sc1.course_code=c.course_code
) OR c.course_code IN
(	SELECT sc2.course_code
 	FROM professor as p2 NATURAL JOIN semester_course as sc2 NATURAL JOIN department as d2
 	WHERE d2.dept_name='Computer Science'
);


SELECT s.student_name 
FROM student as s
WHERE s.student_name LIKE 'M%' AND s.age<20
UNION
SELECT p.prof_name
FROM professor as p NATURAL JOIN semester_course as sc
WHERE p.prof_name like 'M%'
GROUP BY p.prof_id
HAVING COUNT(*)>2;


SELECT p.prof_name,p.prof_id
FROM professor as p NATURAL LEFT JOIN semester_course as sc
WHERE p.dept_id in (1,2,3,4)
GROUP BY p.prof_id
HAVING COUNT(*)<2


SELECT student_name,prof_name
FROM (enrolled NATURAL RIGHT JOIN student) NATURAL left JOIN semester_course NATURAL left join professor
UNION 
SELECT student_name,prof_name
FROM (enrolled NATURAL RIGHT JOIN semester_course) NATURAL left JOIN student NATURAL left join professor
UNION
SELECT student_name,prof_name
FROM semester_course NATURAL RIGHT JOIN professor NATURAL LEFT JOIN enrolled NATURAL LEFT JOIN student
group by prof_id
HAVING count(course_code)=0;


SELECT c.name,c.course_code,p.prof_id,p.prof_name
FROM course as c NATURAL JOIN semester_course NATURAL JOIN professor as p
GROUP BY course_code,prof_id
HAVING count(*)>=2;



SELECT dept_name FROM department NATURAL LEFT JOIN professor NATURAL left JOIN semester_course group by (dept_id) HAVING count(*)<3;
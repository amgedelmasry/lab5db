CREATE SCHEMA CRPS;
use CRPS;
create TABLE department(
	dept_id varchar(15),
    dept_name varchar(30),
    PRIMARY KEY (dept_id)
);
create table student(
	student_id varchar(15),
    student_name varchar(30),
    major varchar(30),
    `level` varchar(15),
    age integer(3),
    PRIMARY KEY (student_id)
);
CREATE table professor(
	prof_id varchar(15),
    prof_name varchar(30),
    dept_id varchar(15),
    PRIMARY KEY (prof_id),
    FOREIGN KEY (dept_id) REFERENCES department(dept_id)
);
CREATE TABLE course(
	course_code varchar(15),
    name varchar(50),
    PRIMARY KEY (course_code)
);
CREATE TABLE semester_course(
	course_code varchar(15),
    quarter varchar(15),
    `year` int(4),
    prof_id varchar(15),
    PRIMARY key (course_code,quarter,`year`),
    FOREIGN KEY (course_code) REFERENCES course(course_code),
    FOREIGN KEY (prof_id) REFERENCES professor(prof_id)
);
CREATE TABLE enrolled(
	student_id varchar(15),
    course_code varchar(15),
    quarter varchar(15),
    `year` int(4),
    enrolled_at date,
    PRIMARY KEY (student_id,course_code,quarter,`year`),
    FOREIGN KEY (student_id) REFERENCES student(student_id),
    FOREIGN KEY (course_code,quarter,`year`) REFERENCES semester_course(course_code,quarter,`year`)
);

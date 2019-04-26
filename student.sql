DESCRIBE student;
-- add another column of gpa
ALTER TABLE student ADD gpa DECIMAL(3, 2);
ALTER TABLE student DROP COLUMN gpa;
INSERT INTO student VALUES(1, 'Jack', 'Biology');
INSERT INTO student VALUES(2, 'Kate', 'Sociology');

INSERT INTO student(student_id, name) VALUES(3, 'Claire');
INSERT INTO student VALUES(4, 'Jack', 'Biology');
INSERT INTO student VALUES(5, 'Mike', NULL);

-- 主键自动递增后，可以像下面这么做
INSERT INTO student(name, major) VALUES('God', 'Play');
INSERT INTO student(name, major) VALUES('Child', 'Fly');
INSERT INTO student(name, major) VALUES('Mike', 'Biology');
INSERT INTO student(name, major) VALUES('Jorge', 'Computer Science');
INSERT INTO student(name, major) VALUES('Kate', 'Python Full Stack');
INSERT INTO student(name, major) VALUES('Scott', 'Science Data');
INSERT INTO student(name, major) VALUES('Gando', 'Mathametic');
SELECT * FROM student;
DROP TABLE student;
CREATE TABLE student (
	student_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(20) NOT NULL,
    major VARCHAR(20) UNIQUE DEFAULT 'unchoosed'
);

UPDATE student SET major = 'Bio' WHERE major = 'Biology';
UPDATE student SET major = "Biochemistry" WHERE major = 'Bio' or major = 'Chemistry';
UPDATE student SET major = 'Sci Data' WHERE major = 'Science Data';

-- delete the row, you may not add the where clause and it all delete.
DELETE FROM student WHERE student_id = 2;

-- querys
-- for more details from which table,you can add table name before coulumn
SELECT name, major FROM student;
SELECT student.name, student.major FROM student ORDER BY student.name;
-- order by (DESC 降序 | ASC 升序)
SELECT * FROM student ORDER BY student_id DESC;
SELECT * FROM student ORDER BY major, student_id;
SELECT * FROM student ORDER BY student_id DESC LIMIT 5;

-- <, >, <>, or, and, >=, <=, = , IN, (where is like filter)
SELECT * FROM student WHERE major <> 'Sci Data' and major <> 'Python Full Stack';
select * from student where student_id < 5 and name <> 'God';
SELECT * FROM student WHERE name IN ('God', 'Gando', 'Kate');
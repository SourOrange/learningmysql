CREATE TABLE employee (
	emp_id INT PRIMARY KEY,
    first_name VARCHAR(40),
    last_name VARCHAR(40),
    birth_day DATE,
    sex VARCHAR(1),
    salary INT,
    -- super_id 是superviser上司, branch_id 是部门，俩个都是外键
    -- 因为还没有创建 branch , 所以暂时不能指定它们为外键
    super_id INT,
    branch_id INT
);

-- 当我们创建 branch 表后，才能执行employee 的添加外键
ALTER TABLE employee ADD FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE SET NULL;
ALTER TABLE employee ADD FOREIGN KEY(super_id) REFERENCES employee(emp_id) ON DELETE SET NULL;

CREATE TABLE branch (
	branch_id INT PRIMARY KEY,
    branch_name VARCHAR(40),
    mgr_id INT,
    mgr_start_date DATE,
    -- manager_id 也是外键，因为上面创建了 employee,所以可以像下面那么指定外键
    FOREIGN KEY(mgr_id) REFERENCES employee(emp_id) ON DELETE SET NULL
);

CREATE TABLE client (
	client_id INT PRIMARY KEY,
    client_name VARCHAR(40),
    branch_id INT,
    FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE SET NULL
);

CREATE TABLE works_with (
	emp_id INT,
    client_id INT,
    total_sales INT,
    PRIMARY KEY(emp_id, client_id),
    FOREIGN KEY(emp_id) REFERENCES employee(emp_id) ON DELETE CASCADE,
    FOREIGN KEY(client_id) REFERENCES client(client_id) ON DELETE CASCADE
);

CREATE TABLE branch_supplier (
	branch_id INT,
    supplier_name VARCHAR(40),
    supply_type VARCHAR(40),
    PRIMARY KEY(branch_id, supplier_name),
    FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE CASCADE
);



























---------------------------------------------------------------------------

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

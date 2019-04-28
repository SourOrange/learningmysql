# learningmysql
begining of mysql
<pre>
CREATE TABLE student (
    student_id INT PRIMARY KEY,
    name VARCHAR(20),
    major VARCHAR(20)
    -- PRIMARY KEY(student_id) 也可以这么做
);
</pre>
接着我们可以尝试执行一句， DESCRIBE student; 当然了，删除这个表，可以用 DROP TABLE student;
在后期中，如果要加多一列数据，可以使用 ALTER TABLE student ADD gpa DECIMAL(3, 2); 当我们加入这一列之后，你可以 describa student,查看多了一列，我们也可以继续删除这列，ALTER TABLE student DROP COLUMN gpa;<br>
当我们创建完一个表格后，我们需要插入数据吧，方法就是 <b>INSERT INTO student VALUES(1, 'Jack', 'Biology');</b> ，多次执行这个命令后，就有多个数据在表格里面了，如果有同学还没选择课程，那个可以这么做 <b>INSERT INTO student(student_id, name) VALUES(3, 'Claire');</b>, 这样就行了，表格会以 NULL 代替没选择的课程，你也可以往里面填上一样的名字和一样的科目，但是 student_id 就不能一样，为了进一步设置表格里面的 名字不能为空，课程不能一样，我们进一步对原来的表格做设置，首先因为是练习，我们 DROP TABLE student; 重新做一个表格。
<pre>
CREATE TABLE student (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(20) NOT NULL,
    major VARCHAR(20) UNIQUE
);
</pre>
你会发现，这次倘若输入的数据，课程名如果一样，就会出错的，另外如果我们要给定一个默认值，还可以这么设置 <b>major VARCHAR(20) UNIQUE DEFAULT 'undecided'</b>, 并且给主键加上 AUTO_INCREMENT 的话，你可以这么做 <b>INSERT INTO student(name, major) VALUES('Jack', 'Eat');</b>只需要把名字和课程换成其他的继续执行就可以了，主键会自动加上的。
<hr>
Update and delete,<b>UPDATE student SET major='Bio' WHERE major='Biology';</b>where在我看来等同于过滤出你要的具体内容。另外， where 后面的表达式可以跟上 or and 等等其他。<br>
<b>DELETE FROM student WHERE name='Jim';--删除的是该行的数据</b>
<br>
<b>query</b>,查询，通常和之前见到的 where,其实是挂钩的，或者可以理解为就是查询具体的数据。
<pre>
-- 后期如果有多个table,则为了 显而易见，我们可以加上 table 的名字，在各个列的前面
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
</pre>

<hr>
<h2>请查看 company_database, 那里说了创建和外键的设置，了解后，再来往下看</h2>
现在插入数据到每一个表中
<pre>
-- 因为 branch 还没定义，自然employee中的 branch_id 还没有，所以暂时设置为 NULL
INSERT INTO employee VALUES(100, 'David', 'Wallace', '1967-11-17', 'M', 250000, NULL, NULL);
-- 运行上面的命令后，我们可以先执行以下命令, 可以观察到加入了 branch 的数据
INSERT INTO branch VALUES(1, 'Corporate', 100, '2006-02-09');
-- 接着可以更新branch_id了
UPDATE employee SET branch_id = 1 WHERE emp_id = 100;
-- 下面最后一列可以写上 1， 因为 branch_id 为 1 的一列，上面 已经运行了
INSERT INTO employee VALUES(101, 'Jan', 'Levinson', '1961-05-11', 'F', 110000, 100, 1);

-- Scranton 这儿的逻辑和上面的是一样的
INSERT INTO employee VALUES(102, 'Michael', 'Scott', '1964-03-15', 'M', 75000, 100, NULL);
INSERT INTO branch VALUES(2, 'Scranton', 102, '1992-04-06');
UPDATE employee SET branch_id = 2 WHERE emp_id = 102;
INSERT INTO employee VALUES(103, 'Angela', 'Martin', '1971-06-25', 'F', 63000, 102, 2);
INSERT INTO employee VALUES(104, 'Kelly', 'Kapoor', '1980-02-05', 'F', 55000, 102, 2);
INSERT INTO employee VALUES(105, 'Stanley', 'Hudson', '1958-02-19', 'M', 69000, 102, 2);

-- Stanford 
INSERT INTO employee VALUES(106, 'Josh', 'Porter', '1969-09-05', 'M', 78000, 100, NULL);
INSERT INTO branch VALUES(3, 'Stamford', 106, '1998-02-13');
UPDATE employee SET branch_id = 3 WHERE emp_id = 106;
INSERT INTO employee VALUES(107, 'Andy', 'Bernard', '1973-07-22', 'M', 65000, 106, 3);
INSERT INTO employee VALUES(108, 'Jim', 'Halpert', '1978-10-01', 'M', 71000, 106, 3);

-- Branch_supplier table
INSERT INTO branch_supplier VALUES(2, 'Hammer Mill', 'Paper');
INSERT INTO branch_supplier VALUES(2, 'Uni-ball', 'Writing Utensils');
INSERT INTO branch_supplier VALUES(3, 'Patriot Paper', 'Paper');
INSERT INTO branch_supplier VALUES(2, 'J.T. Forms & Labels', 'Custom Forms');
INSERT INTO branch_supplier VALUES(3, 'Uni-ball', 'Writing Utensils');
INSERT INTO branch_supplier VALUES(3, 'Hammer Mill', 'Paper');
INSERT INTO branch_supplier VALUES(3, 'Stamford Labels', 'Custom Forms');

-- Client table
INSERT INTO client VALUES(400, 'Dunmore Highschool', 2);
INSERT INTO client VALUES(401, 'Lackawana Country', 2);
INSERT INTO client VALUES(402, 'FedEx', 3);
INSERT INTO client VALUES(403, 'John Daly Law, LLC', 3);
INSERT INTO client VALUES(404, 'Scranton Whitepages', 2);
INSERT INTO client VALUES(405, 'Times Newspaper', 3);
INSERT INTO client VALUES(406, 'FedEx', 2);

-- Works_With table
INSERT INTO works_with VALUES(105, 400, 55000);
INSERT INTO works_with VALUES(102, 401, 267000);
INSERT INTO works_with VALUES(108, 402, 22500);
INSERT INTO works_with VALUES(107, 403, 5000);
INSERT INTO works_with VALUES(108, 403, 12000);
INSERT INTO works_with VALUES(105, 404, 33000);
INSERT INTO works_with VALUES(107, 405, 26000);
INSERT INTO works_with VALUES(102, 406, 15000);
INSERT INTO works_with VALUES(105, 406, 130000);
</pre>
<b>在插入完所有数据后，我们可以进一步查询，</b>
<pre>
-- after populate all the tables , more queries example coming down;
SELECT * FROM employee ORDER BY salary DESC;

-- order by anycolumn, the other column
SELECT * FROM employee ORDER BY sex, first_name, last_name;
SELECT * FROM employee ORDER BY salary DESC LIMIT 5;
-- select * from employee limit 5, 只要5个

-- 只要first_name和last_name
SELECT first_name, last_name FROM employee;

-- 可以用 as 替换列名
SELECT first_name as forename, last_name as surname FROM employee;

-- find out all the different genders(sex) will turns out M, F
SELECT DISTINCT sex FROM employee;
-- 除了 distinct sex之外，你可以尝试其他的列，比如 branch_id

-- Function
-- Find the number of employees, 可以通过emp_id查看有多少人，因为emp_id是每一个人唯一的
SELECT COUNT(emp_id) FROM employee;

-- 查看 1970 后出生 和 性别为 女 的人数有多少？
SELECT COUNT(emp_id) FROM employee WHERE sex = 'F' and birth_day > '1970-01-01';

-- find the average of all employee's salaries;
SELECT AVG(salary) FROM employee WHERE sex = 'M';

-- find the sum of all employee's salary;
SELECT SUM(salary) FROM employee;

-- aggregation 合计 使用group by 分组
SELECT COUNT(sex), sex FROM employee GROUP BY sex;

-- 查看每个销售人员总的销售
SELECT SUM(total_sales), emp_id FROM works_with GROUP BY emp_id;

-- 查看每个客户人员的消费额
SELECT SUM(total_sales), client_id FROM works_with GROUP BY client_id;
</pre>

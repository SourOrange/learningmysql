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

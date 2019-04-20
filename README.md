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
在后期中，如果要加多一列数据，可以使用 ALTER TABLE student ADD gpa DECIMAL(3, 2); 当我们加入这一列之后，你可以 describa student,查看多了一列，我们也可以继续删除这列，ALTER TABLE student DROP COLUMN gpa;

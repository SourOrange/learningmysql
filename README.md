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
    student_id INT PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    major VARCHAR(20) UNIQUE
);
</pre>
你会发现，这次倘若输入的数据，课程名如果一样，就会出错的，另外如果我们要给定一个默认值，还可以这么设置 <b>major VARCHAR(20) UNIQUE DEFAULT 'undecided'</b>

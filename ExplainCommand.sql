mysql> explain insert into studentInfo(firstName,lastName,class,age) values("Dnyanesh","Gawade","cs",24);
+----+-------------+-------------+------------+------+---------------+------+---------+------+------+----------+-------+
| id | select_type | table       | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra |
+----+-------------+-------------+------------+------+---------------+------+---------+------+------+----------+-------+
|  1 | INSERT      | studentInfo | NULL       | ALL  | NULL          | NULL | NULL    | NULL | NULL |     NULL | NULL  |
+----+-------------+-------------+------------+------+---------------+------+---------+------+------+----------+-------+




mysql> explain select * from studentInfo;
+----+-------------+-------------+------------+------+---------------+------+---------+------+------+----------+-------+
| id | select_type | table       | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra |
+----+-------------+-------------+------------+------+---------------+------+---------+------+------+----------+-------+
|  1 | SIMPLE      | studentInfo | NULL       | ALL  | NULL          | NULL | NULL    | NULL |    4 |   100.00 | NULL  |
+----+-------------+-------------+------------+------+---------------+------+---------+------+------+----------+-------+





mysql> explain select firstName, class from studentInfo where studentId=4;
+----+-------------+-------+------------+------+---------------+------+---------+------+------+----------+--------------------------------+
| id | select_type | table | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra                          |
+----+-------------+-------+------------+------+---------------+------+---------+------+------+----------+--------------------------------+
|  1 | SIMPLE      | NULL  | NULL       | NULL | NULL          | NULL | NULL    | NULL | NULL |     NULL | no matching row in const table |
+----+-------------+-------+------------+------+---------------+------+---------+------+------+----------+--------------------------------+




mysql> explain select age from studentInfo where firstname="saumya" and class="mech";
+----+-------------+-------------+------------+------+---------------+------+---------+------+------+----------+-------------+
| id | select_type | table       | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra       |
+----+-------------+-------------+------------+------+---------------+------+---------+------+------+----------+-------------+
|  1 | SIMPLE      | studentInfo | NULL       | ALL  | NULL          | NULL | NULL    | NULL |    4 |    25.00 | Using where |
+----+-------------+-------------+------------+------+---------------+------+---------+------+------+----------+-------------+






mysql> explain select firstName,lastName from studentInfo where class="cs" or class="it";
+----+-------------+-------------+------------+------+---------------+------+---------+------+------+----------+-------------+
| id | select_type | table       | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra       |
+----+-------------+-------------+------------+------+---------------+------+---------+------+------+----------+-------------+
|  1 | SIMPLE      | studentInfo | NULL       | ALL  | NULL          | NULL | NULL    | NULL |    4 |    43.75 | Using where |
+----+-------------+-------------+------------+------+---------------+------+---------+------+------+----------+-------------+





mysql> explain select firstName,lastName from studentInfo where not class="it";
+----+-------------+-------------+------------+------+---------------+------+---------+------+------+----------+-------------+
| id | select_type | table       | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra       |
+----+-------------+-------------+------------+------+---------------+------+---------+------+------+----------+-------------+
|  1 | SIMPLE      | studentInfo | NULL       | ALL  | NULL          | NULL | NULL    | NULL |    4 |    75.00 | Using where |
+----+-------------+-------------+------------+------+---------------+------+---------+------+------+----------+-------------+





mysql> explain select firstName,lastName from studentInfo order by age asc;
+----+-------------+-------------+------------+------+---------------+------+---------+------+------+----------+----------------+
| id | select_type | table       | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra          |
+----+-------------+-------------+------------+------+---------------+------+---------+------+------+----------+----------------+
|  1 | SIMPLE      | studentInfo | NULL       | ALL  | NULL          | NULL | NULL    | NULL |    4 |   100.00 | Using filesort |
+----+-------------+-------------+------------+------+---------------+------+---------+------+------+----------+----------------+






mysql> explain select firstName,lastName from studentInfo order by age desc;
+----+-------------+-------------+------------+------+---------------+------+---------+------+------+----------+----------------+
| id | select_type | table       | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra          |
+----+-------------+-------------+------------+------+---------------+------+---------+------+------+----------+----------------+
|  1 | SIMPLE      | studentInfo | NULL       | ALL  | NULL          | NULL | NULL    | NULL |    4 |   100.00 | Using filesort |
+----+-------------+-------------+------------+------+---------------+------+---------+------+------+----------+----------------+





mysql> explain update studentInfo set age =26 where studentId=4;
+----+-------------+-------------+------------+-------+---------------+---------+---------+-------+------+----------+-------------+
| id | select_type | table       | partitions | type  | possible_keys | key     | key_len | ref   | rows | filtered | Extra       |
+----+-------------+-------------+------------+-------+---------------+---------+---------+-------+------+----------+-------------+
|  1 | UPDATE      | studentInfo | NULL       | range | PRIMARY       | PRIMARY | 4       | const |    1 |   100.00 | Using where |
+----+-------------+-------------+------------+-------+---------------+---------+---------+-------+------+----------+-------------+






mysql> explain delete from studentInfo where firstName= "saumya";
+----+-------------+-------------+------------+------+---------------+------+---------+------+------+----------+-------------+
| id | select_type | table       | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra       |
+----+-------------+-------------+------------+------+---------------+------+---------+------+------+----------+-------------+
|  1 | DELETE      | studentInfo | NULL       | ALL  | NULL          | NULL | NULL    | NULL |    4 |   100.00 | Using where |
+----+-------------+-------------+------------+------+---------------+------+---------+------+------+----------+-------------+





mysql> explain select * from studentInfo limit 3;
+----+-------------+-------------+------------+------+---------------+------+---------+------+------+----------+-------+
| id | select_type | table       | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra |
+----+-------------+-------------+------------+------+---------------+------+---------+------+------+----------+-------+
|  1 | SIMPLE      | studentInfo | NULL       | ALL  | NULL          | NULL | NULL    | NULL |    4 |   100.00 | NULL  |
+----+-------------+-------------+------------+------+---------------+------+---------+------+------+----------+-------+






mysql> explain select min(age) as minimumAge from studentInfo;
+----+-------------+-------------+------------+------+---------------+------+---------+------+------+----------+-------+
| id | select_type | table       | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra |
+----+-------------+-------------+------------+------+---------------+------+---------+------+------+----------+-------+
|  1 | SIMPLE      | studentInfo | NULL       | ALL  | NULL          | NULL | NULL    | NULL |    4 |   100.00 | NULL  |
+----+-------------+-------------+------------+------+---------------+------+---------+------+------+----------+-------+






mysql> explain select max(age) as maximumAge from studentInfo;
+----+-------------+-------------+------------+------+---------------+------+---------+------+------+----------+-------+
| id | select_type | table       | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra |
+----+-------------+-------------+------------+------+---------------+------+---------+------+------+----------+-------+
|  1 | SIMPLE      | studentInfo | NULL       | ALL  | NULL          | NULL | NULL    | NULL |    4 |   100.00 | NULL  |
+----+-------------+-------------+------------+------+---------------+------+---------+------+------+----------+-------+






mysql> explain select count(firstName) as countOfStudent from studentInfo;
+----+-------------+-------------+------------+------+---------------+------+---------+------+------+----------+-------+
| id | select_type | table       | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra |
+----+-------------+-------------+------------+------+---------------+------+---------+------+------+----------+-------+
|  1 | SIMPLE      | studentInfo | NULL       | ALL  | NULL          | NULL | NULL    | NULL |    4 |   100.00 | NULL  |
+----+-------------+-------------+------------+------+---------------+------+---------+------+------+----------+-------+






mysql> explain select avg(age) as averageAge from studentInfo;
+----+-------------+-------------+------------+------+---------------+------+---------+------+------+----------+-------+
| id | select_type | table       | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra |
+----+-------------+-------------+------------+------+---------------+------+---------+------+------+----------+-------+
|  1 | SIMPLE      | studentInfo | NULL       | ALL  | NULL          | NULL | NULL    | NULL |    4 |   100.00 | NULL  |
+----+-------------+-------------+------------+------+---------------+------+---------+------+------+----------+-------+





mysql> explain select sum(age) as sumOfAge from studentInfo;
+----+-------------+-------------+------------+------+---------------+------+---------+------+------+----------+-------+
| id | select_type | table       | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra |
+----+-------------+-------------+------------+------+---------------+------+---------+------+------+----------+-------+
|  1 | SIMPLE      | studentInfo | NULL       | ALL  | NULL          | NULL | NULL    | NULL |    4 |   100.00 | NULL  |
+----+-------------+-------------+------------+------+---------------+------+---------+------+------+----------+-------+






mysql> explain select * from studentInfo where firstName like 'r%';
+----+-------------+-------------+------------+------+---------------+------+---------+------+------+----------+-------------+
| id | select_type | table       | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra       |
+----+-------------+-------------+------------+------+---------------+------+---------+------+------+----------+-------------+
|  1 | SIMPLE      | studentInfo | NULL       | ALL  | NULL          | NULL | NULL    | NULL |    4 |    25.00 | Using where |
+----+-------------+-------------+------------+------+---------------+------+---------+------+------+----------+-------------+






mysql> explain select * from studentInfo where age between 23 and 25;
+----+-------------+-------------+------------+------+---------------+------+---------+------+------+----------+-------------+
| id | select_type | table       | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra       |
+----+-------------+-------------+------------+------+---------------+------+---------+------+------+----------+-------------+
|  1 | SIMPLE      | studentInfo | NULL       | ALL  | NULL          | NULL | NULL    | NULL |    4 |    25.00 | Using where |
+----+-------------+-------------+------------+------+---------------+------+---------+------+------+----------+-------------+






mysql> explain select a.studentId,a.firstName,b.address from studentInfo a inner join studentAddress b on a.studentId=b.studId;
+----+-------------+-------+------------+--------+---------------+---------+---------+------------------+------+----------+-------------+
| id | select_type | table | partitions | type   | possible_keys | key     | key_len | ref              | rows | filtered | Extra       |
+----+-------------+-------+------------+--------+---------------+---------+---------+------------------+------+----------+-------------+
|  1 | SIMPLE      | b     | NULL       | ALL    | studId        | NULL    | NULL    | NULL             |    4 |   100.00 | Using where |
|  1 | SIMPLE      | a     | NULL       | eq_ref | PRIMARY       | PRIMARY | 4       | example.b.studId |    1 |   100.00 | NULL        |
+----+-------------+-------+------------+--------+---------------+---------+---------+------------------+------+----------+-------------






mysql> explain select studId from studentAddress
       union all
       select studentId from studentInfo;
+----+-------------+----------------+------------+-------+---------------+---------+---------+------+------+----------+-------------+
| id | select_type | table          | partitions | type  | possible_keys | key     | key_len | ref  | rows | filtered | Extra       |
+----+-------------+----------------+------------+-------+---------------+---------+---------+------+------+----------+-------------+
|  1 | PRIMARY     | studentAddress | NULL       | index | NULL          | studId  | 5       | NULL |    4 |   100.00 | Using index |
|  2 | UNION       | studentInfo    | NULL       | index | NULL          | PRIMARY | 4       | NULL |    4 |   100.00 | Using index |
+----+-------------+----------------+------------+-------+---------------+---------+---------+------+------+----------+-------------+






mysql> explain select * from studentInfo group by class order by age;
+----+-------------+-------------+------------+------+---------------+------+---------+------+------+----------+---------------------------------+
| id | select_type | table       | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra                           |
+----+-------------+-------------+------------+------+---------------+------+---------+------+------+----------+---------------------------------+
|  1 | SIMPLE      | studentInfo | NULL       | ALL  | NULL          | NULL | NULL    | NULL |    4 |   100.00 | Using temporary; Using filesort |
+----+-------------+-------------+------------+------+---------------+------+---------+------+------+----------+---------------------------------+






mysql> explain select * from studentInfo group by class having age>24;
+----+-------------+-------------+------------+------+---------------+------+---------+------+------+----------+-----------------+
| id | select_type | table       | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra           |
+----+-------------+-------------+------------+------+---------------+------+---------+------+------+----------+-----------------+
|  1 | SIMPLE      | studentInfo | NULL       | ALL  | NULL          | NULL | NULL    | NULL |    4 |   100.00 | Using temporary |
+----+-------------+-------------+------------+------+---------------+------+---------+------+------+----------+-----------------+






mysql> explain select studentId,firstName from studentInfo where exists(select class from studentInfo where age>20);
+----+-------------+-------------+------------+------+---------------+------+---------+------+------+----------+-------------------------------+
| id | select_type | table       | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra                         |
+----+-------------+-------------+------------+------+---------------+------+---------+------+------+----------+-------------------------------+
|  1 | SIMPLE      | studentInfo | NULL       | ALL  | NULL          | NULL | NULL    | NULL |    4 |    33.33 | Using where; FirstMatch       |
|  1 | SIMPLE      | studentInfo | NULL       | ALL  | NULL          | NULL | NULL    | NULL |    4 |   100.00 | Using join buffer (hash join) |
+----+-------------+-------------+------------+------+---------------+------+---------+------+------+----------+-------------------------------+






mysql> explain select firstName from studentInfo where age = any (select age from studentInfo where age>20);
+----+-------------+-------------+------------+------+---------------+------+---------+------+------+----------+---------------------------------------------------------------------+
| id | select_type | table       | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra                                                               |
+----+-------------+-------------+------------+------+---------------+------+---------+------+------+----------+---------------------------------------------------------------------+
|  1 | SIMPLE      | studentInfo | NULL       | ALL  | NULL          | NULL | NULL    | NULL |    4 |   100.00 | Using where                                                         |
|  1 | SIMPLE      | studentInfo | NULL       | ALL  | NULL          | NULL | NULL    | NULL |    4 |    25.00 | Using where; FirstMatch(studentInfo); Using join buffer (hash join) |
+----+-------------+-------------+------------+------+---------------+------+---------+------+------+----------+---------------------------------------------------------------------+







mysql> explain select firstName from studentInfo where age = all (select age from studentInfo where age<20);
+----+--------------------+-------------+------------+------+---------------+------+---------+------+------+----------+-------------+
| id | select_type        | table       | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra       |
+----+--------------------+-------------+------------+------+---------------+------+---------+------+------+----------+-------------+
|  1 | PRIMARY            | studentInfo | NULL       | ALL  | NULL          | NULL | NULL    | NULL |    4 |   100.00 | Using where |
|  2 | DEPENDENT SUBQUERY | studentInfo | NULL       | ALL  | NULL          | NULL | NULL    | NULL |    4 |    33.33 | Using where |
+----+--------------------+-------------+------------+------+---------------+------+---------+------+------+----------+-------------+


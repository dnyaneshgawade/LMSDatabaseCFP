/* create table*/ 
create table studentInfo
(
           studentId int primary key auto_increment,
           firstName varchar(50),
           lastName varchar(50),
           class varchar(50),
           age int
);

/*insert record into table*/ 
insert into studentInfo(firstName,lastName,class,age) values("Dnyanesh","Gawade","cs",24);
insert into studentInfo(firstName,lastName,class,age) values("Saurabh","shirsath","Civil",25);
insert into studentInfo(firstName,lastName,class,age) values("onkar","bapat","cs",25);
insert into studentInfo(firstName,lastName,class,age) values("saumya","deshmukh","mech",22);
insert into studentInfo(firstName,lastName,class,age) values("rutuja","pai","it",23);

/*retrive all data from table*/
select * from studentInfo;


/*use of where clause*/
select firstName, class from studentInfo where studentId=4;


/*use of and operator*/
select age from studentInfo where firstname="saumya" and class="mech";



/*use of or operator*/
select firstName,lastName from studentInfo where class="cs" or class="it";



/*use of not operator*/
select firstName,lastName from studentInfo where not class="it";



/*use of order by clause*/
select firstName,lastName from studentInfo order by age asc;
select firstName,lastName from studentInfo order by age desc;



/* update the records from table*/
update studentInfo set age =26 where studentId=4;



/* delete the records from table*/
delete from studentInfo where firstName= "saumya";



/* use of limit keyword*/
select * from studentInfo limit 3;


/* use of minimum aggregate function*/
select min(age) as minimumAge from studentInfo;


/* use of maximum aggregate function*/
select max(age) as maximumAge from studentInfo;



/* use of count aggregate function*/
select count(firstName) as countOfStudent from studentInfo;



/* use of average aggregate function*/
select avg(age) as averageAge from studentInfo;



/* use of sum aggregate function*/
select sum(age) as sumOfAge from studentInfo;



/* use of like function*/
select * from studentInfo where firstName like 'r%';
select * from studentInfo where firstName like '%h';
select * from studentInfo where firstName like '%a%';
select * from studentInfo where firstName like 'd%h';
select * from studentInfo where firstName not like 'd%h';


/* use of in keyword*/
select * from studentInfo where class in ('cs','it');
select * from studentInfo where class in (select class from studentInfo);


/* use of between keyword*/
select * from studentInfo where age between 23 and 25;


/*use of alias name*/
select studentId as id, age as yearOld from studentInfo;


/* create and insert record into table*/
create table studentAddress
(
     id int primary key auto_increment,
     studId int,
     address varchar(255),
     FOREIGN KEY (studId) REFERENCES studentInfo (studentId)
);
 
insert into studentAddress(studId,address) values(1,'mumbai');
insert into studentAddress(studId,address) values(2,'pune');
insert into studentAddress(studId,address) values(3,'chennai');
insert into studentAddress(studId,address) values(5,'delhi');
select * from studentAddress;




/* use of joins */
select a.studentId,a.firstName,b.address from studentInfo a join studentAddress b on a.studentId=b.studId;
select a.studentId,a.firstName,b.address from studentInfo a inner join studentAddress b on a.studentId=b.studId;
select a.studentId,a.firstName,b.address from studentInfo a left join studentAddress b on a.studentId=b.studId;
select a.studentId,a.firstName,b.address from studentInfo a right join studentAddress b on a.studentId=b.studId;
select a.studentId,a.firstName,b.address from studentInfo a cross join studentAddress b on a.studentId=b.studId;



/* use of union keyword*/
select studId from studentAddress
union all
select studentId from studentInfo;



/* use of group by clause*/
select * from studentInfo group by class;
select * from studentInfo group by class order by age;



/* use of having clause*/
select * from studentInfo group by class having age>24;


/* use of exist keyword*/
select studentId,firstName from studentInfo where exists(select class from studentInfo where age>20);


/* use of any keyword*/
mysql> select firstName from studentInfo where age = any (select age from studentInfo where age>20);



/* use of all keyword*/
mysql> select firstName from studentInfo where age = all (select age from studentInfo where age<20);
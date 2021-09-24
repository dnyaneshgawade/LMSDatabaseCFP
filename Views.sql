/* creating view on fellowship_candidate table*/

 create view candidate_info
    as
    select id,first_name,last_name,email,mobile_num,degree
    from fellowship_candidates
	**


/* insert records into view*/
insert into candidate_info values(3,'mayur','nugade','mayur@gmail.com',1234567890,'B.E')**


/* update records from view*/
update candidate_info set first_name='Deepak' where id = 1**


/* delete records from view*/
delete from candidate_info where id =3**


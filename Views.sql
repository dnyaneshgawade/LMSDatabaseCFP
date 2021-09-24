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



/* creating view on fellowship_candidate and candidate_bank_det table*/

    create view candidate_bank
    as
    select a.id,a.first_name,a.last_name,b.name,b.account_num,b.ifsc_code
    from fellowship_candidates a, candidate_bank_det b
    where a.id=b.candidate_id
    **
/* display view*/

    select * from candidate_bank**


/* creating view on fellowship_candidate and candidate_qualification table*/

	 create view fellowship_qualification
     as
     select a.id,a.first_name,a.last_name,b.degree_name,b.passing_year,b.final_year_per
     from fellowship_candidates a,candidate_qualification b
     where a.id=b.candidate_id
     **

/* display view*/

    select * from fellowship_qualification**



/* creating view on fellowship_candidate , candidate_bank_det and candidate_qualification table*/

	 create view candidate
     as
     select a.id,a.first_name,a.last_name,b.account_num,b.ifsc_code,c.degree_name,c.passing_year,c.final_year_per
     from fellowship_candidates a,  candidate_bank_det b, candidate_qualification c
     where a.id=b.candidate_id and a.id=c.candidate_id
     **

/* display view*/

    select * from candidate**


/* creating view on maker_program, tech_type and tech_stack table*/

	 create view program
     as
     select a.program_name, a.program_type, a.description, b.id,b.type_name ,b.cur_status, c.tech_name ,c.framework
     from maker_program a, tech_type b, tech_stack  c
     where a.tech_stack_id=c.id and a.tech_type_id = b.id
     **

/* display view*/

    select * from program**


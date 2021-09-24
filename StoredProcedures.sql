
/* Creating stored procedure for retrive data*/

create procedure sp_retriveData()
     begin
     declare exit handler for sqlexception
     begin
     rollback;
     end;
    
     declare exit handler for sqlwarning
     begin
     rollback;
     end;
    
     start transaction;
     select * from fellowship_candidates;
     select * from candidates_personal_det_check;
     select * from candidate_bank_det;
     select * from candidates_bank_det_check;
     select * from candidate_qualification;
     select * from candidates_education_det_check;
     select * from candidate_docs;
     select * from tech_type;
     select * from tech_stack;
     select * from maker_program;
     commit;
     end**


	/* procedure calls*/

	 call sp_retriveData()**


	 /* Creating stored procedure for insert data*/

	  create procedure sp_insertData()
     begin
     declare exit handler for sqlexception
     begin
    
     rollback;
     end;
    
     declare exit handler for sqlwarning
     begin
     rollback;
     end;
    
     start transaction;
     insert into fellowship_candidates values(2, 'Dnyanesh', 'Tanaji', 'Gawade', 'dnyanesh@gmail.com ', 8956748596, 'Pune','2020-12-13','B.E'     , 75.25,5245,5478,'Mumbai', 'Good', 'Good'     , 'Good', '1999-12-13', 2, 'Kiran', 'Farmer', 7584900000, 300000, 'Pune', 'Pune'     , 'photo_path', '2020-12-13', 'Good', 1, 1, 1, 'Correct', 'Good', null, 1);
     insert into  candidates_personal_det_check values(2,2,2,1,'2021-01-01',1,'2021-01-01',2);
     insert into  candidate_bank_det values(2,2,'deepak',200000001,1,'boa1110',1,'bjak12k',1,1234556778,1,'2021-01-01',1);
     insert into candidates_bank_det_check values(2,2,2,1,'2021-01-01',1,'2021-01-01',1);
     insert into candidate_qualification values(2,2,1,'B.E',1,'computer engineering',1,2021,1,8.8,8.9,1,'bridgelab',1,6,1,'no',1,'2021-01-01',1);
     insert into candidates_education_det_check values(2,2,2,1,'2021-01-01',1,'2021-01-01',1);
     insert into candidate_docs values(2,2,'B.E. Marksheet','doc_path',1,'2021-01-01',1);
     insert into tech_type values(2,'tester','y','2021-01-01',1);
     insert into tech_stack values(2,'tester','imagepath','.net','y','2021-01-01',1);
     insert into maker_program values(2,2,'full_stack','link',2,2,1,'Good',1,'2021-01-01',1);
     commit;
     end**
	 
/* procedure calls*/

	call sp_insertData()**


/* Creating stored procedure for delete data*/

	 create procedure sp_deleteData()
     begin
     declare exit handler for sqlexception
     begin
     rollback;
     end;
    
     declare exit handler for sqlwarning
     begin
     rollback;
     end;
    
     start transaction;
     delete from tech_type where id=1 and type='tester';
     select * from tech_type;
     commit;
     end**
	 	
		
/* procedure calls*/
	 call sp_deleteData()**



/* Creating stored procedure for update data*/

  create procedure sp_updateData(in frame varchar(20),in canid int)
     begin
     declare exit handler for sqlexception
     begin
     rollback;
     end;
    
     declare exit handler for sqlwarning
     begin
     rollback;
     end;
    
     start transaction;
     update tech_stack set framework=frame where id=canid;
     commit;
     end**
	 
	 
/* procedure calls*/

call sp_updateData('Database',2)**
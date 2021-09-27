 
	/*  creating function  inside procedure*/
 
	 create procedure callingFunction()
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
			 select id,aggr_per,candidate_designation(aggr_per) from candidate_qualification order by id;
			 commit;
		 end//

	/* calling function by using procedure*/


	call callingFunction()//



	/*  creating view inside procedure*/

	 create procedure callingView()
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
			  select * from candidate_bank;
			  select * from fellowship_qualification;
			  select * from candidate;
			  select * from program;
			  commit;
		 end//


	 /* calling View by using procedure*/

	 call callingView()//
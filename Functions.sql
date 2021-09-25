     /* creating function on candidate_qualification*/

     create function candidate_designation(aggr_per  double)
    
     returns varchar(50)
     deterministic
     begin
     declare Candidate_Designation varchar(50);
     if aggr_per > 7 then set Candidate_Designation='Distinction';
     elseif( aggr_per>=4 and  aggr_per<=7) then set Candidate_Designation='first class';
     elseif( aggr_per<4 ) then set Candidate_Designation='fail';
     end if;
     return(Candidate_Designation);
     end//


    /*calling function*/

    mysql> select id,aggr_per,candidate_designation(aggr_per) from candidate_qualification order by id//
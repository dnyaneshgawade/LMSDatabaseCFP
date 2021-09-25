    /* create trigger for before insert record*/
 
    create trigger salaryCheck
    before insert
    on fellowship_candidates
    for each row
    begin
    if new.parent_annual_sal < 10000 then set new.parent_annual_sal=100000;
    end if;
    end**


    /* create trigger for after insert record*/
	
    create trigger triggerAfterInsert
    after insert
    on tech_type
    for each row
    begin
    insert into tech_type_info values(new.id,new.type_name ,new.cur_status , new.creator_stamp , new.creator_user ,curtime());
    end//



    /* create trigger for befor update  record*/

     create trigger beforeupdate
     before update
     on lab
     for each row
     begin
     declare error_msg varchar(255);
     set error_msg=('status cant be 0');
     if new.status=0 then signal sqlstate '45000'
     set message_text=error_msg;
     end if;
     end//
	 
     


     /* create trigger for after update record*/

     create trigger afterUpdate
     after update
     on lab
     for each row
     begin
     insert into lab_info values(user(),
     cancat('Update Records',old.id,old.creator_user ,'new creator_user :',new.creator_user ));
     end//
	 


	
     /* create trigger for before delete record*/

     create trigger beforeDelete
     before delete
     on tech_type
     for each row
     begin
     insert tech_type_Deleted(id,type_name,cur_status,creator_stamp,creator_user) values (old.id,old.type_name,old.cur_status,old.creator_stamp,old.creator_user);
     end//
	 
	 

     create table tech_type_Deleted
     (
     empid INT PRIMARY KEY AUTO_INCREMENT,
     id int(11) NOT NULL,
     type_name varchar(50) NOT NULL,
     cur_status char(1) DEFAULT NULL,
     creator_stamp datetime DEFAULT NULL,
     creator_user int(11) DEFAULT NULL
     )//

     delete from tech_type where id=2//



    /* create trigger for after delete record*/

    create trigger AfterDelete
    after delete
    on fellowship_candidate
    for each row
    begin
    update ParentSalary set totalSal=totalSal-old.parent_annual_sal;
    end//

    create table ParentSalary
    (
    totalSal int(10) not null
    )//
 
 
    insert into ParentSalary(totalSal)
    select sum(parent_annual_sal )from fellowship_candidates//



    delete from fellowship_candidates where id=3//
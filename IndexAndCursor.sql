
/*creating index on single column*/ 
CREATE INDEX logIndex ON cpulog(DateTime);

/* show index present in table*/
SHOW INDEXES FROM cpulog;



/* creating index on multiple column*/
CREATE INDEX system_memory ON cpulog
( 
	system_total_memory , 
	system_used_memory , 
	system_free_memory , 
	system_active_memory , 
	system_inactive_memory , 
	system_buffers_memory , 
	system_cached_memory , 
	system_shared_memory , 
	system_avalible_memory
);


CREATE INDEX disk_memory ON cpulog
(
	disk_total_memory , 
	disk_used_memory , 
	disk_free_memory
);


/* index inside a stored procedure*/
create procedure index_proc()
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
          CREATE INDEX logIndex ON cpulog(DateTime);
          commit;
     end//


create procedure index_on_multiple_column()
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
          CREATE INDEX system_memory ON cpulog
    	  (
     		system_total_memory ,
     		system_used_memory ,
     		system_free_memory ,
     		system_active_memory ,
     		system_inactive_memory ,
     		system_buffers_memory ,
     		system_cached_memory ,
     		system_shared_memory ,
     		system_avalible_memory
     	  );
     	  commit;
     end//






/* creating cursor using stored procedure*/

create procedure cursorProcedure( inout user_name varchar(5000))
     begin
          declare is_end integer default 0;
          declare userList varchar(255) default "";
          declare userCursor cursor for
          select  user_name from cpulog;
          declare continue handler for not found set is_end=1;
          open userCursor;
          getUser: loop
          	fetch userCursor into userList;
		IF is_end = 1 then leave getUser;
		end if;
		set user_name = concat(userList,",",user_name);
	  end loop getUser;
          close userCursor;
     end//


/* calling cursor*/
set @user_name="";
call cursorProcedure(@user_name);



create procedure cursorOnTech( inout technology_name varchar( 16383))
     begin
          declare is_end integer default 0;
          declare techList varchar(255) default "";
          declare cursorOnTech cursor for
          select  technology from cpulog;
          declare continue handler for not found set is_end=1;
          open cursorOnTech;
          gettech: loop
          	fetch cursorOnTech into techList;
		IF is_end = 1 then leave gettech;
		end if;
		set technology_name = concat(techList,",",technology_name);
	  end loop gettech;
          close cursorOnTech;
     end//


/* calling cursor */
set @technology_name= '';
call cursorOnTechnology( @technology_name);




create procedure cursorOnFirstName( inout FirstName varchar(2000))
     begin
          declare is_end integer default 0;
          declare nameList varchar(255) default "";
          declare name_cursor cursor for
          select  first_name from fellowship_candidates ;
          declare continue handler for not found set is_end=1;
          open name_cursor;
          get_name: loop
          	fetch name_cursor into nameList;
		IF is_end = 1 then leave get_name;
		end if;
		set FirstName = concat(nameList,",",FirstName);
	  end loop get_name;
          close name_cursor;
     end//



/*calling cursor */
set @FirstName ='';
call cursorOnFirstName(@FirstName);
select @FirstName;
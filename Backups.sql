
/* MySQL Database backup*/
C:\Program Files\MySQL\MySQL Server 8.0\bin>mysqldump -u root -p demo > C:\Users\dnyan\dnyana\MySQLBackup\demo.sql
Enter password: ****



C:\Program Files\MySQL\MySQL Server 8.0\bin>mysqldump -u root -p cpulogdata > C:\Users\dnyan\dnyana\MySQLBackup\cpulogdata_backup.sql
Enter password: ****



/* MySQL Database Restore*/
C:\Program Files\MySQL\MySQL Server 8.0\bin>mysqldump -u root -p demo_restore < C:\Users\dnyan\dnyana\MySQLBackup\demo.sql
Enter password: ****



C:\Program Files\MySQL\MySQL Server 8.0\bin>mysqldump -u root -p cpulogdata_copy < C:\Users\dnyan\dnyana\MySQLBackup\cpulogdata_backup.sql
Enter password: ****
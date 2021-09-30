
/* Snapshot for all detabase*/
C:\Program Files\MySQL\MySQL Server 8.0\bin> mysqldump -u root -p --all-databases --master-data > C:\Users\dnyan\dnyana\MySQLBackup\snapshot\allDatabaseSnapshot.db
Enter password: ****




/* Snapshot for lmsdatabase detabase*/
C:\Program Files\MySQL\MySQL Server 8.0\bin> mysqldump -u root -p --databases lmsdatabase --master-data > C:\Users\dnyan\dnyana\MySQLBackup\snapshot\lmsDatabaseSnapshot.db
Enter password: ****




/* Snapshot for cpulogdata detabase*/
C:\Program Files\MySQL\MySQL Server 8.0\bin>
C:\Program Files\MySQL\MySQL Server 8.0\bin> mysqldump -u root -p --databases cpulogdata --master-data > C:\Users\dnyan\dnyana\MySQLBackup\snapshot\cpulogDatabaseSnapshot.db
Enter password: ****





/* Snapshot for lmsdatabase with excluding some tables*/
C:\Program Files\MySQL\MySQL Server 8.0\bin> mysqldump -u root -p --databases lmsdatabase  --ignore-table=lmsdatabase.candidate_techstack_assignment --master-data > C:\Users\dnyan\dnyana\MySQLBackup\snapshot\ignoreTableSnapshot.db
Enter password: ****
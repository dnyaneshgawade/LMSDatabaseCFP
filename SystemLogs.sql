
/*MySQL Logs*/

mysql> show variables like 'log_bin%';
+---------------------------------+----------------------------------------------------------------+
| Variable_name                   | Value                                                          |
+---------------------------------+----------------------------------------------------------------+
| log_bin                         | ON                                                             |
| log_bin_basename                | C:\ProgramData\MySQL\MySQL Server 8.0\Data\SCARECROW-bin       |
| log_bin_index                   | C:\ProgramData\MySQL\MySQL Server 8.0\Data\SCARECROW-bin.index |
| log_bin_trust_function_creators | OFF                                                            |
| log_bin_use_v1_row_events       | OFF                                                            |
+---------------------------------+----------------------------------------------------------------+



/*Display All Master Logs*/
mysql> show master logs;
+----------------------+-----------+-----------+
| Log_name             | File_size | Encrypted |
+----------------------+-----------+-----------+
| SCARECROW-bin.000011 |       156 | No        |
| SCARECROW-bin.000012 |       156 | No        |
| SCARECROW-bin.000013 |       179 | No        |
| SCARECROW-bin.000014 |       179 | No        |
| SCARECROW-bin.000015 |   4321126 | No        |
+----------------------+-----------+-----------+




/*Display All Binary Logs*/
mysql> show binary logs;
+----------------------+-----------+-----------+
| Log_name             | File_size | Encrypted |
+----------------------+-----------+-----------+
| SCARECROW-bin.000011 |       156 | No        |
| SCARECROW-bin.000012 |       156 | No        |
| SCARECROW-bin.000013 |       179 | No        |
| SCARECROW-bin.000014 |       179 | No        |
| SCARECROW-bin.000015 |   4321126 | No        |
+----------------------+-----------+-----------+




/*Display Status of Logs*/
mysql> show master status;
+----------------------+----------+--------------+------------------+-------------------+
| File                 | Position | Binlog_Do_DB | Binlog_Ignore_DB | Executed_Gtid_Set |
+----------------------+----------+--------------+------------------+-------------------+
| SCARECROW-bin.000015 |  4321126 |              |                  |                   |
+----------------------+----------+--------------+------------------+-------------------+



/*Display All General Logs*/
mysql> SELECT * FROM mysql. general_log;
Empty set (0.08 sec)



/*Enable Logs*/
mysql> set SQL_LOG_BIN =0;


/*Display Cummit Status*/
mysql> SELECT @@autocommit;
+--------------+
| @@autocommit |
+--------------+
|            1 |
+--------------+




/*Setting Expiry Date for Logs*/
mysql> select @@binlog_expire_logs_seconds;
+------------------------------+
| @@binlog_expire_logs_seconds |
+------------------------------+
|                      2592000 |
+------------------------------+


mysql> set @@global.binlog_expire_logs_seconds=432000;



mysql> select @@binlog_expire_logs_seconds;
+------------------------------+
| @@binlog_expire_logs_seconds |
+------------------------------+
|                       432000 |
+------------------------------+




/*Delete Logs*/
mysql> purge binary logs to 'SCARECROW-bin.000013';
Query OK, 0 rows affected (0.04 sec)




/*Setting Format for Logs*/
mysql> select @@BINLOG_FORMAT;
+-----------------+
| @@BINLOG_FORMAT |
+-----------------+
| ROW             |
+-----------------+


mysql> set @@global.BINLOG_FORMAT=statement;

mysql> select @@global.BINLOG_FORMAT;
+------------------------+
| @@global.BINLOG_FORMAT |
+------------------------+
| STATEMENT              |
+------------------------+


mysql> set @@global.BINLOG_FORMAT=row;

mysql> select @@global.BINLOG_FORMAT;
+------------------------+
| @@global.BINLOG_FORMAT |
+------------------------+
| ROW                    |
+------------------------+
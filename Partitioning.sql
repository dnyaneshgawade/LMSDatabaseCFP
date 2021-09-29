
/* Range Partitioning*/
CREATE TABLE fellowship_candidates_range_partitioning
(
    id int(11) NOT NULL,
    first_name varchar(100) NOT NULL,
    middle_name varchar(100) DEFAULT NULL,
    last_name varchar(100) NOT NULL,
    email varchar(50) NOT NULL,
    mobile_num bigint(20) NOT NULL,
    hired_city varchar(50) NOT NULL,
    hired_date datetime NOT NULL,
    degree varchar(50) NOT NULL,
    aggr_per double DEFAULT NULL,
    current_pincode int(11) DEFAULT NULL,
    permanent_pincode int(11) DEFAULT NULL,
    hired_lab varchar(20) DEFAULT NULL,
    attitude_remark varchar(15) DEFAULT NULL,
    communication_remark varchar(15) DEFAULT NULL,
    knowledge_remark varchar(15) DEFAULT NULL,
    birth_date date NOT NULL,
    is_birth_date_verified int (1) DEFAULT 0,
    parent_name varchar(50) DEFAULT NULL,
    parent_occupation varchar(100) NOT NULL,
    parent_mobile_num bigint(20) NOT NULL,
    parent_annual_sal double DEFAULT NULL,
    local_addr varchar(255) NOT NULL,
    permanent_addr varchar(150) DEFAULT NULL,
    photo_path varchar(500) DEFAULT NULL,
    joining_date date DEFAULT NULL,
    candidate_status varchar(20) NOT NULL,
    personal_info_filled int (3) DEFAULT 0,
    bank_info_filled int (3) DEFAULT 0,
    educational_info_filled int (3) DEFAULT 0,
    doc_status varchar(20) DEFAULT NULL,
    remark varchar(150) DEFAULT NULL,
    creator_stamp datetime DEFAULT NULL,
    creator_user int(11) DEFAULT NULL,
    PRIMARY KEY (id)
)
partition by range(id)
(
    partition p1 values less than(2),
    partition p2 values less than(4),
    partition p3 values less than(6),
    partition p4 values less than(8),
    partition p5 values less than(10)
);
    

/*show partitioning*/
SELECT TABLE_NAME, PARTITION_NAME, TABLE_ROWS, AVG_ROW_LENGTH, DATA_LENGTH
FROM INFORMATION_SCHEMA.PARTITIONS
WHERE TABLE_SCHEMA = 'lmsdatabase' AND TABLE_NAME = 'fellowship_candidates_range_partitioning';

/*delete partition*/
ALTER TABLE fellowship_candidates_range_partitioning  TRUNCATE PARTITION p5;


/* List Partition*/
CREATE TABLE fellowship_candidates_list_partitioning
(
    id int(11) NOT NULL,
    first_name varchar(100) NOT NULL,
    middle_name varchar(100) DEFAULT NULL,
    last_name varchar(100) NOT NULL,
    email varchar(50) NOT NULL,
    mobile_num bigint(20) NOT NULL,
    hired_city varchar(50) NOT NULL,
    hired_date datetime NOT NULL,
    degree varchar(50) NOT NULL,
    aggr_per double DEFAULT NULL,
    current_pincode int(11) DEFAULT NULL,
    permanent_pincode int(11) DEFAULT NULL,
    hired_lab varchar(20) DEFAULT NULL,
    attitude_remark varchar(15) DEFAULT NULL,
    communication_remark varchar(15) DEFAULT NULL,
    knowledge_remark varchar(15) DEFAULT NULL,
    birth_date date NOT NULL,
    is_birth_date_verified int (1) DEFAULT 0,
    parent_name varchar(50) DEFAULT NULL,
    parent_occupation varchar(100) NOT NULL,
    parent_mobile_num bigint(20) NOT NULL,
    parent_annual_sal double DEFAULT NULL,
    local_addr varchar(255) NOT NULL,
    permanent_addr varchar(150) DEFAULT NULL,
    photo_path varchar(500) DEFAULT NULL,
    joining_date date DEFAULT NULL,
    candidate_status varchar(20) NOT NULL,
    personal_info_filled int (3) DEFAULT 0,
    bank_info_filled int (3) DEFAULT 0,
    educational_info_filled int (3) DEFAULT 0,
    doc_status varchar(20) DEFAULT NULL,
    remark varchar(150) DEFAULT NULL,
    creator_stamp datetime DEFAULT NULL,
    creator_user int(11) DEFAULT NULL,
    PRIMARY KEY (id)
)
partition by list(id)
(
       partition list1 values in (1,2,3),
       partition list2 values in (4,5,6),
       partition list3 values in (7,8,9)
);


/*show partition*/
SELECT TABLE_NAME, PARTITION_NAME, TABLE_ROWS, AVG_ROW_LENGTH, DATA_LENGTH
FROM INFORMATION_SCHEMA.PARTITIONS
WHERE TABLE_SCHEMA = 'lmsdatabase' AND TABLE_NAME = 'fellowship_candidates_list_partitioning';



/* Hash Partitioning*/
CREATE TABLE fellowship_candidates_hash_partitioning
(
    id int(11) NOT NULL,
    first_name varchar(100) NOT NULL,
    middle_name varchar(100) DEFAULT NULL,
    last_name varchar(100) NOT NULL,
    email varchar(50) NOT NULL,
    mobile_num bigint(20) NOT NULL,
    hired_city varchar(50) NOT NULL,
    hired_date datetime NOT NULL,
    degree varchar(50) NOT NULL,
    aggr_per double DEFAULT NULL,
    current_pincode int(11) DEFAULT NULL,
    permanent_pincode int(11) DEFAULT NULL,
    hired_lab varchar(20) DEFAULT NULL,
    attitude_remark varchar(15) DEFAULT NULL,
    communication_remark varchar(15) DEFAULT NULL,
    knowledge_remark varchar(15) DEFAULT NULL,
    birth_date date NOT NULL,
    is_birth_date_verified int (1) DEFAULT 0,
    parent_name varchar(50) DEFAULT NULL,
    parent_occupation varchar(100) NOT NULL,
    parent_mobile_num bigint(20) NOT NULL,
    parent_annual_sal double DEFAULT NULL,
    local_addr varchar(255) NOT NULL,
    permanent_addr varchar(150) DEFAULT NULL,
    photo_path varchar(500) DEFAULT NULL,
    joining_date date DEFAULT NULL,
    candidate_status varchar(20) NOT NULL,
    personal_info_filled int (3) DEFAULT 0,
    bank_info_filled int (3) DEFAULT 0,
    educational_info_filled int (3) DEFAULT 0,
    doc_status varchar(20) DEFAULT NULL,
    remark varchar(150) DEFAULT NULL,
    creator_stamp datetime DEFAULT NULL,
    creator_user int(11) DEFAULT NULL,
    PRIMARY KEY (id)
)
PARTITION BY HASH(id)
PARTITIONS 4;
 

/*show partition*/
SELECT TABLE_NAME, PARTITION_NAME, TABLE_ROWS, AVG_ROW_LENGTH, DATA_LENGTH
FROM INFORMATION_SCHEMA.PARTITIONS
WHERE TABLE_SCHEMA = 'lmsdatabase' AND TABLE_NAME = 'fellowship_candidates_hash_partitioning';


/*Key Partitioning*/
 CREATE TABLE fellowship_candidates_key_partitioning
 (
    id int(11) NOT NULL,
    first_name varchar(100) NOT NULL,
    middle_name varchar(100) DEFAULT NULL,
    last_name varchar(100) NOT NULL,
    email varchar(50) NOT NULL,
    mobile_num bigint(20) NOT NULL,
    hired_city varchar(50) NOT NULL,
    hired_date datetime NOT NULL,
    degree varchar(50) NOT NULL,
    aggr_per double DEFAULT NULL,
    current_pincode int(11) DEFAULT NULL,
    permanent_pincode int(11) DEFAULT NULL,
    hired_lab varchar(20) DEFAULT NULL,
    attitude_remark varchar(15) DEFAULT NULL,
    communication_remark varchar(15) DEFAULT NULL,
    knowledge_remark varchar(15) DEFAULT NULL,
    birth_date date NOT NULL,
    is_birth_date_verified int (1) DEFAULT 0,
    parent_name varchar(50) DEFAULT NULL,
    parent_occupation varchar(100) NOT NULL,
    parent_mobile_num bigint(20) NOT NULL,
    parent_annual_sal double DEFAULT NULL,
    local_addr varchar(255) NOT NULL,
    permanent_addr varchar(150) DEFAULT NULL,
    photo_path varchar(500) DEFAULT NULL,
    joining_date date DEFAULT NULL,
    candidate_status varchar(20) NOT NULL,
    personal_info_filled int (3) DEFAULT 0,
    bank_info_filled int (3) DEFAULT 0,
    educational_info_filled int (3) DEFAULT 0,
    doc_status varchar(20) DEFAULT NULL,
    remark varchar(150) DEFAULT NULL,
    creator_stamp datetime DEFAULT NULL,


    creator_user int(11) DEFAULT NULL,
    PRIMARY KEY (id)
 )
    PARTITION BY KEY()
    PARTITIONS 2;


/*show partition*/
SELECT TABLE_NAME, PARTITION_NAME, TABLE_ROWS, AVG_ROW_LENGTH, DATA_LENGTH
FROM INFORMATION_SCHEMA.PARTITIONS
WHERE TABLE_SCHEMA = 'lmsdatabase' AND TABLE_NAME = 'fellowship_candidates_key_partitioning';




/* Range Column Partitioning*/
CREATE TABLE fellowship_candidates_range_column_partitioning
(
    id int(11) NOT NULL,
    first_name varchar(100) NOT NULL,
    middle_name varchar(100) DEFAULT NULL,
    last_name varchar(100) NOT NULL,
    email varchar(50) NOT NULL,
    mobile_num bigint(20) NOT NULL,
    hired_city varchar(50) NOT NULL,
    hired_date datetime NOT NULL,
    degree varchar(50) NOT NULL,
    aggr_per double DEFAULT NULL,
    current_pincode int(11) DEFAULT NULL,
    permanent_pincode int(11) DEFAULT NULL,
    hired_lab varchar(20) DEFAULT NULL,
    attitude_remark varchar(15) DEFAULT NULL,
    communication_remark varchar(15) DEFAULT NULL,
    knowledge_remark varchar(15) DEFAULT NULL,
    birth_date date NOT NULL,
    is_birth_date_verified int (1) DEFAULT 0,
    parent_name varchar(50) DEFAULT NULL,
    parent_occupation varchar(100) NOT NULL,
    parent_mobile_num bigint(20) NOT NULL,
    parent_annual_sal double DEFAULT NULL,
    local_addr varchar(255) NOT NULL,
    permanent_addr varchar(150) DEFAULT NULL,
    photo_path varchar(500) DEFAULT NULL,
    joining_date date DEFAULT NULL,
    candidate_status varchar(20) NOT NULL,
    personal_info_filled int (3) DEFAULT 0,
    bank_info_filled int (3) DEFAULT 0,
    educational_info_filled int (3) DEFAULT 0,
    doc_status varchar(20) DEFAULT NULL,
    remark varchar(150) DEFAULT NULL,
    creator_stamp datetime DEFAULT NULL,
    creator_user int(11) DEFAULT NULL
 )
PARTITION BY RANGE COLUMNS(id,parent_annual_sal,creator_user)
(
    PARTITION p0 VALUES LESS THAN (2,20000,2),
    PARTITION p1 VALUES LESS THAN (4,30000,4),
    PARTITION p2 VALUES LESS THAN (6,40000,6),
    PARTITION p3 VALUES LESS THAN (10,50000,8)
);


CREATE TABLE employee_range_column_partitioning
(
    EmpId int,
    FirstName varchar(50),
    LastName varchar(50),
    Age int,
    Gender varchar(10),
    Salary int(15)
)
PARTITION BY RANGE COLUMNS(EmpId,Age,Salary)
(
    PARTITION p0 VALUES LESS THAN (2,22,20000),
    PARTITION p1 VALUES LESS THAN (4,24,30000),
    PARTITION p3 VALUES LESS THAN (6,26,40000)
);





/*show partition*/

SELECT TABLE_NAME, PARTITION_NAME, TABLE_ROWS, AVG_ROW_LENGTH, DATA_LENGTH
FROM INFORMATION_SCHEMA.PARTITIONS
WHERE TABLE_SCHEMA = 'lmsdatabase' AND TABLE_NAME = 'fellowship_candidates_range_column_partitioning';


SELECT TABLE_NAME, PARTITION_NAME, TABLE_ROWS, AVG_ROW_LENGTH, DATA_LENGTH
FROM INFORMATION_SCHEMA.PARTITIONS
WHERE TABLE_SCHEMA = 'lmsdatabase' AND TABLE_NAME = 'employee_range_column_partitioning';





/* List Column Partitioning*/
CREATE TABLE fellowship_candidates_list_column_partitioning
(
    id int(11) NOT NULL,
    first_name varchar(100) NOT NULL,
    middle_name varchar(100) DEFAULT NULL,
    last_name varchar(100) NOT NULL,
    email varchar(50) NOT NULL,
    mobile_num bigint(20) NOT NULL,
    hired_city varchar(50) NOT NULL,
    hired_date datetime NOT NULL,
    degree varchar(50) NOT NULL,
    aggr_per double DEFAULT NULL,
    current_pincode int(11) DEFAULT NULL,
    permanent_pincode int(11) DEFAULT NULL,
    hired_lab varchar(20) DEFAULT NULL,
    attitude_remark varchar(15) DEFAULT NULL,
    communication_remark varchar(15) DEFAULT NULL,
    knowledge_remark varchar(15) DEFAULT NULL,
    birth_date date NOT NULL,
    is_birth_date_verified int (1) DEFAULT 0,
    parent_name varchar(50) DEFAULT NULL,
    parent_occupation varchar(100) NOT NULL,
    parent_mobile_num bigint(20) NOT NULL,
    parent_annual_sal double DEFAULT NULL,
    local_addr varchar(255) NOT NULL,
    permanent_addr varchar(150) DEFAULT NULL,
    photo_path varchar(500) DEFAULT NULL,
    joining_date date DEFAULT NULL,
    candidate_status varchar(20) NOT NULL,
    personal_info_filled int (3) DEFAULT 0,
    bank_info_filled int (3) DEFAULT 0,
    educational_info_filled int (3) DEFAULT 0,
    doc_status varchar(20) DEFAULT NULL,
    remark varchar(150) DEFAULT NULL,
    creator_stamp datetime DEFAULT NULL,
    creator_user int(11) DEFAULT NULL
)
PARTITION BY LIST COLUMNS(id)
(
    partition list1 values in (1,2,3),
    partition list2 values in (4,5,6),
    partition list3 values in (7,8,9)
);



/* show partition*/ 
SELECT TABLE_NAME, PARTITION_NAME, TABLE_ROWS, AVG_ROW_LENGTH, DATA_LENGTH
FROM INFORMATION_SCHEMA.PARTITIONS
WHERE TABLE_SCHEMA = 'lmsdatabase' AND TABLE_NAME = 'employee_list_column_partitioning';


/* Sub Partitioning*/
CREATE TABLE fellowship_candidates_sub_partitioning
(
    id int(11) NOT NULL,
    first_name varchar(100) NOT NULL,
    middle_name varchar(100) DEFAULT NULL,
    last_name varchar(100) NOT NULL,
    email varchar(50) NOT NULL,
    mobile_num bigint(20) NOT NULL,
    hired_city varchar(50) NOT NULL,
    hired_date datetime NOT NULL,
    degree varchar(50) NOT NULL,
    aggr_per double DEFAULT NULL,
    current_pincode int(11) DEFAULT NULL,
    permanent_pincode int(11) DEFAULT NULL,
    hired_lab varchar(20) DEFAULT NULL,
    attitude_remark varchar(15) DEFAULT NULL,
    communication_remark varchar(15) DEFAULT NULL,
    knowledge_remark varchar(15) DEFAULT NULL,
    birth_date date NOT NULL,
    is_birth_date_verified int (1) DEFAULT 0,
    parent_name varchar(50) DEFAULT NULL,
    parent_occupation varchar(100) NOT NULL,
    parent_mobile_num bigint(20) NOT NULL,
    parent_annual_sal double DEFAULT NULL,
    local_addr varchar(255) NOT NULL,
    permanent_addr varchar(150) DEFAULT NULL,
    photo_path varchar(500) DEFAULT NULL,
    joining_date date DEFAULT NULL,
    candidate_status varchar(20) NOT NULL,
    personal_info_filled int (3) DEFAULT 0,
    bank_info_filled int (3) DEFAULT 0,
    educational_info_filled int (3) DEFAULT 0,
    doc_status varchar(20) DEFAULT NULL,
    remark varchar(150) DEFAULT NULL,
    creator_stamp datetime DEFAULT NULL,
    creator_user int(11) DEFAULT NULL
)
PARTITION BY RANGE( YEAR(hired_date))
SUBPARTITION BY HASH( TO_DAYS(hired_date))
SUBPARTITIONS 2 
(
     partition less_than_2017 values less than(2017),
     partition less_than_2018 values less than(2018),
     partition less_than_2019 values less than(2019),
     partition less_than_2020 values less than(2020),
     partition less_than_2021 values less than(2021)
);


/* show Partition*/
SELECT TABLE_NAME, PARTITION_NAME, TABLE_ROWS, AVG_ROW_LENGTH, DATA_LENGTH
FROM INFORMATION_SCHEMA.PARTITIONS
WHERE TABLE_SCHEMA = 'lmsdatabase' AND TABLE_NAME = 'fellowship_candidates_sub_partitioning';

/* creating database and use database*/

create database LMSDatabase;

use LMSDatabase;

/* creating tables for LMSDatabase*/

mysql> CREATE TABLE hired_candidates 
(
       id int(11) NOT NULL,
       first_name varchar(100) NOT NULL,
       middle_name varchar(100) DEFAULT NULL,
       last_name varchar(100) NOT NULL,
       email varchar(50) NOT NULL,
       mobile_num bigint(20) NOT NULL,
       hired_city varchar(50) NOT NULL,
       hired_date datetime NOT NULL,
       degree varchar(100) NOT NULL,
       aggr_per double DEFAULT NULL,
       current_pincode int(11) DEFAULT NULL,
       permanent_pincode int(11) DEFAULT NULL,
       hired_lab varchar(20) DEFAULT NULL,
       attitude_remark varchar(15) DEFAULT NULL,
       communication_remark varchar(15) DEFAULT NULL,
       knowledge_remark varchar(15) DEFAULT NULL,
       status varchar(20) NOT NULL,
       creator_stamp datetime DEFAULT NULL,
       creator_user int(11) DEFAULT NULL,
       PRIMARY KEY (id)
);


CREATE TABLE fellowship_candidates 
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
);


CREATE TABLE candidates_personal_det_check 
(
       id int(11) NOT NULL,
       candidate_id  int (11) NOT NULL,
       field_name int(11) NOT NULL,
       is_verified int (3) DEFAULT NULL,
       lastupd_stamp datetime DEFAULT NULL,
       lastupd_user int(11) DEFAULT NULL,
       creator_stamp datetime DEFAULT NULL,
       creator_user int(11) DEFAULT NULL
);


CREATE TABLE candidate_bank_det
(
       id int(11) NOT NULL,
       candidate_id int(11) NOT NULL,
       name varchar(100) NOT NULL,
       account_num int(11) NOT NULL,
       is_account_num_verified int (1) DEFAULT 0,
       ifsc_code varchar(20) NOT NULL,
       is_ifsc_code_verified int (1) DEFAULT 0,
       pan_number varchar(10) DEFAULT NULL,
       is_pan_number_verified int (1) DEFAULT 0,
       addhaar_num int(11) NOT NULL,
       is_addhaar_num_verified int (1) DEFAULT 0,
       KEY `FK_candidate_bank_det_candidate_id` (`candidate_id`),
       CONSTRAINT `FK_candidate_bank_det_candidate_id` FOREIGN KEY (`candidate_id`)       REFERENCES `fellowship_candidates` (`id`),
       creator_stamp datetime DEFAULT NULL,
       creator_user int(11) DEFAULT NULL,
       PRIMARY KEY (id)
);


CREATE TABLE candidates_bank_det_check 
(
       id int(11) NOT NULL,
       candidate_id  int (11) NOT NULL,
       field_name int(11) NOT NULL,
       is_verified int (3) DEFAULT NULL,
       lastupd_stamp datetime DEFAULT NULL,
       lastupd_user int(11) DEFAULT NULL,
       creator_stamp datetime DEFAULT NULL,
       creator_user int(11) DEFAULT NULL
);


CREATE TABLE candidate_qualification
(
       id int(11) NOT NULL,
       candidate_id int(11) NOT NULL,
       diploma int (1) DEFAULT 0,
       degree_name varchar(10) NOT NULL,
       is_degree_name_verified int (1) DEFAULT 0,
       employee_decipline varchar(100) NOT NULL,
       is_employee_decipline_verified int (1) DEFAULT 0,
       passing_year int(11) NOT NULL,
       is_passing_year_verified int (1) DEFAULT 0,
       aggr_per double DEFAULT NULL,
       final_year_per double DEFAULT NULL,
       is_final_year_per_verified int (1) DEFAULT 0,
       training_institute varchar(20) NOT NULL,
       is_training_institute_verified int (1) DEFAULT 0,
       training_duration_month int(3) DEFAULT NULL,
       is_training_duration_month_verified int (1) DEFAULT 0,
       other_training varchar(255) DEFAULT NULL,
       is_other_training_verified int (1) DEFAULT 0,
       creator_stamp datetime DEFAULT NULL,
       creator_user int(11) DEFAULT NULL,
       KEY `FK_candidate_qual_candidate_id` (`candidate_id`),
       CONSTRAINT `FK_candidate_qual_candidate_id` FOREIGN KEY (`candidate_id`) REFERENCES `fellowship_candidates` (`id`),
       PRIMARY KEY (id)
);



CREATE TABLE candidates_education_det_check 
(
       id int(11) NOT NULL,
       candidate_id  int (11) NOT NULL,
       field_name int(11) NOT NULL,
       is_verified int (3) DEFAULT NULL,
       lastupd_stamp datetime DEFAULT NULL,
       lastupd_user int(11) DEFAULT NULL,
       creator_stamp datetime DEFAULT NULL,
       creator_user int(11) DEFAULT NULL
);


CREATE TABLE candidate_docs
(
       id int(11) NOT NULL,
       candidate_id int(11) NOT NULL,
       doc_type varchar(20) DEFAULT NULL,
       doc_path varchar(500) DEFAULT NULL,
       status int(3) DEFAULT 1,
       creator_stamp datetime DEFAULT NULL,
       creator_user int(11) DEFAULT NULL,
         KEY `FK_candidate_docs_candidate_id` (`candidate_id`),
       CONSTRAINT `FK_candidate_docs_candidate_id` FOREIGN KEY (`candidate_id`) REFERENCES `fellowship_candidates` (`id`),
       PRIMARY KEY (id)
);


CREATE TABLE user_details 
(
       id int(11) NOT NULL,
       email varchar(50) NOT NULL,
       first_name varchar(100) NOT NULL,
       last_name varchar(100) NOT NULL,
       password varchar(15) NOT NULL,
       contact_number bigint(20) NOT NULL,
       verified bit(1) DEFAULT NULL,
       PRIMARY KEY (id),
       UNIQUE KEY UK_4d9rdl7d52k8x3etihxlaujvh (email)
);



CREATE TABLE user_roles 
(
       user_id int(11)NOT NULL ,
       role_name varchar(100)
);


CREATE TABLE company
(
       id int(11) NOT NULL,
       name int(11) NOT NULL,
       address varchar(150) DEFAULT NULL,
       location varchar(50) DEFAULT NULL,
       status int(3) DEFAULT 1,
       creator_stamp datetime DEFAULT NULL,
       creator_user int(11) DEFAULT NULL,
       PRIMARY KEY (id)
);


CREATE TABLE tech_type 
(
       id int(11) NOT NULL,
       type_name varchar(50) NOT NULL,
       cur_status char(1) DEFAULT NULL,
       creator_stamp datetime DEFAULT NULL,
       creator_user int(11) DEFAULT NULL
);

CREATE TABLE maker_program
(
       id int(11) NOT NULL,
       program_name int(11) NOT NULL,
       program_type varchar(10) DEFAULT NULL,
       program_link text DEFAULT NULL,
       tech_stack_id int(4) DEFAULT NULL,
       tech_type_id int(4) NOT NULL,
       is_program_approved int (1),
       description varchar(500) DEFAULT NULL,
       status int(3) DEFAULT 1,
       creator_stamp datetime DEFAULT NULL,
       creator_user int(11) DEFAULT NULL,
       KEY `FK_maker_program_tech_stack_id` (`tech_stack_id`),
       CONSTRAINT `FK_maker_program_tech_stack_id` FOREIGN KEY (`tech_stack_id`) REFERENCES `tech_stack` (`id`),
       KEY `FK_maker_program_tech_type_id` (`tech_type_id`),
       CONSTRAINT `FK_maker_program_tech_type_id` FOREIGN KEY (`tech_type_id`) REFERENCES `tech_type` (`id`),
       PRIMARY KEY (id)
);

CREATE TABLE lab
(
       id int(11) NOT NULL,
       name varchar(50) DEFAULT NULL,
       location varchar(50) DEFAULT NULL,
       address  varchar(255) DEFAULT NULL,
       status int(3) DEFAULT 1,
       creator_stamp datetime DEFAULT NULL,
       creator_user int(11) DEFAULT NULL,
       PRIMARY KEY (id)
);

CREATE TABLE app_parameters 
(
       id int(11) NOT NULL,
       key_type varchar(20) NOT NULL,
       key_value varchar(20) NOT NULL,
       key_text varchar(80) DEFAULT NULL,
       cur_status char(1) DEFAULT NULL,
       lastupd_user int(11) DEFAULT NULL,
       lastupd_stamp datetime DEFAULT NULL,
       creator_stamp datetime DEFAULT NULL,
       creator_user int(11) DEFAULT NULL,
       seq_num int(4) DEFAULT NULL,
       KEY app_parameters_1 (key_type,  key_value)
);

CREATE TABLE mentor
(
       id int(11) NOT NULL,
       name varchar(50) DEFAULT NULL,
       mentor_type varchar(20) DEFAULT NULL,
       lab_id int(4) NOT NULL,
       status int(3) DEFAULT 1,
       creator_stamp datetime DEFAULT NULL,
       creator_user int(11) DEFAULT NULL,
       KEY `FK_mentor_lab_id` (`lab_id`),
       CONSTRAINT `FK_mentor_lab_id` FOREIGN KEY (`lab_id`) REFERENCES `mentor` (`id`),
       PRIMARY KEY (id)
);

CREATE TABLE mentor_ideation_map
(
       id int(11) NOT NULL,
       mentor_id int(4) NOT NULL,
       status int(3) DEFAULT 1,
       creator_stamp datetime DEFAULT NULL,
       creator_user int(11) DEFAULT NULL,
         KEY `FK_mentor_ideation_map_mentor_id` (`mentor_id`),
       CONSTRAINT `FK_mentor_ideation_map_mentor_id` FOREIGN KEY (`mentor_id`) REFERENCES `mentor` (`id`),
       PRIMARY KEY (id)
);

CREATE TABLE mentor_techstack
(
       id int(11) NOT NULL,
       mentor_id int(11) NOT NULL,
       tech_stack_id int(4) NOT NULL,
       status int(3) DEFAULT 1,
       creator_stamp datetime DEFAULT NULL,
       creator_user int(11) DEFAULT NULL,
       PRIMARY KEY (id),
       KEY `FK_mentor_mentor_id` (`mentor_id`),
       CONSTRAINT `FK_mentor_mentor_id` FOREIGN KEY (`mentor_id`) REFERENCES `mentor` (`id`),
       KEY `FK_mentor_tech_stack_id` (`tech_stack_id`),
       CONSTRAINT `FK_mentor_tech_stack_id` FOREIGN KEY (`tech_stack_id`) REFERENCES `tech_stack` (`id`)
);

CREATE TABLE tech_stack 
(
       id int(11) NOT NULL,
       tech_name varchar(50) NOT NULL,
       image_path varchar(500) DEFAULT NULL,
       framework text DEFAULT NULL,
       cur_status char(1) DEFAULT NULL,
       creator_stamp datetime DEFAULT NULL,
       creator_user int(11) DEFAULT NULL
);


CREATE TABLE lab_threshold
(
       id int(11) NOT NULL,
       lab_id int(11) NOT NULL,
       lab_capacity varchar(50) DEFAULT NULL,
       lead_threshold int(3) DEFAULT NULL,
       ideation_engg_threshold int(3) DEFAULT NULL,
       buddy_engg_threshold int(3) DEFAULT NULL,
       status int(3) DEFAULT 1,
       creator_stamp datetime DEFAULT NULL,
       creator_user int(11) DEFAULT NULL,
       PRIMARY KEY (id),
       KEY `FK_lab_lab_id` (`lab_id`),
       CONSTRAINT `FK_lab_lab_id` FOREIGN KEY (`lab_id`) REFERENCES `candidate_lead` (`id`)
);

CREATE TABLE company_requirement
(
     id int(11) NOT NULL,
     company_id int(11) NOT NULL,
     candidate_id int(11) NOT NULL,
     requested_month varchar(20) NOT NULL,
     city varchar(20) DEFAULT NULL,
     is_doc_verification int(3) DEFAULT 1,
     requirement_doc_path varchar(500) DEFAULT NULL,
     no_of_engg int(4) NOT NULL,
     tech_stack_id int(4) NOT NULL,
     tech_type_id int(4) NOT NULL,
     maker_programs_id int(4) NOT NULL,
     lead_id int(4) NOT NULL,
     ideateion_engg_id int(4) DEFAULT NULL,
     buddy_engg_id int(4)  DEFAULT NULL,
     special_remark text DEFAULT NULL,
     status int(3) DEFAULT 1,
     creator_stamp datetime DEFAULT NULL,
     creator_user int(11) DEFAULT NULL,
     KEY `FK_candidate_candidate_id` (`candidate_id`),
     CONSTRAINT `FK_candidate_candidate_id` FOREIGN KEY (`candidate_id`) REFERENCES `fellowship_candidates` (`id`),
     PRIMARY KEY(id)
);


CREATE TABLE candidate_techstack_assignment
(
       id int(11) NOT NULL,
       requirement_id int(11) NOT NULL,
       candidate_id int(11) NOT NULL,
       assign_date datetime DEFAULT NULL,
       status varchar(20) DEFAULT NULL,
       creator_stamp datetime DEFAULT NULL,
       creator_user int(11) DEFAULT NULL,
       KEY `FK_candidate_techstack_assignment_requirement_id` (`requirement_id`),
       CONSTRAINT `FK_candidate_techstack_assignment_requirement_id` FOREIGN KEY (`requirement_id`) REFERENCES `company_requirement` (`id`),
       KEY `FK_candidate_candidate_id` (`candidate_id`),
       CONSTRAINT `FK_candidate_candidate_id` FOREIGN KEY (`candidate_id`) REFERENCES `fellowship_candidates` (`id`),
       PRIMARY KEY (id)
);

CREATE TABLE user_engagement_MIS
(
     id int(11) NOT NULL,
     candidate_id int(11) NOT NULL,
     date_of_attendancce datetime DEFAULT NULL,
     time_of_attendance datetime DEFAULT NULL,
     email_id varchar(50) NOT NULL,
     KEY `FK_candidate_candidate_id` (`candidate_id`),
     CONSTRAINT `FK_candidate_candidate_id` FOREIGN KEY (`candidate_id`) REFERENCES `fellowship_candidates` (`id`),
     PRIMARY KEY (id)
);
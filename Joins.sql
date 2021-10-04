

/*Implementation of Inner Joins*/
SELECT f.first_name, f.last_name, c.account_num , c.ifsc_code FROM fellowship_candidates f INNER JOIN candidate_bank_det c ON f.id = c.candidate_id;


SELECT f.first_name, f.last_name, c.passing_year  , c.degree_name  FROM fellowship_candidates f INNER JOIN candidate_qualification c ON f.id = c.candidate_id;


SELECT f.first_name, f.last_name, c.passing_year  , c.degree_name, cb.account_num , cb.ifsc_code  FROM fellowship_candidates f inner JOIN candidate_qualification c ON f.id = c.candidate_id inner join candidate_bank_det cb on f.id = cb.candidate_id;





/*Implementation of Left Joins*/
SELECT f.first_name, f.last_name, c.account_num , c.ifsc_code FROM fellowship_candidates f left JOIN candidate_bank_det c ON f.id = c.candidate_id;


SELECT f.first_name, f.last_name, c.passing_year  , c.degree_name  FROM fellowship_candidates f left JOIN candidate_qualification c ON f.id = c.candidate_id;


SELECT f.first_name, f.last_name, c.passing_year  , c.degree_name, cb.account_num , cb.ifsc_code  FROM fellowship_candidates f left JOIN candidate_qualification c ON f.id = c.candidate_id left join candidate_bank_det cb on f.id = cb.candidate_id;







/*Implementation of Right Joins*/
SELECT f.first_name, f.last_name, c.account_num , c.ifsc_code FROM fellowship_candidates f right JOIN candidate_bank_det c ON f.id = c.candidate_id;



SELECT f.first_name, f.last_name, c.passing_year  , c.degree_name  FROM fellowship_candidates f right JOIN candidate_qualification c ON f.id = c.candidate_id;



SELECT f.first_name, f.last_name, c.passing_year  , c.degree_name, cb.account_num , cb.ifsc_code  FROM fellowship_candidates f right JOIN candidate_qualification c ON f.id = c.candidate_id right join candidate_bank_det cb on f.id = cb.candidate_id;







/*Implementation of cross Joins*/
SELECT f.first_name, f.last_name, c.account_num , c.ifsc_code FROM fellowship_candidates f cross JOIN candidate_bank_det c ON f.id = c.candidate_id;



SELECT f.first_name, f.last_name, c.passing_year  , c.degree_name  FROM fellowship_candidates f cross JOIN candidate_qualification c ON f.id = c.candidate_id;



SELECT f.first_name, f.last_name, c.passing_year  , c.degree_name, cb.account_num , cb.ifsc_code  FROM fellowship_candidates f cross JOIN candidate_qualification c ON f.id = c.candidate_id cross join candidate_bank_det cb on f.id = cb.candidate_id;






/*Implementation of Self Joins*/
SELECT a.first_name, a.last_name,a.degree, b.email, b.hired_city, b.aggr_per  FROM fellowship_candidates a, fellowship_candidates b where a.id = b.id;






/*Implementation of Outer Joins*/
SELECT f.first_name, f.last_name, c.account_num , c.ifsc_code FROM fellowship_candidates f left  outer JOIN candidate_bank_det c ON f.id = c.candidate_id;




SELECT f.first_name, f.last_name, c.account_num , c.ifsc_code FROM fellowship_candidates f right  outer JOIN candidate_bank_det c ON f.id = c.candidate_id;



SELECT f.first_name, f.last_name, c.passing_year  , c.degree_name, cb.account_num , cb.ifsc_code  FROM fellowship_candidates f left outer JOIN candidate_qualification c ON f.id = c.candidate_id left outer join candidate_bank_det cb on f.id = cb.candidate_id;



SELECT f.first_name, f.last_name, c.passing_year  , c.degree_name, cb.account_num , cb.ifsc_code  FROM fellowship_candidates f right outer JOIN candidate_qualification c ON f.id = c.candidate_id right outer join candidate_bank_det cb on f.id = cb.candidate_id;
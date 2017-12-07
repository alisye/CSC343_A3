
drop table if exists q3 cascade;

-- You must not change this table definition.

create table q3(
student_no VARCHAR(1000),
last_name VARCHAR(1000),
grade int
);


CREATE VIEW in_class AS
SELECT student_id
FROM enrolled
WHERE room = '120' and grade = 'grade 8';


CREATE VIEW is_res_tf AS
SELECT student_id, weight, response, quiz_question.question_id
FROM quiz_question JOIN tf_response ON (quiz_question.quiz_id = 'Pr1-220310' AND tf_response.quiz_id = 'Pr1-220310' AND quiz_question.question_id = tf_response.question_id);



CREATE VIEW is_res_num AS
SELECT student_id, weight, response, quiz_question.question_id
FROM quiz_question JOIN num_response ON (quiz_question.quiz_id = 'Pr1-220310' AND  num_response.quiz_id = 'Pr1-220310' AND quiz_question.question_id = num_response.question_id);


CREATE VIEW is_res_mc AS
SELECT student_id, weight, response, quiz_question.question_id
FROM quiz_question JOIN mc_response ON (quiz_question.quiz_id = 'Pr1-220310' AND  mc_response.quiz_id = 'Pr1-220310' AND quiz_question.question_id = mc_response.question_id);



CREATE VIEW tf_correct AS
SELECT student_id, weight, is_res_tf.question_id, 
CASE
    WHEN response = answer THEN 1
    ELSE 0
END AS correct
FROM is_res_tf JOIN tf_answer ON is_res_tf.question_id = tf_answer.question_id;


CREATE VIEW num_correct AS
SELECT student_id, weight, is_res_num.question_id, 
CASE
    WHEN (response = answer and is_answer = TRUE) THEN 1
    ELSE 0
END AS correct
FROM is_res_num JOIN num_answer ON is_res_num.question_id = num_answer.question_id;

CREATE VIEW num_correct2 AS
SELECT student_id, weight, question_id, SUM(correct) AS correct
FROM num_correct
GROUP BY (student_id, weight, question_id);


CREATE VIEW mc_correct AS
SELECT student_id, weight, is_res_mc.question_id, 
CASE
    WHEN (response = answer and correct = TRUE) THEN 1
    ELSE 0
END AS correct
FROM is_res_mc JOIN mc_answer ON is_res_mc.question_id = mc_answer.question_id;

CREATE VIEW mc_correct2 AS
SELECT student_id, weight, question_id, SUM(correct) AS correct
FROM mc_correct
GROUP BY (student_id, weight, question_id);


CREATE VIEW all_correct_tab AS
(SELECT * FROM tf_correct) UNION (SELECT * FROM num_correct2) UNION (SELECT * FROM mc_correct2);


CREATE VIEW total_grade AS
SELECT student_id, SUM(weight * correct) AS score
FROM all_correct_tab
GROUP BY student_id;


CREATE VIEW total_quiz AS
SELECT SUM(weight) as total
FROM quiz_question
WHERE quiz_id = 'Pr1-220310';


CREATE VIEW final AS 
SELECT score/total * 100 AS grade, total_grade.student_id, last_name
FROM (total_grade JOIN student ON student_id = id), total_quiz;


INSERT INTO q3
SELECT student_id, last_name, grade
FROM final;


SELECT * FROM q3;

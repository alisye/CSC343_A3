
drop table if exists q5 cascade;

-- You must not change this table definition.

create table q5(
question_id int,
correct int,
wrong int,
no_ans int
);



CREATE VIEW in_class2 AS
SELECT student_id
FROM enrolled
WHERE room = '120' and grade = 'grade 8';


CREATE VIEW is_res_tf2 AS
SELECT student_id, weight, response, quiz_question.question_id
FROM quiz_question JOIN tf_response ON (quiz_question.quiz_id = 'Pr1-220310' AND tf_response.quiz_id = 'Pr1-220310' AND quiz_question.question_id = tf_response.question_id);



CREATE VIEW is_res_num2 AS
SELECT student_id, weight, response, quiz_question.question_id
FROM quiz_question JOIN num_response ON (quiz_question.quiz_id = 'Pr1-220310' AND  num_response.quiz_id = 'Pr1-220310' AND quiz_question.question_id = num_response.question_id);


CREATE VIEW is_res_mc2 AS
SELECT student_id, weight, response, quiz_question.question_id
FROM quiz_question JOIN mc_response ON (quiz_question.quiz_id = 'Pr1-220310' AND  mc_response.quiz_id = 'Pr1-220310' AND quiz_question.question_id = mc_response.question_id);



CREATE VIEW tf_correct2 AS
SELECT student_id, weight, is_res_tf2.question_id, 
CASE
    WHEN response = answer THEN 1
    ELSE 0
END AS correct
FROM is_res_tf2 JOIN tf_answer ON is_res_tf2.question_id = tf_answer.question_id;


CREATE VIEW num_correct3 AS
SELECT student_id, weight, is_res_num2.question_id, 
CASE
    WHEN (response = answer and is_answer = TRUE) THEN 1
    ELSE 0
END AS correct
FROM is_res_num2 JOIN num_answer ON is_res_num2.question_id = num_answer.question_id;

CREATE VIEW num_correct4 AS
SELECT student_id, weight, question_id, SUM(correct) AS correct
FROM num_correct3
GROUP BY (student_id, weight, question_id);


CREATE VIEW mc_correct3 AS
SELECT student_id, weight, is_res_mc2.question_id, 
CASE
    WHEN (response = answer and correct = TRUE) THEN 1
    ELSE 0
END AS correct
FROM is_res_mc2 JOIN mc_answer ON is_res_mc2.question_id = mc_answer.question_id;




CREATE VIEW mc_correct4 AS
SELECT student_id, weight, question_id, SUM(correct) AS correct
FROM mc_correct3
GROUP BY (student_id, weight, question_id);


CREATE VIEW all_correct_tab34 AS
(SELECT * FROM tf_correct2) UNION (SELECT * FROM num_correct3) UNION (SELECT * FROM mc_correct3);


CREATE VIEW total_correct AS
SELECT question_id, SUM(correct) AS correct
FROM all_correct_tab
GROUP BY question_id;


CREATE VIEW total_wrong AS
SELECT question_id, correct
FROM all_correct_tab
WHERE correct = 0;


CREATE VIEW total_wrong2 AS
SELECT question_id, count(correct) as wrong
FROM total_wrong
GROUP BY question_id;



CREATE VIEW all_resp2 AS
(SELECT student_id, question_id FROM is_res_tf2) UNION (SELECT student_id, question_id FROM is_res_num2) UNION (SELECT student_id, question_id FROM is_res_mc2);


CREATE VIEW all_poss2 AS
SELECT student_id, question_id
FROM in_class, quiz_question
WHERE quiz_id = 'Pr1-220310';


CREATE VIEW act2 AS
(SELECT * FROM all_poss2) EXCEPT (SELECT * FROM all_resp2);


CREATE VIEW inter2 AS
SELECT student_id, question_id, text
FROM act2 JOIN questions ON id = question_id;


CREATE VIEW total_none AS
SELECT question_id, count(student_id) AS no_ans
FROM inter2
GROUP BY question_id;


CREATE VIEW final2 AS
SELECT total_none.question_id, correct, wrong, no_ans
FROM total_none JOIN total_wrong2 ON total_none.question_id = total_wrong2.question_id JOIN total_correct ON total_correct.question_id = total_wrong2.question_id;

INSERT INTO q5
SELECT question_id, correct, wrong, no_ans
FROM final2;


SELECT * FROM q5;

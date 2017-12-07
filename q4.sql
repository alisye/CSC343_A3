
drop table if exists q4 cascade;

-- You must not change this table definition.

create table q4(
student_id  VARCHAR(1000),
question_id  int,
text VARCHAR(1000)
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


CREATE VIEW all_resp AS
(SELECT student_id, question_id FROM is_res_tf) UNION (SELECT student_id, question_id FROM is_res_num) UNION (SELECT student_id, question_id FROM is_res_mc);


CREATE VIEW all_poss AS
SELECT student_id, question_id
FROM in_class, quiz_question
WHERE quiz_id = 'Pr1-220310';


CREATE VIEW act AS
(SELECT * FROM all_poss) EXCEPT (SELECT * FROM all_resp);


CREATE VIEW inter AS
SELECT student_id, question_id, text
FROM act JOIN questions ON id = question_id;



INSERT INTO q4
SELECT student_id, question_id, text
FROM inter;


drop table if exists q4 cascade;

-- You must not change this table definition.

create table q4(
student_id  VARCHAR(1000),
question_id  int,
text VARCHAR(1000)
);

CREATE VIEW in_class1 AS
SELECT student_id
FROM enrolled
WHERE room = '120' and grade = 'grade 8';


CREATE VIEW is_res_tf1 AS
SELECT student_id, weight, response, quiz_question.question_id
FROM quiz_question JOIN tf_response ON (quiz_question.quiz_id = 'Pr1-220310' AND tf_response.quiz_id = 'Pr1-220310' AND quiz_question.question_id = tf_response.question_id);



CREATE VIEW is_res_num1 AS
SELECT student_id, weight, response, quiz_question.question_id
FROM quiz_question JOIN num_response ON (quiz_question.quiz_id = 'Pr1-220310' AND  num_response.quiz_id = 'Pr1-220310' AND quiz_question.question_id = num_response.question_id);


CREATE VIEW is_res_mc1 AS
SELECT student_id, weight, response, quiz_question.question_id
FROM quiz_question JOIN mc_response ON (quiz_question.quiz_id = 'Pr1-220310' AND  mc_response.quiz_id = 'Pr1-220310' AND quiz_question.question_id = mc_response.question_id);


CREATE VIEW all_resp1 AS
(SELECT student_id, question_id FROM is_res_tf1) UNION (SELECT student_id, question_id FROM is_res_num1) UNION (SELECT student_id, question_id FROM is_res_mc1);


CREATE VIEW all_poss1 AS
SELECT student_id, question_id
FROM in_class1, quiz_question
WHERE quiz_id = 'Pr1-220310';


CREATE VIEW act1 AS
(SELECT * FROM all_poss1) EXCEPT (SELECT * FROM all_resp1);


CREATE VIEW inter1 AS
SELECT student_id, question_id, text
FROM act1 JOIN questions ON id = question_id;



INSERT INTO q4
SELECT student_id, question_id, text
FROM inter1;



SELECT * FROM q4;

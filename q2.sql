
drop table if exists q2 cascade;

-- You must not change this table definition.

create table q2(
id int,
text VARCHAR(1000),
hint_num int
);

CREATE VIEW num_ans_count AS
SELECT questions.id, text, count(hint) as hint_count
FROM questions JOIN num_answer ON id = num_answer.question_id
GROUP BY questions.id;


CREATE VIEW mc_ans_count AS
SELECT questions.id, text, count(hint) as hint_count
FROM questions JOIN mc_answer ON id = mc_answer.question_id
GROUP BY questions.id;


CREATE VIEW all_qs AS
(SELECT * FROM num_ans_count) UNION (SELECT * FROM mc_ans_count);


INSERT INTO q2
SELECT questions.id, questions.text, hint_count
FROM questions LEFT JOIN all_qs ON questions.id = all_qs.id;

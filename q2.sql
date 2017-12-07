
drop table if exists q2 cascade;

-- You must not change this table definition.

create table q2(
id int,
text VARCHAR(1000),
hint_num int
);




INSERT INTO q2
SELECT id, first_name, last_name
FROM student;

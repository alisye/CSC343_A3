
drop table if exists q1 cascade;

-- You must not change this table definition.

create table q1(
id VARCHAR(100),
first_name VARCHAR(20),
last_name VARCHAR(100)
);

INSERT INTO q1
SELECT id, first_name, last_name
FROM student;

drop schema if exists quizschema cascade;
CREATE schema quizschema;
set search_path to quizschema;

--
--

--
--

CREATE TABLE student(
	id VARCHAR(100) primary key,
	--the first name of this student
	first_name VARCHAR(50) NOT NULL,
	--the last name of this student
	last_name VARCHAR(50) NOT NULL
);


CREATE TABLE class(
	--room that class is in
	room VARCHAR(50) NOT NULL,
	--the grade of this class
	grade VARCHAR(50) NOT NULL,
	--the teacher of this class
	teacher VARCHAR(50) NOT NULL,
	UNIQUE(room, grade)
);



CREATE TABLE enrolled(
	--the student that is enrolled in the class
	student_id VARCHAR(100) REFERENCES student(id),
	--the class that the student is enrolled in
	room VARCHAR(50),
	grade VARCHAR(50),
	FOREIGN KEY(room, grade) REFERENCES class(room, grade),
	UNIQUE(student_id, room, grade)
);

CREATE TABLE questions(
        id int primary key,
        --type of question
        type VARCHAR(50) NOT NULL,
        --the question text
        text VARCHAR(1000) NOT NULL

);


CREATE TABLE num_answer(
	--the numeric question this is the answer to
	question_id int REFERENCES questions(id) NOT NULL,
	--the answer to this question
	answer VARCHAR(500) NOT NULL,
	--true if this is the correct answer false if this is a range
	is_answer BOOLEAN NOT NULL,
	--hint if there is one
	hint VARCHAR(500),
	UNIQUE(question_id, answer)
);


CREATE TABLE tf_answer(
	--the true false question that this is the answer to
	question_id int REFERENCES questions(id) NOT NULL,
	--the answer to this question
	answer BOOLEAN NOT NULL,
	UNIQUE(question_id)
);


CREATE TABLE mc_answer(
	--the question this is the possible answer to
	question_id int REFERENCES questions(id) NOT NULL,
	--the choice of answer
	answer VARCHAR(1000) NOT NULL,
	--true if this is the correct answer
	correct BOOLEAN NOT NULL,
	--a possible hint if this is not the correct answer
	hint VARCHAR(1000),
	UNIQUE(question_id, answer)
);


CREATE TABLE quiz(
	id VARCHAR(50) primary key,
	--the title of this quiz
	title VARCHAR(500) NOT NULL,
	--the due date of this quiz
	due DATE NOT NULL,
	--true if hints are shown
	hints BOOLEAN NOT NULL,
	--the class that this quiz is part of
	room VARCHAR(50),
	grade VARCHAR(50),
	FOREIGN KEY(room, grade) REFERENCES class(room, grade)
);


CREATE TABLE quiz_question(
	--the quiz that has this question
	quiz_id VARCHAR(50) REFERENCES quiz(id) NOT NULL,
	--the question that is on this quiz
	question_id int REFERENCES questions(id) NOT NULL,
	--the weight of this question
	weight int NOT NULL,
	UNIQUE(quiz_id, question_id) 
);


CREATE TABLE tf_response(
	--the student who answered the question
	student_id VARCHAR(100) REFERENCES student(id) NOT NULL,
	--the quiz that this question was part of
	quiz_id VARCHAR(50),
	--the question that was answered
	question_id int,
	--the response given by the student
	response BOOLEAN,
	UNIQUE(student_id, quiz_id, question_id),
	FOREIGN KEY(quiz_id, question_id) REFERENCES quiz_question(quiz_id, question_id)
);



CREATE TABLE num_response(
	--the student who answered the question
	student_id VARCHAR(100) REFERENCES student(id) NOT NULL,
	--the quiz that this question was part of
	quiz_id VARCHAR(50),
	--the question that was answered
	question_id int,
	--the response given by the student
	response VARCHAR(50),
	UNIQUE(student_id, quiz_id, question_id),
	FOREIGN KEY(quiz_id, question_id) REFERENCES quiz_question(quiz_id, question_id)
);



CREATE TABLE mc_response(
	--the student who answered the question
	student_id VARCHAR(100) REFERENCES student(id) NOT NULL,
	--the quiz that this question was part of
	quiz_id VARCHAR(50) REFERENCES quiz(id) NOT NULL,
	--the question that was answered
	question_id int,
	--the response given by the student
	response VARCHAR(1000),
	FOREIGN KEY(question_id, response) REFERENCES mc_answer(question_id, answer),
	UNIQUE(student_id, quiz_id, question_id),
	FOREIGN KEY(quiz_id, question_id) REFERENCES quiz_question(quiz_id, question_id)	
);




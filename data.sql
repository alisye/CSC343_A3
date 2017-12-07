INSERT INTO questions VALUES (782, 'Multiple-choice','What do you promise when you take the oath of citizenship?' );

INSERT INTO questions VALUES (566, 'True-False', 'The Prime Minister, Justin Trudeau, is Canada''s Head of State');

INSERT INTO questions VALUES (601, 'Numeric', 'During the "Quiet Revolution," Quebec experienced rapid change. In what decade did this occur? (Enter the year that began the decade, e.g., 1840.)');

INSERT INTO questions VALUES (625, 'Multiple-Choice', 'What is the Underground Railroad?');

INSERT INTO questions VALUES (790, 'Multiple-Choice', 'During the War of 1812 the Americans burned down the Parliament Buildings in York (now Toronto). What did the British and Canadians do in return?');

INSERT INTO mc_answer VALUES (782, 'To pledge your loyalty to the Sovereign, Queen Elizabeth II', TRUE, NULL);

INSERT INTO mc_answer VALUES (782, 'To pledge your allegiance to the flag and fulfill the duties of a Canadian', FALSE, 'Think regally');

INSERT INTO mc_answer VALUES (782, 'To pledge your loyalty to Canada from sea to sea', FALSE, NULL);

INSERT INTO tf_answer VALUES (566, FALSE);

INSERT INTO num_answer VALUES (601, '1960', TRUE, NULL);

INSERT INTO num_answer VALUES (601, '1800-1900', FALSE, 'The Quiet Revolution happened during the 20th Century.');

INSERT INTO num_answer VALUES(601, '2000-2010', FALSE, 'The Quiet Revolution happened some time ago.');

INSERT INTO num_answer VALUES(601, '2020-3000', FALSE, 'The Quiet Revolution has already happened!');

INSERT INTO mc_answer VALUES (625, 'The first railway to cross Canada', FALSE, 'The Underground Railroad was generally south to north, not east-west.');

INSERT INTO mc_answer VALUES (625, 'The CPR''s secret railway line', FALSE, 'The Underground Railroad was secret, but it had nothing to do with trains.');

INSERT INTO mc_answer VALUES (625, 'The TTC subway system', FALSE , 'The TTC is relatively recent; the Underground Railroad was in operation over 100 years ago.');

INSERT INTO mc_answer VALUES (625, 'A network used by slaves who escaped the United States into Canada', TRUE, NULL);

INSERT INTO mc_answer VALUES (790, 'They attacked American merchant ships', FALSE, NULL);

INSERT INTO mc_answer VALUES (790, 'They expanded their defence system, including Fort York', FALSE, NULL);

INSERT INTO mc_answer VALUES (790, 'They burned down the White House in Washington D.C.', TRUE, NULL);

INSERT INTO mc_answer VALUES (790, 'They captured Niagara Falls', FALSE, NULL);


INSERT INTO student VALUES ('0998801234', 'Lena', 'Headey');


INSERT INTO student VALUES ('0010784522', 'Peter', 'Dinklage');


INSERT INTO student VALUES ('0997733991', 'Emillia', 'Clarke');


INSERT INTO student VALUES ('5555555555', 'Kit', 'Harrington');


INSERT INTO student VALUES ('1111111111', 'Sophie', 'Turner');


INSERT INTO student VALUES ('2222222222', 'Massie', 'Williams');


INSERT INTO class VALUES ('120', 'grade 8', 'Mr Higgins');


INSERT INTO class VALUES ('366', 'grade 5', 'Miss Nyers');


INSERT INTO enrolled VALUES ('0998801234', '120', 'grade 8');


INSERT INTO enrolled VALUES ('0010784522', '120', 'grade 8');


INSERT INTO enrolled VALUES ('0997733991', '120', 'grade 8');


INSERT INTO enrolled VALUES ('5555555555', '120', 'grade 8');


INSERT INTO enrolled VALUES ('1111111111', '120', 'grade 8');


INSERT INTO enrolled VALUES ('2222222222', 366, 'grade 5');


INSERT INTO quiz VALUES ('Pr1-220310', 'Citizenship Test Practise Questions', '2017-10-01', TRUE, '120', 'grade 8');


INSERT INTO quiz_question VALUES ('Pr1-220310', 601, 2);


INSERT INTO quiz_question VALUES ('Pr1-220310', 566, 1);


INSERT INTO quiz_question VALUES ('Pr1-220310', 790, 3);


INSERT INTO quiz_question VALUES ('Pr1-220310', 625, 2);


INSERT INTO num_response VALUES ('0998801234', 'Pr1-220310', 601, '1950');

INSERT INTO num_response VALUES ('0010784522', 'Pr1-220310', 601, '1960');

INSERT INTO num_response VALUES ('0997733991', 'Pr1-220310', 601, '1960');


INSERT INTO tf_response VALUES ('0998801234', 'Pr1-220310', 566, FALSE);

INSERT INTO tf_response VALUES ('0010784522', 'Pr1-220310', 566, FALSE);

INSERT INTO tf_response VALUES ('0997733991', 'Pr1-220310', 566, TRUE);

INSERT INTO tf_response VALUES ('5555555555', 'Pr1-220310', 566, FALSE);

INSERT INTO mc_response VALUES ('0998801234', 'Pr1-220310', 790, 'They expanded their defence system, including Fort York');

INSERT INTO mc_response VALUES ('0010784522', 'Pr1-220310', 790, 'They burned down the White House in Washington D.C.');

INSERT INTO mc_response VALUES ('0997733991', 'Pr1-220310', 790, 'They burned down the White House in Washington D.C.');

INSERT INTO mc_response VALUES ('5555555555', 'Pr1-220310', 790, 'They captured Niagara Falls');

INSERT INTO mc_response VALUES ('0998801234', 'Pr1-220310', 625, 'A network used by slaves who escaped the United States into Canada');


INSERT INTO mc_response VALUES ('0010784522', 'Pr1-220310', 625, 'A network used by slaves who escaped the United States into Canada');


INSERT INTO mc_response VALUES ('0997733991', 'Pr1-220310', 625, 'The CPR''s secret railway line');

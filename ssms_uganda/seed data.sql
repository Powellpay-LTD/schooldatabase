USE ssms_uganda;

-- ==========================================
-- 1. ROLES
-- ==========================================

INSERT INTO roles (name, description) VALUES
('Administrator','System Administrator'),
('Head Teacher','School Head'),
('Teacher','Teaching Staff'),
('Bursar','Finance Officer'),
('Student','Student Account');

-- ==========================================
-- 2. USERS
-- Password hash is a placeholder.
-- Replace with a real Laravel bcrypt hash if needed.
-- ==========================================

INSERT INTO users (role_id, full_name, email, password_hash, is_active) VALUES

(1,'System Administrator','admin@ssms.com','$2y$10$abcdefghijklmnopqrstuv',1),

(2,'Grace Namusoke','headteacher@ssms.com','$2y$10$abcdefghijklmnopqrstuv',1),

(3,'John Ssentamu','john.ssentamu@ssms.com','$2y$10$abcdefghijklmnopqrstuv',1),
(3,'Sarah Nakato','sarah.nakato@ssms.com','$2y$10$abcdefghijklmnopqrstuv',1),
(3,'David Kato','david.kato@ssms.com','$2y$10$abcdefghijklmnopqrstuv',1),
(3,'Mary Nansubuga','mary.nansubuga@ssms.com','$2y$10$abcdefghijklmnopqrstuv',1),
(3,'Peter Mugisha','peter.mugisha@ssms.com','$2y$10$abcdefghijklmnopqrstuv',1),
(3,'Ruth Achieng','ruth.achieng@ssms.com','$2y$10$abcdefghijklmnopqrstuv',1),
(3,'James Okello','james.okello@ssms.com','$2y$10$abcdefghijklmnopqrstuv',1),
(3,'Alice Atuhaire','alice.atuhaire@ssms.com','$2y$10$abcdefghijklmnopqrstuv',1),
(3,'Michael Turyahikayo','michael.turyahikayo@ssms.com','$2y$10$abcdefghijklmnopqrstuv',1),
(3,'Christine Akello','christine.akello@ssms.com','$2y$10$abcdefghijklmnopqrstuv',1),

(4,'Paul Musoke','bursar@ssms.com','$2y$10$abcdefghijklmnopqrstuv',1);

-- ==========================================
-- 3. ACADEMIC YEARS
-- ==========================================

INSERT INTO academic_years
(name,start_date,end_date,is_current)
VALUES

('2025','2025-02-03','2025-12-05',0),
('2026','2026-02-02','2026-12-04',1),
('2027','2027-02-01','2027-12-03',0);

-- ==========================================
-- 4. TERMS
-- ==========================================

INSERT INTO terms
(academic_year_id,term_number,start_date,end_date,is_current)
VALUES

(1,1,'2025-02-03','2025-05-02',0),
(1,2,'2025-05-26','2025-08-22',0),
(1,3,'2025-09-15','2025-12-05',0),

(2,1,'2026-02-02','2026-05-01',1),
(2,2,'2026-05-25','2026-08-21',0),
(2,3,'2026-09-14','2026-12-04',0),

(3,1,'2027-02-01','2027-04-30',0),
(3,2,'2027-05-24','2027-08-20',0),
(3,3,'2027-09-13','2027-12-03',0);

-- ==========================================
-- 5. CLASS LEVELS
-- ==========================================

INSERT INTO class_levels (name,sort_order)
VALUES
('S1',1),
('S2',2),
('S3',3),
('S4',4),
('S5',5),
('S6',6);

-- ==========================================
-- 6. STREAMS
-- ==========================================

INSERT INTO streams
(class_level_id,academic_year_id,name,class_teacher_id)
VALUES

(1,2,'East',NULL),
(1,2,'West',NULL),

(2,2,'East',NULL),
(2,2,'West',NULL),

(3,2,'East',NULL),
(3,2,'West',NULL),

(4,2,'East',NULL),
(4,2,'West',NULL),

(5,2,'East',NULL),
(5,2,'West',NULL),

(6,2,'East',NULL),
(6,2,'West',NULL);

-- ==========================================
-- 7. STAFF
-- ==========================================

INSERT INTO staff
(user_id,staff_number,designation,phone,employment_status,joined_at)
VALUES

(1,'ADM001','System Administrator','0701000001','Active','2024-01-10'),
(2,'HT001','Head Teacher','0701000002','Active','2022-01-15'),

(3,'TCH001','Mathematics Teacher','0701000003','Active','2023-01-10'),
(4,'TCH002','English Teacher','0701000004','Active','2023-01-10'),
(5,'TCH003','Biology Teacher','0701000005','Active','2023-01-10'),
(6,'TCH004','Chemistry Teacher','0701000006','Active','2023-01-10'),
(7,'TCH005','Physics Teacher','0701000007','Active','2023-01-10'),
(8,'TCH006','History Teacher','0701000008','Active','2023-01-10'),
(9,'TCH007','Geography Teacher','0701000009','Active','2023-01-10'),
(10,'TCH008','ICT Teacher','0701000010','Active','2023-01-10'),
(11,'TCH009','CRE Teacher','0701000011','Active','2023-01-10'),
(12,'TCH010','Literature Teacher','0701000012','Active','2023-01-10'),

(13,'BUR001','Bursar','0701000013','Active','2024-02-01');

-- ==========================================
-- ASSIGN CLASS TEACHERS
-- ==========================================

UPDATE streams SET class_teacher_id=3 WHERE id=1;
UPDATE streams SET class_teacher_id=4 WHERE id=2;

UPDATE streams SET class_teacher_id=5 WHERE id=3;
UPDATE streams SET class_teacher_id=6 WHERE id=4;

UPDATE streams SET class_teacher_id=7 WHERE id=5;
UPDATE streams SET class_teacher_id=8 WHERE id=6;

UPDATE streams SET class_teacher_id=9 WHERE id=7;
UPDATE streams SET class_teacher_id=10 WHERE id=8;

UPDATE streams SET class_teacher_id=11 WHERE id=9;
UPDATE streams SET class_teacher_id=12 WHERE id=10;

UPDATE streams SET class_teacher_id=3 WHERE id=11;
UPDATE streams SET class_teacher_id=4 WHERE id=12;


USE ssms_uganda;

-- ==========================================
-- 8. STUDENTS
-- ==========================================

INSERT INTO students
(user_id, admission_number, full_name, date_of_birth, gender, status)
VALUES
(3,'S2026-001','John Ssentongo','2008-03-12','Male','Active'),
(4,'S2026-002','Sarah Nakato','2008-07-21','Female','Active'),
(5,'S2026-003','David Kato','2007-11-02','Male','Active'),
(6,'S2026-004','Mary Nansubuga','2008-01-15','Female','Active'),
(7,'S2026-005','Peter Mugisha','2007-09-09','Male','Active'),
(8,'S2026-006','Ruth Achieng','2008-05-30','Female','Active'),
(9,'S2026-007','James Okello','2007-12-18','Male','Active'),
(10,'S2026-008','Alice Atuhaire','2008-04-05','Female','Active'),
(11,'S2026-009','Michael Turyahikayo','2007-06-14','Male','Active'),
(12,'S2026-010','Christine Akello','2008-10-10','Female','Active');

-- ==========================================
-- 9. GUARDIANS
-- ==========================================

INSERT INTO guardians
(full_name, phone, email, relationship)
VALUES
('Samuel Ssentongo','0702000001','samuel@gmail.com','Father'),
('Grace Nakato','0702000002','grace@gmail.com','Mother'),
('Robert Kato','0702000003','robert@gmail.com','Father'),
('Jane Nansubuga','0702000004','jane@gmail.com','Mother'),
('Joseph Mugisha','0702000005','joseph@gmail.com','Father'),
('Mary Achieng','0702000006','mary@gmail.com','Mother'),
('Peter Okello','0702000007','peter@gmail.com','Father'),
('Lucy Atuhaire','0702000008','lucy@gmail.com','Mother'),
('Paul Turyahikayo','0702000009','paul@gmail.com','Father'),
('Christine Akello Sr','0702000010','christine.sr@gmail.com','Mother');

-- ==========================================
-- 10. STUDENT GUARDIANS
-- ==========================================

INSERT INTO student_guardians
(student_id, guardian_id, is_primary_contact)
VALUES
(1,1,1),
(2,2,1),
(3,3,1),
(4,4,1),
(5,5,1),
(6,6,1),
(7,7,1),
(8,8,1),
(9,9,1),
(10,10,1);

-- ==========================================
-- 11. ENROLLMENTS
-- (All students in S1 East / stream 1 for simplicity)
-- ==========================================

INSERT INTO enrollments
(student_id, stream_id, academic_year_id)
VALUES
(1,1,2),
(2,2,2),
(3,1,2),
(4,2,2),
(5,3,2),
(6,4,2),
(7,5,2),
(8,6,2),
(9,7,2),
(10,8,2);

-- ==========================================
-- 12. SUBJECTS
-- ==========================================

INSERT INTO subjects
(name, code, subject_type)
VALUES
('Mathematics','MATH','Core'),
('English','ENG','Core'),
('Biology','BIO','Core'),
('Chemistry','CHEM','Core'),
('Physics','PHY','Core'),
('History','HIST','Core'),
('Geography','GEO','Core'),
('ICT','ICT','Core'),
('CRE','CRE','Core'),
('Literature','LIT','Elective');

-- ==========================================
-- 13. CLASS SUBJECTS
-- ==========================================

INSERT INTO class_subjects
(class_level_id, subject_id, is_core, teaching_periods_per_week)
VALUES
(1,1,1,5),(1,2,1,5),(1,3,1,4),(1,4,1,4),(1,5,1,4),
(1,6,1,3),(1,7,1,3),(1,8,1,3),(1,9,1,3),(1,10,0,2),

(2,1,1,5),(2,2,1,5),(2,3,1,4),(2,4,1,4),(2,5,1,4),
(2,6,1,3),(2,7,1,3),(2,8,1,3),(2,9,1,3),(2,10,0,2);

-- ==========================================
-- 14. LEARNER ELECTIVES
-- ==========================================

INSERT INTO learner_electives
(student_id, subject_id, term_id)
VALUES
(1,10,4),
(2,10,4),
(3,10,4),
(4,10,4),
(5,10,4),
(6,10,4),
(7,10,4),
(8,10,4),
(9,10,4),
(10,10,4);

USE ssms_uganda;

-- ==========================================
-- 15. SUBJECT TEACHER ASSIGNMENTS
-- ==========================================

INSERT INTO subject_teacher_assignments
(staff_id, subject_id, stream_id, term_id)
VALUES
(3,1,1,4),
(4,2,2,4),
(5,3,3,4),
(6,4,4,4),
(7,5,5,4),
(8,6,6,4),
(9,7,7,4),
(10,8,8,4),
(11,9,9,4),
(12,10,10,4);

-- ==========================================
-- 16. THEMES
-- ==========================================

INSERT INTO themes
(subject_id, class_level_id, name)
VALUES
(1,1,'Numbers and Basic Operations'),
(2,1,'Grammar Basics'),
(3,1,'Cell Structure'),
(4,1,'Matter and Reactions'),
(5,1,'Forces and Motion'),
(6,1,'Early Civilizations'),
(7,1,'Map Reading'),
(8,1,'Computer Basics'),
(9,1,'Christian Living'),
(10,1,'Introduction to Literature');

-- ==========================================
-- 17. LEARNING OUTCOMES
-- ==========================================

INSERT INTO learning_outcomes
(theme_id, description)
VALUES
(1,'Solve basic arithmetic problems correctly'),
(2,'Use correct grammar in simple sentences'),
(3,'Identify parts of a cell'),
(4,'Describe physical and chemical changes'),
(5,'Explain basic forces'),
(6,'Describe early societies'),
(7,'Interpret simple maps'),
(8,'Use basic computer applications'),
(9,'Explain moral values'),
(10,'Analyze simple texts');

-- ==========================================
-- 18. GENERIC SKILLS
-- ==========================================

INSERT INTO generic_skills
(name, description)
VALUES
('Critical Thinking','Ability to analyze and evaluate information'),
('Communication','Ability to express ideas clearly'),
('Creativity','Ability to generate new ideas'),
('Collaboration','Ability to work with others'),
('Problem Solving','Ability to solve academic challenges');

-- ==========================================
-- 19. SKILL RATING LEVELS
-- ==========================================

INSERT INTO skill_rating_levels
(generic_skill_id, level_value, label)
VALUES
(1,1,'Beginning'),
(1,2,'Developing'),
(1,3,'Proficient'),
(1,4,'Advanced'),

(2,1,'Beginning'),
(2,2,'Developing'),
(2,3,'Proficient'),
(2,4,'Advanced'),

(3,1,'Beginning'),
(3,2,'Developing'),
(3,3,'Proficient'),
(3,4,'Advanced'),

(4,1,'Beginning'),
(4,2,'Developing'),
(4,3,'Proficient'),
(4,4,'Advanced'),

(5,1,'Beginning'),
(5,2,'Developing'),
(5,3,'Proficient'),
(5,4,'Advanced');

-- ==========================================
-- 20. GRADING SCALE
-- ==========================================

INSERT INTO grading_scale
(grade, min_score, max_score, descriptor)
VALUES
('A',80,100,'Excellent'),
('B',70,79,'Very Good'),
('C',60,69,'Good'),
('D',50,59,'Fair'),
('E',40,49,'Weak'),
('F',0,39,'Fail');

-- ==========================================
-- 21. ASSESSMENTS
-- ==========================================

INSERT INTO assessments
(student_id, subject_id, term_id, stream_id, assessment_type, title, score, max_score, recorded_by)
VALUES

(1,1,4,1,'CA','Midterm Test',78,100,3),
(2,1,4,1,'CA','Midterm Test',85,100,3),
(3,2,4,2,'CA','Midterm Test',66,100,4),
(4,3,4,3,'CA','Midterm Test',72,100,5),
(5,4,4,4,'CA','Midterm Test',90,100,6),
(6,5,4,5,'CA','Midterm Test',55,100,7),
(7,6,4,6,'CA','Midterm Test',61,100,8),
(8,7,4,7,'CA','Midterm Test',74,100,9),
(9,8,4,8,'CA','Midterm Test',88,100,10),
(10,9,4,9,'CA','Midterm Test',69,100,11);

USE ssms_uganda;

-- ==========================================
-- 22. SUBJECT TERM RESULTS
-- ==========================================

INSERT INTO subject_term_results
(student_id, subject_id, term_id, ca_score, eot_score, final_score, grade)
VALUES
(1,1,4,35,40,75,'B'),
(2,1,4,40,45,85,'A'),
(3,2,4,30,35,65,'C'),
(4,3,4,32,38,70,'B'),
(5,4,4,42,45,87,'A'),
(6,5,4,25,30,55,'D'),
(7,6,4,28,33,61,'C'),
(8,7,4,34,40,74,'B'),
(9,8,4,41,43,84,'A'),
(10,9,4,33,36,69,'C');

-- ==========================================
-- 23. GENERIC SKILL RATINGS
-- ==========================================

INSERT INTO generic_skill_ratings
(student_id, generic_skill_id, term_id, stream_id, rating_level_id, rated_by)
VALUES
(1,1,4,1,3,3),
(2,2,4,2,4,4),
(3,3,4,3,2,5),
(4,4,4,4,3,6),
(5,5,4,5,4,7),
(6,1,4,6,2,8),
(7,2,4,7,3,9),
(8,3,4,8,4,10),
(9,4,4,9,3,11),
(10,5,4,10,4,12);

-- ==========================================
-- 24. REPORT CARDS
-- ==========================================

INSERT INTO report_cards
(student_id, term_id, stream_id, days_present, days_absent, class_teacher_comment, head_teacher_comment, issued_at)
VALUES
(1,4,1,42,3,'Good performance, keep improving','Promising student','2026-04-10 10:00:00'),
(2,4,1,44,1,'Excellent work','Outstanding student','2026-04-10 10:00:00'),
(3,4,2,40,5,'Average performance','Needs improvement','2026-04-10 10:00:00'),
(4,4,3,41,4,'Good effort','Satisfactory','2026-04-10 10:00:00'),
(5,4,4,45,0,'Excellent','Top performer','2026-04-10 10:00:00'),
(6,4,5,38,7,'Needs improvement','Weak performance','2026-04-10 10:00:00'),
(7,4,6,39,6,'Fair progress','Can do better','2026-04-10 10:00:00'),
(8,4,7,43,2,'Very good','Strong student','2026-04-10 10:00:00'),
(9,4,8,44,1,'Excellent','High achiever','2026-04-10 10:00:00'),
(10,4,9,40,5,'Good effort','Satisfactory','2026-04-10 10:00:00');

-- ==========================================
-- 25. ATTENDANCE
-- ==========================================

INSERT INTO attendance
(student_id, stream_id, term_id, date, status, recorded_by)
VALUES
(1,1,4,'2026-03-01','Present',3),
(2,1,4,'2026-03-01','Present',3),
(3,2,4,'2026-03-01','Absent',4),
(4,3,4,'2026-03-01','Present',5),
(5,4,4,'2026-03-01','Present',6),
(6,5,4,'2026-03-01','Late',7),
(7,6,4,'2026-03-01','Present',8),
(8,7,4,'2026-03-01','Present',9),
(9,8,4,'2026-03-01','Excused',10),
(10,9,4,'2026-03-01','Present',11);

-- ==========================================
-- 26. PERIODS
-- ==========================================

INSERT INTO periods
(day_of_week, period_num, start_time, end_time)
VALUES
(1,1,'08:00:00','08:40:00'),
(1,2,'08:40:00','09:20:00'),
(1,3,'09:20:00','10:00:00'),
(1,4,'10:20:00','11:00:00'),
(1,5,'11:00:00','11:40:00'),

(2,1,'08:00:00','08:40:00'),
(2,2,'08:40:00','09:20:00'),
(2,3,'09:20:00','10:00:00'),
(2,4,'10:20:00','11:00:00'),
(2,5,'11:00:00','11:40:00');

-- ==========================================
-- 27. TIMETABLE
-- ==========================================

INSERT INTO timetable
(stream_id, subject_id, staff_id, period_id, term_id)
VALUES
(1,1,3,1,4),
(1,2,4,2,4),
(1,3,5,3,4),
(1,4,6,4,4),
(1,5,7,5,4),

(2,1,3,6,4),
(2,2,4,7,4),
(2,3,5,8,4),
(2,4,6,9,4),
(2,5,7,10,4);

USE ssms_uganda;

-- ==========================================
-- 28. FEE STRUCTURES
-- ==========================================

INSERT INTO fee_structures
(class_level_id, term_id, amount, description)
VALUES
(1,4,300000,'S1 Term 1 Fees'),
(2,4,320000,'S2 Term 1 Fees'),
(3,4,350000,'S3 Term 1 Fees'),
(4,4,380000,'S4 Term 1 Fees'),
(5,4,450000,'S5 Term 1 Fees'),
(6,4,500000,'S6 Term 1 Fees');

-- ==========================================
-- 29. INVOICES
-- ==========================================

INSERT INTO invoices
(student_id, fee_structure_id, term_id, amount_due)
VALUES
(1,1,4,300000),
(2,1,4,300000),
(3,2,4,320000),
(4,3,4,350000),
(5,4,4,380000),
(6,4,4,380000),
(7,5,4,450000),
(8,5,4,450000),
(9,6,4,500000),
(10,6,4,500000);

-- ==========================================
-- 30. PAYMENTS
-- ==========================================

INSERT INTO payments
(invoice_id, amount_paid, payment_method, reference_number)
VALUES
(1,300000,'Mobile Money','MM123456'),
(2,150000,'Cash','CS111222'),
(3,320000,'Bank','BK333444'),
(4,200000,'Mobile Money','MM555666'),
(5,380000,'Cash','CS777888'),
(6,380000,'Mobile Money','MM999000'),
(7,450000,'Bank','BK121212'),
(8,300000,'Cash','CS343434'),
(9,500000,'Mobile Money','MM565656'),
(10,250000,'Bank','BK787878');

-- ==========================================
-- 31. DISCIPLINE RECORDS
-- ==========================================

INSERT INTO discipline_records
(student_id, recorded_by, incident_date, description, action_taken)
VALUES
(1,3,'2026-03-10','Late to class','Warning issued'),
(2,4,'2026-03-11','Disruptive behavior','Counseled'),
(3,5,'2026-03-12','Missed homework','Punishment given'),
(4,6,'2026-03-13','Good behavior','Commended'),
(5,7,'2026-03-14','Fighting in class','Suspension 1 day'),
(6,8,'2026-03-15','Late arrival','Warning issued'),
(7,9,'2026-03-16','Poor uniform','Corrected'),
(8,10,'2026-03-17','Excellent discipline','Commended'),
(9,11,'2026-03-18','Skipping class','Parent called'),
(10,12,'2026-03-19','Respectful behavior','Rewarded');

-- ==========================================
-- 32. BOOKS
-- ==========================================

INSERT INTO books
(title, author, isbn, total_copies)
VALUES
('Mathematics S1', 'Uganda Curriculum Board', 'ISBN001', 10),
('English Grammar', 'Oxford Press', 'ISBN002', 8),
('Biology Basics', 'Cambridge', 'ISBN003', 6),
('Chemistry Essentials', 'Pearson', 'ISBN004', 7),
('Physics Fundamentals', 'McGraw Hill', 'ISBN005', 5),
('History of Africa', 'Longhorn', 'ISBN006', 4),
('Geography Atlas', 'Oxford', 'ISBN007', 9),
('ICT Skills', 'Local Author', 'ISBN008', 10);

-- ==========================================
-- 33. BOOK LOANS
-- ==========================================

INSERT INTO book_loans
(book_id, borrower_type, borrower_id, due_date, returned_at)
VALUES
(1,'student',1,'2026-04-01',NULL),
(2,'student',2,'2026-04-02',NULL),
(3,'student',3,'2026-04-03','2026-03-30 10:00:00'),
(4,'student',4,'2026-04-04',NULL),
(5,'student',5,'2026-04-05',NULL),
(6,'student',6,'2026-04-06',NULL),
(7,'student',7,'2026-04-07',NULL),
(8,'student',8,'2026-04-08',NULL);

-- ==========================================
-- 34. ANNOUNCEMENTS
-- ==========================================

INSERT INTO announcements
(created_by, title, body, role_id, expires_at)
VALUES
(2,'School Reopening','All students report on Monday.',NULL,'2026-12-31 23:59:59'),
(2,'Exams Notice','Midterm exams start next week.',NULL,'2026-06-01 00:00:00'),
(3,'Staff Meeting','Teachers meeting on Friday.',2,'2026-04-15 00:00:00'),
(4,'Fee Reminder','Please clear school fees.',5,'2026-05-01 00:00:00'),
(2,'Sports Day','Sports day scheduled for June.',NULL,'2026-06-20 00:00:00');[]
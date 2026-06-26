-- ============================================================
--  school_db.sql
--  Complete School Information Management Database
--  MySQL — Compatible with WAMP / XAMPP (phpMyAdmin)
--  Run: phpMyAdmin → Import tab → select this file → Go
-- ============================================================

CREATE DATABASE IF NOT EXISTS school_db
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE school_db;

-- ============================================================
-- SECTION 1 : CORE TABLES
-- ============================================================

-- 1. classes
CREATE TABLE classes (
    class_id     INT AUTO_INCREMENT PRIMARY KEY,
    class_name   VARCHAR(50)  NOT NULL,          -- e.g. "Senior 1"
    stream       VARCHAR(20)  NOT NULL,          -- e.g. "A", "B", "Science"
    level        VARCHAR(20)  NOT NULL,          -- e.g. "O-Level", "A-Level", "Primary"
    capacity     TINYINT UNSIGNED NOT NULL DEFAULT 40,
    UNIQUE KEY uq_class_stream (class_name, stream)
);

-- 2. terms
CREATE TABLE terms (
    term_id       INT AUTO_INCREMENT PRIMARY KEY,
    term_name     VARCHAR(30)  NOT NULL,          -- e.g. "Term 1"
    academic_year YEAR         NOT NULL,
    start_date    DATE         NOT NULL,
    end_date      DATE         NOT NULL,
    UNIQUE KEY uq_term_year (term_name, academic_year)
);

-- 3. students
CREATE TABLE students (
    student_id  INT AUTO_INCREMENT PRIMARY KEY,
    student_no  VARCHAR(15)  NOT NULL UNIQUE,    -- SCH2025001 format
    first_name  VARCHAR(50)  NOT NULL,
    last_name   VARCHAR(50)  NOT NULL,
    gender      ENUM('Male','Female','Other') NOT NULL,
    dob         DATE         NOT NULL,
    class_id    INT          NOT NULL,
    status      ENUM('Active','Inactive','Graduated','Transferred') NOT NULL DEFAULT 'Active',
    enrolled_on DATE         NOT NULL DEFAULT (CURRENT_DATE),
    CONSTRAINT fk_student_class FOREIGN KEY (class_id) REFERENCES classes(class_id)
);

-- 4. student_contacts
CREATE TABLE student_contacts (
    contact_id      INT AUTO_INCREMENT PRIMARY KEY,
    student_id      INT          NOT NULL,
    guardian_name   VARCHAR(100) NOT NULL,
    relationship    VARCHAR(30)  NOT NULL,        -- Father / Mother / Uncle …
    phone           VARCHAR(20)  NOT NULL,
    alt_phone       VARCHAR(20),
    address         TEXT,
    is_primary      TINYINT(1)   NOT NULL DEFAULT 1,
    CONSTRAINT fk_contact_student FOREIGN KEY (student_id) REFERENCES students(student_id)
);

-- 5. fee_types
CREATE TABLE fee_types (
    fee_type_id  INT AUTO_INCREMENT PRIMARY KEY,
    fee_name     VARCHAR(50)  NOT NULL UNIQUE,   -- Tuition, PTA, Sports …
    description  VARCHAR(255)
);

-- 6. fee_structure
CREATE TABLE fee_structure (
    structure_id INT AUTO_INCREMENT PRIMARY KEY,
    class_id     INT            NOT NULL,
    fee_type_id  INT            NOT NULL,
    term_id      INT            NOT NULL,
    amount       DECIMAL(10,2)  NOT NULL,
    UNIQUE KEY uq_structure (class_id, fee_type_id, term_id),
    CONSTRAINT fk_fs_class    FOREIGN KEY (class_id)    REFERENCES classes(class_id),
    CONSTRAINT fk_fs_feetype  FOREIGN KEY (fee_type_id) REFERENCES fee_types(fee_type_id),
    CONSTRAINT fk_fs_term     FOREIGN KEY (term_id)     REFERENCES terms(term_id)
);

-- 7. payments
CREATE TABLE payments (
    payment_id     INT AUTO_INCREMENT PRIMARY KEY,
    payment_code   VARCHAR(20)   NOT NULL UNIQUE, -- PAY-2025-000001 format
    student_id     INT           NOT NULL,
    term_id        INT           NOT NULL,
    fee_type_id    INT           NOT NULL,
    amount         DECIMAL(10,2) NOT NULL,
    payment_date   DATE          NOT NULL,
    payment_method ENUM('Cash','Mobile Money','Bank Transfer','Cheque') NOT NULL,
    reference_no   VARCHAR(50),                   -- cheque no / transaction ID
    notes          TEXT,
    CONSTRAINT fk_pay_student  FOREIGN KEY (student_id)  REFERENCES students(student_id),
    CONSTRAINT fk_pay_term     FOREIGN KEY (term_id)     REFERENCES terms(term_id),
    CONSTRAINT fk_pay_feetype  FOREIGN KEY (fee_type_id) REFERENCES fee_types(fee_type_id)
);

-- 8. payment_receipts
CREATE TABLE payment_receipts (
    receipt_id   INT AUTO_INCREMENT PRIMARY KEY,
    receipt_no   VARCHAR(20)   NOT NULL UNIQUE,   -- RCP-2025-000001 format
    payment_id   INT           NOT NULL UNIQUE,
    issued_on    DATETIME      NOT NULL DEFAULT CURRENT_TIMESTAMP,
    issued_by    VARCHAR(100),
    CONSTRAINT fk_receipt_payment FOREIGN KEY (payment_id) REFERENCES payments(payment_id)
);


-- ============================================================
-- SECTION 2 : ACADEMIC TABLES
-- ============================================================

-- 9. staff
CREATE TABLE staff (
    staff_id    INT AUTO_INCREMENT PRIMARY KEY,
    staff_no    VARCHAR(10)  NOT NULL UNIQUE,     -- TCH001 / BUR001 format
    first_name  VARCHAR(50)  NOT NULL,
    last_name   VARCHAR(50)  NOT NULL,
    role        VARCHAR(50)  NOT NULL,            -- Teacher / Bursar / Head Teacher …
    phone       VARCHAR(20),
    email       VARCHAR(100),
    hire_date   DATE         NOT NULL,
    status      ENUM('Active','Resigned','Retired') NOT NULL DEFAULT 'Active'
);

-- 10. subjects
CREATE TABLE subjects (
    subject_id   INT AUTO_INCREMENT PRIMARY KEY,
    subject_name VARCHAR(80)  NOT NULL,
    subject_code VARCHAR(10)  NOT NULL UNIQUE     -- MTH, ENG, PHY …
);

-- 11. class_teacher  (which teacher is form/class teacher for a class)
CREATE TABLE class_teacher (
    ct_id       INT AUTO_INCREMENT PRIMARY KEY,
    class_id    INT  NOT NULL,
    staff_id    INT  NOT NULL,
    term_id     INT  NOT NULL,
    UNIQUE KEY uq_ct (class_id, term_id),
    CONSTRAINT fk_ct_class  FOREIGN KEY (class_id) REFERENCES classes(class_id),
    CONSTRAINT fk_ct_staff  FOREIGN KEY (staff_id) REFERENCES staff(staff_id),
    CONSTRAINT fk_ct_term   FOREIGN KEY (term_id)  REFERENCES terms(term_id)
);

-- 12. subject_teacher  (which teacher teaches which subject in which class)
CREATE TABLE subject_teacher (
    st_id       INT AUTO_INCREMENT PRIMARY KEY,
    subject_id  INT  NOT NULL,
    staff_id    INT  NOT NULL,
    class_id    INT  NOT NULL,
    term_id     INT  NOT NULL,
    UNIQUE KEY uq_st (subject_id, class_id, term_id),
    CONSTRAINT fk_st_subject FOREIGN KEY (subject_id) REFERENCES subjects(subject_id),
    CONSTRAINT fk_st_staff   FOREIGN KEY (staff_id)   REFERENCES staff(staff_id),
    CONSTRAINT fk_st_class   FOREIGN KEY (class_id)   REFERENCES classes(class_id),
    CONSTRAINT fk_st_term    FOREIGN KEY (term_id)    REFERENCES terms(term_id)
);

-- 13. attendance
CREATE TABLE attendance (
    attendance_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id    INT   NOT NULL,
    class_id      INT   NOT NULL,
    att_date      DATE  NOT NULL,
    status        ENUM('Present','Absent','Late','Excused') NOT NULL,
    remarks       VARCHAR(255),
    UNIQUE KEY uq_att (student_id, att_date),
    CONSTRAINT fk_att_student FOREIGN KEY (student_id) REFERENCES students(student_id),
    CONSTRAINT fk_att_class   FOREIGN KEY (class_id)   REFERENCES classes(class_id)
);

-- 14. exams
CREATE TABLE exams (
    exam_id    INT AUTO_INCREMENT PRIMARY KEY,
    exam_name  VARCHAR(100) NOT NULL,
    exam_type  ENUM('Continuous Assessment','Mid-Term','End of Term','Mock','Final') NOT NULL,
    term_id    INT          NOT NULL,
    start_date DATE         NOT NULL,
    end_date   DATE         NOT NULL,
    CONSTRAINT fk_exam_term FOREIGN KEY (term_id) REFERENCES terms(term_id)
);

-- 15. exam_results
CREATE TABLE exam_results (
    result_id  INT AUTO_INCREMENT PRIMARY KEY,
    exam_id    INT            NOT NULL,
    student_id INT            NOT NULL,
    subject_id INT            NOT NULL,
    marks      DECIMAL(5,2)   NOT NULL,
    out_of     DECIMAL(5,2)   NOT NULL DEFAULT 100,
    grade      VARCHAR(5),
    remarks    VARCHAR(255),
    UNIQUE KEY uq_result (exam_id, student_id, subject_id),
    CONSTRAINT fk_res_exam    FOREIGN KEY (exam_id)    REFERENCES exams(exam_id),
    CONSTRAINT fk_res_student FOREIGN KEY (student_id) REFERENCES students(student_id),
    CONSTRAINT fk_res_subject FOREIGN KEY (subject_id) REFERENCES subjects(subject_id)
);


-- ============================================================
-- SECTION 3 : OPTIONAL TABLES
-- ============================================================

-- 16. books
CREATE TABLE books (
    book_id      INT AUTO_INCREMENT PRIMARY KEY,
    title        VARCHAR(200) NOT NULL,
    author       VARCHAR(150),
    isbn         VARCHAR(20)  UNIQUE,
    publisher    VARCHAR(100),
    category     VARCHAR(50),
    copies_total TINYINT UNSIGNED NOT NULL DEFAULT 1,
    copies_avail TINYINT UNSIGNED NOT NULL DEFAULT 1
);

-- 17. book_loans
CREATE TABLE book_loans (
    loan_id      INT AUTO_INCREMENT PRIMARY KEY,
    book_id      INT   NOT NULL,
    student_id   INT   NOT NULL,
    borrowed_on  DATE  NOT NULL,
    due_date     DATE  NOT NULL,
    returned_on  DATE,
    CONSTRAINT fk_loan_book    FOREIGN KEY (book_id)    REFERENCES books(book_id),
    CONSTRAINT fk_loan_student FOREIGN KEY (student_id) REFERENCES students(student_id)
);

-- 18. notices
CREATE TABLE notices (
    notice_id    INT AUTO_INCREMENT PRIMARY KEY,
    title        VARCHAR(200)  NOT NULL,
    body         TEXT          NOT NULL,
    audience     SET('Students','Parents','Staff') NOT NULL,
    posted_by    INT,   -- staff_id
    posted_on    DATETIME      NOT NULL DEFAULT CURRENT_TIMESTAMP,
    expires_on   DATE,
    CONSTRAINT fk_notice_staff FOREIGN KEY (posted_by) REFERENCES staff(staff_id)
);


-- ============================================================
-- SECTION 4 : SAMPLE DATA
-- ============================================================

-- ── Classes ─────────────────────────────────────────────────
INSERT INTO classes (class_name, stream, level, capacity) VALUES
('Senior 1', 'A',       'O-Level', 45),
('Senior 1', 'B',       'O-Level', 45),
('Senior 2', 'A',       'O-Level', 42),
('Senior 3', 'Science', 'O-Level', 40),
('Senior 4', 'Arts',    'O-Level', 38);

-- ── Terms ────────────────────────────────────────────────────
INSERT INTO terms (term_name, academic_year, start_date, end_date) VALUES
('Term 1', 2025, '2025-02-03', '2025-04-25'),
('Term 2', 2025, '2025-05-19', '2025-08-08'),
('Term 3', 2025, '2025-09-08', '2025-11-28');

-- ── Fee Types ────────────────────────────────────────────────
INSERT INTO fee_types (fee_name, description) VALUES
('Tuition',      'Core academic fee'),
('Development',  'Infrastructure development levy'),
('PTA',          'Parent-Teacher Association dues'),
('Sports',       'Sports and PE activities'),
('Computer Lab', 'ICT lab maintenance'),
('Lunch',        'School lunch programme'),
('Transport',    'School bus transport'),
('Uniform',      'School uniform contribution');

-- ── Fee Structure (Senior 1A, all terms, all fee types) ──────
INSERT INTO fee_structure (class_id, fee_type_id, term_id, amount) VALUES
-- Senior 1A
(1,1,1,450000),(1,2,1,50000),(1,3,1,20000),(1,4,1,15000),
(1,5,1,25000),(1,6,1,90000),(1,7,1,60000),(1,8,1,30000),
(1,1,2,450000),(1,2,2,50000),(1,3,2,20000),(1,4,2,15000),
(1,5,2,25000),(1,6,2,90000),(1,7,2,60000),(1,8,2,30000),
(1,1,3,450000),(1,2,3,50000),(1,3,3,20000),(1,4,3,15000),
(1,5,3,25000),(1,6,3,90000),(1,7,3,60000),(1,8,3,30000);

-- ── Staff ────────────────────────────────────────────────────
INSERT INTO staff (staff_no, first_name, last_name, role, phone, email, hire_date) VALUES
('TCH001','Amina',   'Nakato',   'Teacher',      '0701234561','anakato@school.ug',  '2018-01-15'),
('TCH002','Robert',  'Ssekandi', 'Teacher',      '0701234562','rssekandi@school.ug','2019-03-01'),
('TCH003','Grace',   'Apio',     'Teacher',      '0701234563','gapio@school.ug',    '2020-08-10'),
('TCH004','David',   'Ocen',     'Teacher',      '0701234564','docen@school.ug',    '2021-02-20'),
('BUR001','Patience','Atim',     'Bursar',       '0701234565','patim@school.ug',    '2017-06-01'),
('ADM001','Samuel',  'Otieno',   'Head Teacher', '0701234566','sotieno@school.ug',  '2015-01-01');

-- ── Subjects ─────────────────────────────────────────────────
INSERT INTO subjects (subject_name, subject_code) VALUES
('Mathematics',              'MTH'),
('English Language',         'ENG'),
('Physics',                  'PHY'),
('Chemistry',                'CHM'),
('Biology',                  'BIO'),
('History',                  'HIS'),
('Geography',                'GEO'),
('Computer Studies',         'CST'),
('Physical Education',       'PED'),
('Religious Education',      'RE');

-- ── Students (10 students) ───────────────────────────────────
INSERT INTO students (student_no, first_name, last_name, gender, dob, class_id, status, enrolled_on) VALUES
('SCH2025001','Brian',     'Kato',     'Male',   '2011-03-14', 1, 'Active', '2025-02-03'),
('SCH2025002','Annet',     'Namukasa', 'Female', '2011-07-22', 1, 'Active', '2025-02-03'),
('SCH2025003','Moses',     'Ssali',    'Male',   '2010-11-05', 2, 'Active', '2025-02-03'),
('SCH2025004','Diana',     'Akello',   'Female', '2011-01-30', 2, 'Active', '2025-02-03'),
('SCH2025005','Patrick',   'Ouma',     'Male',   '2010-05-19', 3, 'Active', '2025-02-03'),
('SCH2025006','Judith',    'Atuhaire', 'Female', '2010-09-08', 3, 'Active', '2025-02-03'),
('SCH2025007','Emmanuel',  'Wasswa',   'Male',   '2009-12-25', 4, 'Active', '2025-02-03'),
('SCH2025008','Christine', 'Nabirye',  'Female', '2009-04-17', 4, 'Active', '2025-02-03'),
('SCH2025009','Ronald',    'Mugisha',  'Male',   '2008-08-03', 5, 'Active', '2025-02-03'),
('SCH2025010','Sylvia',    'Auma',     'Female', '2008-06-11', 5, 'Active', '2025-02-03');

-- ── Student Contacts ─────────────────────────────────────────
INSERT INTO student_contacts (student_id, guardian_name, relationship, phone, address, is_primary) VALUES
(1,  'John Kato',       'Father',  '0772100001', 'Kampala, Ntinda',     1),
(2,  'Rose Namukasa',   'Mother',  '0772100002', 'Kampala, Kira',       1),
(3,  'Fred Ssali',      'Father',  '0772100003', 'Wakiso, Gayaza',      1),
(4,  'Betty Akello',    'Mother',  '0772100004', 'Gulu, Town',          1),
(5,  'Peter Ouma',      'Father',  '0772100005', 'Jinja, Kimaka',       1),
(6,  'Alice Atuhaire',  'Mother',  '0772100006', 'Mbarara, Ruharo',     1),
(7,  'George Wasswa',   'Father',  '0772100007', 'Kampala, Bwaise',     1),
(8,  'Helen Nabirye',   'Mother',  '0772100008', 'Kampala, Rubaga',     1),
(9,  'Ivan Mugisha',    'Father',  '0772100009', 'Kabale, Town',        1),
(10, 'Sarah Auma',      'Mother',  '0772100010', 'Soroti, Town',        1);

-- ── Payments (10 payments) ───────────────────────────────────
INSERT INTO payments (payment_code, student_id, term_id, fee_type_id, amount, payment_date, payment_method, reference_no) VALUES
('PAY-2025-000001', 1,  1, 1, 450000, '2025-02-03', 'Cash',          NULL),
('PAY-2025-000002', 2,  1, 1, 450000, '2025-02-04', 'Mobile Money',  'MM78234001'),
('PAY-2025-000003', 3,  1, 1, 450000, '2025-02-04', 'Bank Transfer', 'BT20250204A'),
('PAY-2025-000004', 4,  1, 1, 300000, '2025-02-05', 'Cash',          NULL),
('PAY-2025-000005', 5,  1, 1, 450000, '2025-02-06', 'Cheque',        'CHQ-00123'),
('PAY-2025-000006', 6,  1, 2,  50000, '2025-02-06', 'Cash',          NULL),
('PAY-2025-000007', 7,  2, 1, 450000, '2025-05-19', 'Mobile Money',  'MM78234002'),
('PAY-2025-000008', 8,  2, 1, 450000, '2025-05-20', 'Bank Transfer', 'BT20250520B'),
('PAY-2025-000009', 9,  2, 3,  20000, '2025-05-20', 'Cash',          NULL),
('PAY-2025-000010',10,  3, 1, 450000, '2025-09-08', 'Mobile Money',  'MM78234003');

-- ── Payment Receipts ─────────────────────────────────────────
INSERT INTO payment_receipts (receipt_no, payment_id, issued_by) VALUES
('RCP-2025-000001', 1,  'Patience Atim'),
('RCP-2025-000002', 2,  'Patience Atim'),
('RCP-2025-000003', 3,  'Patience Atim'),
('RCP-2025-000004', 4,  'Patience Atim'),
('RCP-2025-000005', 5,  'Patience Atim'),
('RCP-2025-000006', 6,  'Patience Atim'),
('RCP-2025-000007', 7,  'Patience Atim'),
('RCP-2025-000008', 8,  'Patience Atim'),
('RCP-2025-000009', 9,  'Patience Atim'),
('RCP-2025-000010',10,  'Patience Atim');

-- ── Class Teachers ───────────────────────────────────────────
INSERT INTO class_teacher (class_id, staff_id, term_id) VALUES
(1, 1, 1),(2, 2, 1),(3, 3, 1),(4, 4, 1),(5, 1, 1);

-- ── Subject Teachers ─────────────────────────────────────────
INSERT INTO subject_teacher (subject_id, staff_id, class_id, term_id) VALUES
(1, 2, 1, 1),(2, 1, 1, 1),(3, 3, 1, 1),(4, 3, 2, 1),(5, 4, 2, 1);

-- ── Attendance (sample — one day) ───────────────────────────
INSERT INTO attendance (student_id, class_id, att_date, status) VALUES
(1,1,'2025-02-10','Present'),(2,1,'2025-02-10','Present'),
(3,2,'2025-02-10','Late'),   (4,2,'2025-02-10','Absent'),
(5,3,'2025-02-10','Present'),(6,3,'2025-02-10','Present'),
(7,4,'2025-02-10','Excused'),(8,4,'2025-02-10','Present'),
(9,5,'2025-02-10','Present'),(10,5,'2025-02-10','Present');

-- ── Exams ────────────────────────────────────────────────────
INSERT INTO exams (exam_name, exam_type, term_id, start_date, end_date) VALUES
('Term 1 Mid-Term Test 2025',  'Mid-Term',   1, '2025-03-17','2025-03-21'),
('Term 1 End of Term 2025',    'End of Term',1, '2025-04-14','2025-04-25'),
('Term 2 Continuous Assessment','Continuous Assessment',2,'2025-06-09','2025-06-13');

-- ── Exam Results (sample — exam 1, subject MTH) ──────────────
INSERT INTO exam_results (exam_id, student_id, subject_id, marks, out_of, grade) VALUES
(1,1,1,78,100,'B2'),(1,2,1,85,100,'D1'),(1,3,1,62,100,'C4'),
(1,4,1,55,100,'C6'),(1,5,1,90,100,'D1'),(1,6,1,47,100,'P8'),
(1,7,1,73,100,'C3'),(1,8,1,68,100,'C4'),(1,9,1,81,100,'D1'),
(1,10,1,59,100,'C5');

-- ── Books ────────────────────────────────────────────────────
INSERT INTO books (title, author, isbn, publisher, category, copies_total, copies_avail) VALUES
('New General Mathematics S1', 'M. F. Macrae',    '9780582603363', 'Longman',    'Mathematics', 5, 4),
('Mastering Biology',          'Michael Roberts',  '9781408515198', 'Nelson',     'Biology',     3, 3),
('Comprehensive English',      'Various Authors',  '9789966254320', 'East Africa','English',     4, 3);

-- ── Book Loans ───────────────────────────────────────────────
INSERT INTO book_loans (book_id, student_id, borrowed_on, due_date, returned_on) VALUES
(1, 1, '2025-02-10', '2025-02-24', '2025-02-23'),
(2, 3, '2025-02-12', '2025-02-26', NULL),
(3, 5, '2025-02-15', '2025-03-01', NULL);

-- ── Notices ──────────────────────────────────────────────────
INSERT INTO notices (title, body, audience, posted_by, expires_on) VALUES
('Term 1 Fee Deadline',
 'All Term 1 fees must be cleared by 28th February 2025. Contact the bursar for payment plans.',
 'Students,Parents', 5, '2025-02-28'),
('Staff Meeting — Monday',
 'Mandatory staff meeting on Monday 17th Feb at 3 PM in the staffroom.',
 'Staff', 6, '2025-02-17'),
('Sports Day Notice',
 'Inter-class sports day is scheduled for 4th April 2025. All students must participate.',
 'Students,Parents', 6, '2025-04-04');


-- ============================================================
-- SECTION 5 : QUICK VERIFICATION QUERIES
-- (Run these after import to confirm everything works)
-- ============================================================
/*
-- Count rows in every table
SELECT 'classes'          AS tbl, COUNT(*) AS rows FROM classes
UNION ALL SELECT 'terms',           COUNT(*) FROM terms
UNION ALL SELECT 'students',        COUNT(*) FROM students
UNION ALL SELECT 'student_contacts',COUNT(*) FROM student_contacts
UNION ALL SELECT 'fee_types',       COUNT(*) FROM fee_types
UNION ALL SELECT 'fee_structure',   COUNT(*) FROM fee_structure
UNION ALL SELECT 'payments',        COUNT(*) FROM payments
UNION ALL SELECT 'payment_receipts',COUNT(*) FROM payment_receipts
UNION ALL SELECT 'staff',           COUNT(*) FROM staff
UNION ALL SELECT 'subjects',        COUNT(*) FROM subjects
UNION ALL SELECT 'class_teacher',   COUNT(*) FROM class_teacher
UNION ALL SELECT 'subject_teacher', COUNT(*) FROM subject_teacher
UNION ALL SELECT 'attendance',      COUNT(*) FROM attendance
UNION ALL SELECT 'exams',           COUNT(*) FROM exams
UNION ALL SELECT 'exam_results',    COUNT(*) FROM exam_results
UNION ALL SELECT 'books',           COUNT(*) FROM books
UNION ALL SELECT 'book_loans',      COUNT(*) FROM book_loans
UNION ALL SELECT 'notices',         COUNT(*) FROM notices;

-- Student payment summary
SELECT s.student_no, CONCAT(s.first_name,' ',s.last_name) AS student,
       SUM(p.amount) AS total_paid
FROM   students s
JOIN   payments p USING (student_id)
GROUP  BY s.student_id;

-- Receipt look-up
SELECT pr.receipt_no, p.payment_code, CONCAT(s.first_name,' ',s.last_name) AS student,
       p.amount, p.payment_date, p.payment_method
FROM   payment_receipts pr
JOIN   payments  p USING (payment_id)
JOIN   students  s USING (student_id);
*/

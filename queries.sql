-- Query 1: Select all students and their class names
SELECT student_names, student_number, class 
FROM students;

-- Query 2: Find all students in Senior 4
SELECT * FROM students 
WHERE class = 'Senior 4';

-- Query 3: List all payments made this term
SELECT * FROM payments 
WHERE payment_date >= '2026-01-01';

-- Query 4: Show all staff and their roles
SELECT name, role 
FROM staff;

-- Query 5: Find all subjects
SELECT subject_name
FROM subjects;

-- Query 6: Find active/enrolled students
SELECT * FROM students 
WHERE status = 'enrolled';

-- Query 7: Mobile Money payments
SELECT * FROM payments 
WHERE payment_method = 'Mobile Money';

-- Query 8: Students born after 2008
SELECT * FROM students 
WHERE date_of_birth > '2008-12-31';

-- Query 9: Fees greater than 100,000
SELECT * FROM fee_structure 
WHERE amount > 100000;

-- Query 10: Staff hired in the last 3 years
SELECT * FROM staff 
WHERE hire_date >= NOW() - INTERVAL 3 YEAR;

-- Query 11: Total students per class
SELECT class, COUNT(*) AS total_students 
FROM students 
GROUP BY class;

-- Query 12: Sum total fees collected
SELECT term_id, SUM(amount_paid) AS total_fees_collected 
FROM payments
GROUP BY term_id;

-- Query 13: Count payments per method
SELECT payment_method, COUNT(*) AS number_of_payments 
FROM payments 
GROUP BY payment_method;

-- Query 14: Average marks per subject
SELECT subject_id, AVG(marks) AS average_score 
FROM exam_results 
GROUP BY subject_id;

-- Query 15: Count student statuses
SELECT status, COUNT(*) AS student_count 
FROM students 
GROUP BY status;

-- JOIN QUERIES
-- Query 16: Student details and amount paid
SELECT s.student_names, s.class, p.amount_paid 
FROM payments p
JOIN students s ON p.student_id = s.student_id;

-- Query 17: Payment with student name and receipt number
SELECT s.student_names, p.amount_paid, r.reciept_number 
FROM payments p
JOIN students s ON p.student_id = s.student_id
JOIN payment_reciepts r ON r.payment_id = p.payments_id;

-- Query 18: Exam results with names
SELECT s.student_names, sub.subject_name, er.marks, er.grade 
FROM exam_results er
JOIN students s ON er.student_id = s.student_id
JOIN subjects sub ON er.subject_id = sub.subject_id;

-- Query 19: Attendance with student details
SELECT s.student_names, s.class, a.date, a.status 
FROM attendance a
JOIN students s ON a.student_id = s.student_id;

-- Query 20: Fee structure combinations
SELECT c.class_name, f.fee_type, fs.amount 
FROM fee_structure fs
JOIN classes c ON fs.class_id = c.class_id
JOIN fee_type f ON fs.fee_type_id = f.fee_type_id;
-- AgroLink School Database
-- File: 03_queries.sql — Verification queries
-- Database: agro_link

USE agro_link;

-- Total student count
SELECT COUNT(*) AS total_students FROM students;

-- Students per class
SELECT student_class, COUNT(*) AS count
FROM students
GROUP BY student_class;

-- Students by gender
SELECT student_gender, COUNT(*) AS count
FROM students
GROUP BY student_gender;

-- Sample records
SELECT * FROM students LIMIT 10;

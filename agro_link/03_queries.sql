-- AgroLink School Database
-- File: 03_queries.sql — Verification queries
-- Database: agro_link
-- Intern: OPIYO OSCAR
-- Student No: 2300701330
-- Reg Number: 23/U/1330
-- University: Makerere University
-- Track: Web Development

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

-- First 20 records (key fields)
SELECT id, student_name, student_age, student_gender, nationality, student_class, student_order, entry_year, student_adm_number, student_code
FROM students
LIMIT 20;

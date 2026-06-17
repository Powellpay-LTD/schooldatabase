TOPPERFORMING STUDENTS ANALYSIS
Mary Namusokeis thetop-performing studentwith the highest average mark.

SELECT
    s.student_number AS student_no,
    s.full_name AS student_name,
    c.class_name,
    ROUND(AVG(er.marks), 2) AS average_mark,
    COUNT(DISTINCT er.subject_id) AS subjects_sat
FROM exam_results er
JOIN students s
    ON er.student_id = s.student_id
JOIN classes c
    ON s.class_id = c.class_id
GROUP BY
    s.student_id,
    s.student_number,
    s.full_name,
    c.class_name
ORDER BY average_mark DESC
LIMIT 10;


SUBJECTPERFORMANCE ANALYSIS
English has the lowest average scoreand may require additional support.

SELECT
    sub.subject_code,
    sub.subject_name,
    ROUND(AVG(er.marks), 2) AS average_mark,
    COUNT(er.student_id) AS students_examined
FROM exam_results er
JOIN subjects sub
    ON er.subject_id = sub.subject_id
GROUP BY
    sub.subject_id,
    sub.subject_code,
    sub.subject_name
ORDER BY average_mark ASC;

CLASSCOMPARISON ANALYSIS
 Senior One achieved the highest class average among all classes.
SELECT
    c.class_name,
    ROUND(AVG(er.marks), 2) AS class_average,
    COUNT(DISTINCT er.student_id) AS total_students
FROM exam_results er
JOIN students s
    ON er.student_id = s.student_id
JOIN classes c
    ON s.class_id = c.class_id
GROUP BY
    c.class_id,
    c.class_name
ORDER BY class_average DESC;
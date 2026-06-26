SELECT
s.full_name,
st.name AS stream
FROM students s
JOIN enrollments e
ON s.id=e.student_id
JOIN streams st
ON st.id=e.stream_id;

SELECT
s.full_name,
g.full_name AS guardian
FROM students s
JOIN student_guardians sg
ON s.id=sg.student_id
JOIN guardians g
ON g.id=sg.guardian_id;

SELECT
s.full_name,
sub.name,
r.final_score,
r.grade
FROM subject_term_results r
JOIN students s
ON r.student_id=s.id
JOIN subjects sub
ON r.subject_id=sub.id;

SELECT 
    s.full_name,
    i.amount_due,
    COALESCE(SUM(p.amount_paid),0) AS total_paid,
    (i.amount_due - COALESCE(SUM(p.amount_paid),0)) AS balance
FROM invoices i
JOIN students s ON i.student_id = s.id
LEFT JOIN payments p ON i.id = p.invoice_id
GROUP BY i.id;

SELECT 
    SUM(amount_paid) AS total_revenue
FROM payments;


SELECT 'Students' AS type, COUNT(*) FROM students
UNION
SELECT 'Teachers', COUNT(*) FROM staff
UNION
SELECT 'Subjects', COUNT(*) FROM subjects
UNION
SELECT 'Streams', COUNT(*) FROM streams;
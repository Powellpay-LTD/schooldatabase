STUDENT FEE BALANCE VIEW
CREATE VIEW v_student_fee_balance AS
SELECT
    s.student_number AS student_no,
    s.full_name AS student_name,
    c.class_name AS class_name,
    t.term_name AS term,

    COALESCE(f.total_due, 0) AS total_due,
    COALESCE(p.total_paid, 0) AS total_paid,

    COALESCE(f.total_due, 0) - COALESCE(p.total_paid, 0) AS balance,

    CASE
        WHEN COALESCE(f.total_due, 0) - COALESCE(p.total_paid, 0) <= 0
            THEN 'CLEARED'
        ELSE 'PENDING'
    END AS status

FROM students s

JOIN classes c
    ON s.class_id = c.class_id

CROSS JOIN terms t

LEFT JOIN (
    SELECT
        class_id,
        term_id,
        SUM(amount) AS total_due
    FROM fee_structure
    GROUP BY class_id, term_id
) f
    ON c.class_id = f.class_id
   AND t.term_id = f.term_id

LEFT JOIN (
    SELECT
        student_id,
        SUM(amount_paid) AS total_paid
    FROM payments
    GROUP BY student_id
) p
    ON s.student_id = p.student_id;
    


TOPEXAM PERFORMERS VIEW
    CREATE VIEW v_top_exam_performers AS
SELECT
    s.student_number AS student_no,
    s.full_name AS student_name,
    c.class_name,
    e.exam_name,

    ROUND(AVG(er.marks),2) AS average_mark,
    COUNT(er.subject_id) AS subjects_sat

FROM exam_results er

JOIN students s
    ON er.student_id = s.student_id

JOIN classes c
    ON s.class_id = c.class_id

JOIN exams e
    ON er.exam_id = e.exam_id

GROUP BY
    s.student_id,
    e.exam_id

ORDER BY average_mark DESC;





PAYMENT SUMMARY VIEW
CREATE VIEW v_payment_summary AS
SELECT
    payment_method,

    COUNT(*) AS total_transactions,

    SUM(amount_paid) AS total_amount,

    MIN(payment_date) AS first_payment,

    MAX(payment_date) AS last_payment

FROM payments

GROUP BY payment_method;

ATTENDANCE SUMMARY VIEW
CREATE VIEW v_attendance_summary AS
SELECT
    s.student_number AS student_no,
    s.full_name AS student_name,
    c.class_name AS class_name,

    COUNT(CASE WHEN a.status = 'Present' THEN 1 END) AS days_present,
    COUNT(CASE WHEN a.status = 'Absent' THEN 1 END) AS days_absent,
    COUNT(CASE WHEN a.status = 'Late' THEN 1 END) AS days_late,

    ROUND(
        (
            COUNT(CASE WHEN a.status = 'Present' THEN 1 END)
            /
            NULLIF(COUNT(*),0)
        ) * 100,
        2
    ) AS attendance_pct

FROM students s
JOIN classes c
    ON s.class_id = c.class_id

LEFT JOIN attendance a
    ON s.student_id = a.student_id

GROUP BY
    s.student_id,
    s.student_number,
    s.full_name,
    c.class_name;
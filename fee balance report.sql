SELECT
    s.student_number AS student_no,
    s.full_name AS student_name,
    c.class_name,

    COALESCE(f.total_fees, 0) AS total_fees_expected,
    COALESCE(p.total_paid, 0) AS total_paid,

    COALESCE(f.total_fees, 0) - COALESCE(p.total_paid, 0) AS outstanding_balance,

    CASE
        WHEN COALESCE(p.total_paid, 0) = 0 THEN 'UNPAID'
        WHEN COALESCE(p.total_paid, 0) >= COALESCE(f.total_fees, 0)
             THEN 'FULLY PAID'
        ELSE 'PARTIAL'
    END AS payment_status

FROM students s

JOIN classes c
    ON s.class_id = c.class_id

LEFT JOIN (
    SELECT
        class_id,
        SUM(amount) AS total_fees
    FROM fee_structure
    GROUP BY class_id
) f
    ON c.class_id = f.class_id

LEFT JOIN (
    SELECT
        student_id,
        SUM(amount_paid) AS total_paid
    FROM payments
    GROUP BY student_id
) p
    ON s.student_id = p.student_id

ORDER BY outstanding_balance DESC;
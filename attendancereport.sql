SELECT
    s.student_number AS student_no,
    s.full_name,
    c.class_name,

    SUM(a.status = 'Present') AS days_present,
    SUM(a.status = 'Absent') AS days_absent,
    SUM(a.status = 'Late') AS days_late,

    COUNT(*) AS total_days_recorded,

    ROUND(
        (SUM(a.status = 'Present') / COUNT(*)) * 100,
        1
    ) AS attendance_percentage,

    CASE
        WHEN ROUND(
            (SUM(a.status = 'Present') / COUNT(*)) * 100,
            1
        ) < 75
        THEN 'AT RISK'
        ELSE 'GOOD'
    END AS attendance_flag

FROM attendance a

JOIN students s
    ON a.student_id = s.student_id

JOIN classes c
    ON s.class_id = c.class_id

GROUP BY
    s.student_id,
    s.student_number,
    s.full_name,
    c.class_name

ORDER BY attendance_percentage ASC;
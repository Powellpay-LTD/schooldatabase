
CREATE OR REPLACE VIEW FeeBalanceSummary AS
SELECT
    CONCAT(s.first_name, ' ', s.last_name) AS full_name,
    COALESCE(SUM(p.amount_paid), 0) AS total_paid,
    500000 - COALESCE(SUM(p.amount_paid), 0) AS outstanding_balance
FROM student s
LEFT JOIN payment p
    ON s.student_no = p.student_no
WHERE s.student_no = 'ST001'
GROUP BY
    s.student_no,
    s.first_name,
    s.last_name;

CREATE OR REPLACE VIEW Amount due AS
    SELECT
    s.student_no,
    s.first_name,
    s.class_name,
    COALESCE(SUM(p.amount_paid), 0) AS total_paid,
    500000 - COALESCE(SUM(p.amount_paid), 0) AS balance_due
FROM student s
LEFT JOIN payment p
    ON s.student_no = p.student_no
GROUP BY
    s.student_no,
    s.first_name,
    s.class_name
LIMIT 25;


CREATE   OR REPLACE VIEW PaymentSummary AS
SELECT
    p.payment_code,
    s.student_no,
    CONCAT(s.first_name, ' ', s.last_name) AS student_name,
    p.amount_paid,
    p.payment_date
FROM payment p
JOIN student s
    ON p.student_no = s.student_no;

    

    CREATE OR REPLACE VIEW ReceiptDetails AS
SELECT
    r.ReceiptNo,
    p.payment_code,
    p.amount_paid,
    p.payment_date
FROM payment_receipt r
JOIN payment p
    ON r.ReceiptNo = p.payment_code;
INSERT INTO student (
    student_no,
    first_name,
    last_name,
    gender,
    date_of_birth,
    class_name,
    enrollment_date,
    status,
    class_id
) VALUES
('ST001', 'John', 'Okello', 'Male', '2012-05-14', 'P5A', '2026-01-20', 'Active', NULL),
('ST002', 'Sarah', 'Namutebi', 'Female', '2013-08-10', 'P4B', '2026-01-20', 'Active', NULL),
('ST003', 'Peter', 'Kato', 'Male', '2011-03-22', 'P6A', '2025-01-15', 'Active', NULL),
('ST004', 'Grace', 'Nansubuga', 'Female', '2012-07-18', 'P5A', '2026-01-20', 'Active', NULL),
('ST005', 'David', 'Ssemanda', 'Male', '2013-01-30', 'P4A', '2026-01-20', 'Active', NULL),
('ST006', 'Ruth', 'Nakato', 'Female', '2011-11-12', 'P6A', '2025-01-15', 'Active', NULL),
('ST007', 'Michael', 'Mugisha', 'Male', '2012-09-05', 'P5B', '2026-01-20', 'Active', NULL),
('ST008', 'Esther', 'Achieng', 'Female', '2013-04-25', 'P4B', '2026-01-20', 'Active', NULL),
('ST009', 'Brian', 'Tumusiime', 'Male', '2011-06-15', 'P6B', '2025-01-15', 'Active', NULL),
('ST010', 'Patricia', 'Namaganda', 'Female', '2012-12-08', 'P5A', '2026-01-20', 'Active', NULL);



INSERT INTO class(
    class_id,
    class_name,
    stream,
    level,
    capacity
) VALUES
('CLS001', 'P4', 'A', 'Primary', 45),
('CLS002', 'P4', 'B', 'Primary', 70),
('CLS003', 'P5', 'A', 'Primary', 40),
('CLS004', 'P5', 'B', 'Primary', 50),
('CLS005', 'P6', 'A', 'Primary', 65),
('CLS006', 'P6', 'B', 'Primary', 50),
('CLS007', 'P7', 'A', 'Primary', 60);


INSERT INTO term (
    term_id,
    term_name,
    academic_year,
    start_date,
    end_date,
    active
) VALUES
('T001', 'Term I', 2026, '2026-02-03', '2026-05-02', 'Yes'),
('T002', 'Term II', 2026, '2026-05-26', '2026-08-22', 'No'),
('T003', 'Term III', 2026, '2026-09-15', '2026-12-05', 'No');

INSERT INTO fee_structure_1 (
    class,
    term,
    fee_type,
    amount_ugx
) VALUES
('P4', 'Term I', 'Tuition', 350000),
('P5', 'Term I', 'Tuition', 400000),
('P6', 'Term I', 'Tuition', 450000),
('P4', 'Term I', 'PTA', 50000),
('P5', 'Term I', 'PTA', 50000),
('P6', 'Term I', 'PTA', 50000);


INSERT INTO fee_type (
    fee_type_id,
    fee_type
) VALUES
('FT001', 'Tuition'),
('FT002', 'Development Fee'),
('FT003', 'PTA'),
('FT004', 'Sports'),
('FT005', 'Computer Lab');


INSERT INTO payment (
    payment_code,
    student_no,
    amount_paid,
    payment_date,
    method,
    reference_no
) VALUES
('PAY001', 'ST001', 200000, '2026-02-05', 'Cash', 'CASH001'),
('PAY002', 'ST002', 350000, '2026-02-06', 'Mobile Money', 'MOMO002'),
('PAY003', 'ST003', 450000, '2026-02-07', 'Bank', 'BANK003'),
('PAY004', 'ST004', 200000, '2026-02-08', 'Cash', 'CASH004'),
('PAY005', 'ST005', 350000, '2026-02-08', 'Mobile Money', 'MOMO005'),
('PAY006', 'ST006', 450000, '2026-02-09', 'Bank', 'BANK006'),
('PAY007', 'ST007', 200000, '2026-02-10', 'Cash', 'CASH007'),
('PAY008', 'ST008', 350000, '2026-02-10', 'Mobile Money', 'MOMO008'),
('PAY009', 'ST009', 450000, '2026-02-11', 'Bank', 'BANK009'),
('PAY010', 'ST010', 200000, '2026-02-11', 'Cash', 'CASH010');


INSERT INTO payment_receipt (
    receipt_no,
    payment_code,
    issued_by,
    date_issued
) VALUES
('RC001', 'PAY001', 'Bursar', '2026-02-05'),
('RC002', 'PAY002', 'Bursar', '2026-02-06'),
('RC003', 'PAY003', 'Bursar', '2026-02-07'),
('RC004', 'PAY004', 'Bursar', '2026-02-08'),
('RC005', 'PAY005', 'Bursar', '2026-02-08'),
('RC006', 'PAY006', 'Bursar', '2026-02-09'),
('RC007', 'PAY007', 'Bursar', '2026-02-10'),
('RC008', 'PAY008', 'Bursar', '2026-02-10'),
('RC009', 'PAY009', 'Bursar', '2026-02-11'),
('RC010', 'PAY010', 'Bursar', '2026-02-11');
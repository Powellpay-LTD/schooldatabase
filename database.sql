
CREATE DATABASE IF NOT EXISTS schoolpay;
USE schoolpay;

CREATE TABLE student (
    student_no VARCHAR(10),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    gender VARCHAR(10),
    date_of_birth DATE,
    class_id VARCHAR(10),
    parent_name VARCHAR(100),
    phone VARCHAR(20)
);

CREATE TABLE class (
    class_id VARCHAR(20) PRIMARY KEY,
    class_name VARCHAR(50),
    stream VARCHAR(20),
    level VARCHAR(20),
    capacity INT
);

CREATE TABLE term (
    term_id VARCHAR(20) PRIMARY KEY,
    term_name VARCHAR(20),
    academic_year YEAR,
    start_date DATE,
    end_date DATE,
    active BOOLEAN
);

CREATE TABLE fee_types (
    fee_type_id VARCHAR(20) PRIMARY KEY,
    fee_name VARCHAR(50)
);
CREATE TABLE fee_structure (
    fee_structure_id INT AUTO_INCREMENT PRIMARY KEY,
    class_id VARCHAR(20),
    term_id VARCHAR(20),
    fee_type_id VARCHAR(20),
    amount DECIMAL(10,2),

    FOREIGN KEY (class_id) REFERENCES classes(class_id),
    FOREIGN KEY (term_id) REFERENCES terms(term_id),
    FOREIGN KEY (fee_type_id) REFERENCES fee_types(fee_type_id)
);
CREATE TABLE payment (
    payment_code VARCHAR(20) PRIMARY KEY,
    student_no VARCHAR(20),
    amount_paid DECIMAL(10,2),
    payment_date DATE,
    payment_method VARCHAR(30),
    reference_no VARCHAR(50),

    FOREIGN KEY (student_no)
    REFERENCES students(student_no)
);

CREATE TABLE payment_receipt (
    receipt_no VARCHAR(20) PRIMARY KEY,
    payment_code VARCHAR(20),
    issued_by VARCHAR(50),
    issued_date DATE,

    FOREIGN KEY (payment_code)
    REFERENCES payments(payment_code)
);
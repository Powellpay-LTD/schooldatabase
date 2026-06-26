 ==========================================

-- SCHOOL MANAGEMENT SYSTEM DATABASE

-- ==========================================



CREATE DATABASE IF NOT EXISTS ssms_uganda

CHARACTER SET utf8mb4

COLLATE utf8mb4_unicode_ci;



USE ssms_uganda;



-- ==========================================

-- 1. ROLES

-- ==========================================



CREATE TABLE roles (

    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    name VARCHAR(50) NOT NULL UNIQUE,

    description TEXT

) ENGINE=InnoDB;



-- ==========================================

-- 2. USERS

-- ==========================================



CREATE TABLE users (

    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    role_id INT UNSIGNED NOT NULL,

    full_name VARCHAR(120) NOT NULL,

    email VARCHAR(120) UNIQUE,

    password_hash VARCHAR(255) NOT NULL,

    is_active TINYINT(1) DEFAULT 1,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (role_id) REFERENCES roles(id)

) ENGINE=InnoDB;



-- ==========================================

-- 3. ACADEMIC YEARS

-- ==========================================



CREATE TABLE academic_years (

    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    name VARCHAR(20) NOT NULL,

    start_date DATE NOT NULL,

    end_date DATE NOT NULL,

    is_current TINYINT(1) DEFAULT 0

) ENGINE=InnoDB;



-- ==========================================

-- 4. TERMS

-- ==========================================



CREATE TABLE terms (

    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    academic_year_id INT UNSIGNED NOT NULL,

    term_number TINYINT NOT NULL,

    start_date DATE NOT NULL,

    end_date DATE NOT NULL,

    is_current TINYINT(1) DEFAULT 0,

    FOREIGN KEY (academic_year_id) REFERENCES academic_years(id)

) ENGINE=InnoDB;



-- ==========================================

-- 5. CLASS LEVELS

-- ==========================================



CREATE TABLE class_levels (

    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    name VARCHAR(10) NOT NULL UNIQUE,

    sort_order TINYINT NOT NULL DEFAULT 0

) ENGINE=InnoDB;



-- ==========================================

-- 6. STREAMS

-- ==========================================



CREATE TABLE streams (

    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    class_level_id INT UNSIGNED NOT NULL,

    academic_year_id INT UNSIGNED NOT NULL,

    name VARCHAR(30) NOT NULL,

    class_teacher_id INT UNSIGNED NULL,

    FOREIGN KEY (class_level_id) REFERENCES class_levels(id),

    FOREIGN KEY (academic_year_id) REFERENCES academic_years(id)

) ENGINE=InnoDB;



-- ==========================================

-- 7. STAFF

-- ==========================================



CREATE TABLE staff (

    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    user_id INT UNSIGNED NOT NULL UNIQUE,

    staff_number VARCHAR(20) NOT NULL UNIQUE,

    designation VARCHAR(80) NOT NULL,

    phone VARCHAR(20),

    employment_status ENUM('Active','On Leave','Terminated')

    DEFAULT 'Active',

    joined_at DATE,

    FOREIGN KEY (user_id) REFERENCES users(id)

) ENGINE=InnoDB;



ALTER TABLE streams

ADD CONSTRAINT fk_streams_teacher

FOREIGN KEY (class_teacher_id)

REFERENCES staff(id);



-- ==========================================

-- 8. STUDENTS

-- ==========================================



CREATE TABLE students (

    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    user_id INT UNSIGNED UNIQUE,

    admission_number VARCHAR(20) NOT NULL UNIQUE,

    full_name VARCHAR(120) NOT NULL,

    date_of_birth DATE,

    gender ENUM('Male','Female','Other'),

    status ENUM('Active','Completed','Withdrawn')

    DEFAULT 'Active',

    FOREIGN KEY (user_id) REFERENCES users(id)

) ENGINE=InnoDB;



-- ==========================================

-- 9. GUARDIANS

-- ==========================================



CREATE TABLE guardians (

    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    full_name VARCHAR(120) NOT NULL,

    phone VARCHAR(20) NOT NULL,

    email VARCHAR(120),

    relationship VARCHAR(50)

) ENGINE=InnoDB;



-- ==========================================

-- 10. STUDENT GUARDIANS

-- ==========================================



CREATE TABLE student_guardians (

    student_id INT UNSIGNED NOT NULL,

    guardian_id INT UNSIGNED NOT NULL,

    is_primary_contact TINYINT(1) DEFAULT 0,

    PRIMARY KEY (student_id, guardian_id),

    FOREIGN KEY (student_id) REFERENCES students(id),

    FOREIGN KEY (guardian_id) REFERENCES guardians(id)

) ENGINE=InnoDB;



-- ==========================================

-- 11. ENROLLMENTS

-- ==========================================



CREATE TABLE enrollments (

    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    student_id INT UNSIGNED NOT NULL,

    stream_id INT UNSIGNED NOT NULL,

    academic_year_id INT UNSIGNED NOT NULL,

    enrolled_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    UNIQUE (student_id, academic_year_id),

    FOREIGN KEY (student_id) REFERENCES students(id),

    FOREIGN KEY (stream_id) REFERENCES streams(id),

    FOREIGN KEY (academic_year_id) REFERENCES academic_years(id)

) ENGINE=InnoDB;-- ==========================================
-- 12. SUBJECTS
-- ==========================================
CREATE TABLE subjects (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(80) NOT NULL,
    code VARCHAR(10) NOT NULL UNIQUE,
    subject_type ENUM('Core','Elective','Pre-Vocational') DEFAULT 'Core'
) ENGINE=InnoDB;

-- ==========================================
-- 13. CLASS SUBJECTS
-- ==========================================
CREATE TABLE class_subjects (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    class_level_id INT UNSIGNED NOT NULL,
    subject_id INT UNSIGNED NOT NULL,
    is_core TINYINT(1) DEFAULT 1,
    teaching_periods_per_week TINYINT DEFAULT 5,
    UNIQUE (class_level_id, subject_id),
    FOREIGN KEY (class_level_id) REFERENCES class_levels(id),
    FOREIGN KEY (subject_id) REFERENCES subjects(id)
) ENGINE=InnoDB;

-- ==========================================
-- 14. LEARNER ELECTIVES
-- ==========================================
CREATE TABLE learner_electives (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    student_id INT UNSIGNED NOT NULL,
    subject_id INT UNSIGNED NOT NULL,
    term_id INT UNSIGNED NOT NULL,
    UNIQUE (student_id, subject_id, term_id),
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (subject_id) REFERENCES subjects(id),
    FOREIGN KEY (term_id) REFERENCES terms(id)
) ENGINE=InnoDB;

-- ==========================================
-- 15. SUBJECT TEACHER ASSIGNMENTS
-- ==========================================
CREATE TABLE subject_teacher_assignments (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    staff_id INT UNSIGNED NOT NULL,
    subject_id INT UNSIGNED NOT NULL,
    stream_id INT UNSIGNED NOT NULL,
    term_id INT UNSIGNED NOT NULL,
    UNIQUE (subject_id, stream_id, term_id),
    FOREIGN KEY (staff_id) REFERENCES staff(id),
    FOREIGN KEY (subject_id) REFERENCES subjects(id),
    FOREIGN KEY (stream_id) REFERENCES streams(id),
    FOREIGN KEY (term_id) REFERENCES terms(id)
) ENGINE=InnoDB;

-- ==========================================
-- 16. THEMES
-- ==========================================
CREATE TABLE themes (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    subject_id INT UNSIGNED NOT NULL,
    class_level_id INT UNSIGNED NOT NULL,
    name VARCHAR(120) NOT NULL,
    FOREIGN KEY (subject_id) REFERENCES subjects(id),
    FOREIGN KEY (class_level_id) REFERENCES class_levels(id)
) ENGINE=InnoDB;

-- ==========================================
-- 17. LEARNING OUTCOMES
-- ==========================================
CREATE TABLE learning_outcomes (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    theme_id INT UNSIGNED NOT NULL,
    description TEXT NOT NULL,
    FOREIGN KEY (theme_id) REFERENCES themes(id)
) ENGINE=InnoDB;

-- ==========================================
-- 18. GENERIC SKILLS
-- ==========================================
CREATE TABLE generic_skills (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT
) ENGINE=InnoDB;

-- ==========================================
-- 19. SKILL RATING LEVELS
-- ==========================================
CREATE TABLE skill_rating_levels (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    generic_skill_id INT UNSIGNED NOT NULL,
    level_value TINYINT NOT NULL,
    label VARCHAR(40) NOT NULL,
    FOREIGN KEY (generic_skill_id) REFERENCES generic_skills(id)
) ENGINE=InnoDB;

-- ==========================================
-- 20. GRADING SCALE
-- ==========================================
CREATE TABLE grading_scale (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    grade CHAR(1) NOT NULL UNIQUE,
    min_score DECIMAL(5,2) NOT NULL,
    max_score DECIMAL(5,2) NOT NULL,
    descriptor VARCHAR(40)
) ENGINE=InnoDB;

-- ==========================================
-- 21. ASSESSMENTS
-- ==========================================
CREATE TABLE assessments (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    student_id INT UNSIGNED NOT NULL,
    subject_id INT UNSIGNED NOT NULL,
    term_id INT UNSIGNED NOT NULL,
    stream_id INT UNSIGNED NOT NULL,
    assessment_type ENUM('CA','EOT') NOT NULL,
    title VARCHAR(80),
    score DECIMAL(6,2) NOT NULL,
    max_score DECIMAL(6,2) NOT NULL DEFAULT 100,
    recorded_by INT UNSIGNED NOT NULL,
    recorded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (subject_id) REFERENCES subjects(id),
    FOREIGN KEY (term_id) REFERENCES terms(id),
    FOREIGN KEY (stream_id) REFERENCES streams(id),
    FOREIGN KEY (recorded_by) REFERENCES staff(id)
) ENGINE=InnoDB;

-- ==========================================
-- 22. SUBJECT TERM RESULTS
-- ==========================================
CREATE TABLE subject_term_results (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    student_id INT UNSIGNED NOT NULL,
    subject_id INT UNSIGNED NOT NULL,
    term_id INT UNSIGNED NOT NULL,
    ca_score DECIMAL(6,2),
    eot_score DECIMAL(6,2),
    final_score DECIMAL(6,2),
    grade CHAR(1),
    UNIQUE(student_id, subject_id, term_id),
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (subject_id) REFERENCES subjects(id),
    FOREIGN KEY (term_id) REFERENCES terms(id)
) ENGINE=InnoDB;

-- ==========================================
-- 23. GENERIC SKILL RATINGS
-- ==========================================
CREATE TABLE generic_skill_ratings (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    student_id INT UNSIGNED NOT NULL,
    generic_skill_id INT UNSIGNED NOT NULL,
    term_id INT UNSIGNED NOT NULL,
    stream_id INT UNSIGNED NOT NULL,
    rating_level_id INT UNSIGNED NOT NULL,
    rated_by INT UNSIGNED NOT NULL,
    UNIQUE(student_id, generic_skill_id, term_id),
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (generic_skill_id) REFERENCES generic_skills(id),
    FOREIGN KEY (term_id) REFERENCES terms(id),
    FOREIGN KEY (stream_id) REFERENCES streams(id),
    FOREIGN KEY (rating_level_id) REFERENCES skill_rating_levels(id),
    FOREIGN KEY (rated_by) REFERENCES staff(id)
) ENGINE=InnoDB;

-- ==========================================
-- 24. REPORT CARDS
-- ==========================================
CREATE TABLE report_cards (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    student_id INT UNSIGNED NOT NULL,
    term_id INT UNSIGNED NOT NULL,
    stream_id INT UNSIGNED NOT NULL,
    days_present SMALLINT DEFAULT 0,
    days_absent SMALLINT DEFAULT 0,
    class_teacher_comment TEXT,
    head_teacher_comment TEXT,
    issued_at TIMESTAMP NULL,
    UNIQUE(student_id, term_id),
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (term_id) REFERENCES terms(id),
    FOREIGN KEY (stream_id) REFERENCES streams(id)
) ENGINE=InnoDB;

-- ==========================================
-- 25. ATTENDANCE
-- ==========================================
CREATE TABLE attendance (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    student_id INT UNSIGNED NOT NULL,
    stream_id INT UNSIGNED NOT NULL,
    term_id INT UNSIGNED NOT NULL,
    date DATE NOT NULL,
    status ENUM('Present','Absent','Late','Excused') NOT NULL,
    recorded_by INT UNSIGNED NOT NULL,
    UNIQUE(student_id, date),
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (stream_id) REFERENCES streams(id),
    FOREIGN KEY (term_id) REFERENCES terms(id),
    FOREIGN KEY (recorded_by) REFERENCES staff(id)
) ENGINE=InnoDB;

-- ==========================================
-- 26. PERIODS
-- ==========================================
CREATE TABLE periods (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    day_of_week TINYINT NOT NULL,
    period_num TINYINT NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    UNIQUE(day_of_week, period_num)
) ENGINE=InnoDB;

-- ==========================================
-- 27. TIMETABLE
-- ==========================================
CREATE TABLE timetable (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    stream_id INT UNSIGNED NOT NULL,
    subject_id INT UNSIGNED NOT NULL,
    staff_id INT UNSIGNED NOT NULL,
    period_id INT UNSIGNED NOT NULL,
    term_id INT UNSIGNED NOT NULL,
    UNIQUE(stream_id, period_id, term_id),
    UNIQUE(staff_id, period_id, term_id),
    FOREIGN KEY (stream_id) REFERENCES streams(id),
    FOREIGN KEY (subject_id) REFERENCES subjects(id),
    FOREIGN KEY (staff_id) REFERENCES staff(id),
    FOREIGN KEY (period_id) REFERENCES periods(id),
    FOREIGN KEY (term_id) REFERENCES terms(id)
) ENGINE=InnoDB;

-- ==========================================
-- 28. FEE STRUCTURES
-- ==========================================
CREATE TABLE fee_structures (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    class_level_id INT UNSIGNED NOT NULL,
    term_id INT UNSIGNED NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    description VARCHAR(120),
    UNIQUE(class_level_id, term_id),
    FOREIGN KEY (class_level_id) REFERENCES class_levels(id),
    FOREIGN KEY (term_id) REFERENCES terms(id)
) ENGINE=InnoDB;

-- ==========================================
-- 29. INVOICES
-- ==========================================
CREATE TABLE invoices (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    student_id INT UNSIGNED NOT NULL,
    fee_structure_id INT UNSIGNED NOT NULL,
    term_id INT UNSIGNED NOT NULL,
    amount_due DECIMAL(10,2) NOT NULL,
    issued_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(student_id, term_id),
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (fee_structure_id) REFERENCES fee_structures(id)
) ENGINE=InnoDB;

-- ==========================================
-- 30. PAYMENTS
-- ==========================================
CREATE TABLE payments (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    invoice_id INT UNSIGNED NOT NULL,
    amount_paid DECIMAL(10,2) NOT NULL,
    payment_method ENUM('Cash','Mobile Money','Bank') NOT NULL,
    reference_number VARCHAR(60),
    paid_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (invoice_id) REFERENCES invoices(id)
) ENGINE=InnoDB;

-- ==========================================
-- 31. DISCIPLINE RECORDS
-- ==========================================
CREATE TABLE discipline_records (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    student_id INT UNSIGNED NOT NULL,
    recorded_by INT UNSIGNED NOT NULL,
    incident_date DATE NOT NULL,
    description TEXT NOT NULL,
    action_taken VARCHAR(200),
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (recorded_by) REFERENCES staff(id)
) ENGINE=InnoDB;

-- ==========================================
-- 32. BOOKS
-- ==========================================
CREATE TABLE books (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    author VARCHAR(120),
    isbn VARCHAR(20) UNIQUE,
    total_copies TINYINT NOT NULL DEFAULT 1
) ENGINE=InnoDB;

-- ==========================================
-- 33. BOOK LOANS
-- ==========================================
CREATE TABLE book_loans (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    book_id INT UNSIGNED NOT NULL,
    borrower_type ENUM('student','staff') NOT NULL,
    borrower_id INT UNSIGNED NOT NULL,
    loaned_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    due_date DATE NOT NULL,
    returned_at TIMESTAMP NULL,
    FOREIGN KEY (book_id) REFERENCES books(id)
) ENGINE=InnoDB;

-- ==========================================
-- 34. ANNOUNCEMENTS
-- ==========================================
CREATE TABLE announcements (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    created_by INT UNSIGNED NOT NULL,
    title VARCHAR(200) NOT NULL,
    body TEXT NOT NULL,
    role_id INT UNSIGNED NULL,
    expires_at DATETIME NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (created_by) REFERENCES staff(id),
    FOREIGN KEY (role_id) REFERENCES roles(id)
) ENGINE=InnoDB;
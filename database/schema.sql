CREATE DATABASE IF NOT EXISTS ssms_uganda
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE ssms_uganda;


-- 1. ROLES
CREATE TABLE roles (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    description TEXT
) ENGINE=InnoDB;


-- 2. USERS
CREATE TABLE users (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    role_id INT UNSIGNED NOT NULL,
    full_name VARCHAR(120) NOT NULL,
    email VARCHAR(120) UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    is_active TINYINT(1) DEFAULT 1,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY(role_id) REFERENCES roles(id)
) ENGINE=InnoDB;


-- 3. ACADEMIC YEARS
CREATE TABLE academic_years (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    is_current TINYINT(1) DEFAULT 0
) ENGINE=InnoDB;


-- 4. TERMS
CREATE TABLE terms (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    academic_year_id INT UNSIGNED NOT NULL,
    term_number TINYINT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    is_current TINYINT(1) DEFAULT 0,
    FOREIGN KEY(academic_year_id) REFERENCES academic_years(id)
) ENGINE=InnoDB;


-- 5. CLASS LEVELS
CREATE TABLE class_levels (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(10) NOT NULL UNIQUE,
    sort_order TINYINT DEFAULT 0
) ENGINE=InnoDB;


-- 6. STAFF
CREATE TABLE staff (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    user_id INT UNSIGNED NOT NULL UNIQUE,
    staff_number VARCHAR(20) UNIQUE NOT NULL,
    designation VARCHAR(80) NOT NULL,
    phone VARCHAR(20),
    employment_status ENUM('Active','On Leave','Terminated')
    DEFAULT 'Active',
    joined_at DATE,
    FOREIGN KEY(user_id) REFERENCES users(id)
) ENGINE=InnoDB;


-- 7. STREAMS
CREATE TABLE streams (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    class_level_id INT UNSIGNED NOT NULL,
    academic_year_id INT UNSIGNED NOT NULL,
    name VARCHAR(30) NOT NULL,
    class_teacher_id INT UNSIGNED NULL,
    FOREIGN KEY(class_level_id) REFERENCES class_levels(id),
    FOREIGN KEY(academic_year_id) REFERENCES academic_years(id)
) ENGINE=InnoDB;


ALTER TABLE streams
ADD CONSTRAINT fk_stream_teacher
FOREIGN KEY(class_teacher_id) REFERENCES staff(id);


-- 8. STUDENTS
CREATE TABLE students (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    user_id INT UNSIGNED UNIQUE,
    admission_number VARCHAR(20) UNIQUE NOT NULL,
    full_name VARCHAR(120) NOT NULL,
    date_of_birth DATE,
    gender ENUM('Male','Female','Other'),
    status ENUM('Active','Completed','Withdrawn')
    DEFAULT 'Active',
    FOREIGN KEY(user_id) REFERENCES users(id)
) ENGINE=InnoDB;


-- 9. GUARDIANS
CREATE TABLE guardians (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(120) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    email VARCHAR(120),
    relationship VARCHAR(50)
) ENGINE=InnoDB;


-- 10. STUDENT GUARDIANS
CREATE TABLE student_guardians (
    student_id INT UNSIGNED,
    guardian_id INT UNSIGNED,
    is_primary_contact TINYINT DEFAULT 0,
    PRIMARY KEY(student_id,guardian_id),
    FOREIGN KEY(student_id) REFERENCES students(id),
    FOREIGN KEY(guardian_id) REFERENCES guardians(id)
) ENGINE=InnoDB;


-- 11. ENROLLMENTS
CREATE TABLE enrollments (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    student_id INT UNSIGNED NOT NULL,
    stream_id INT UNSIGNED NOT NULL,
    academic_year_id INT UNSIGNED NOT NULL,
    enrolled_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    UNIQUE(student_id,academic_year_id),

    FOREIGN KEY(student_id) REFERENCES students(id),
    FOREIGN KEY(stream_id) REFERENCES streams(id),
    FOREIGN KEY(academic_year_id) REFERENCES academic_years(id)
) ENGINE=InnoDB;


-- 12. SUBJECTS
CREATE TABLE subjects (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(80) NOT NULL,
    code VARCHAR(10) UNIQUE NOT NULL,
    subject_type ENUM('Core','Elective','Pre-Vocational')
    DEFAULT 'Core'
) ENGINE=InnoDB;


-- 13. CLASS SUBJECTS
CREATE TABLE class_subjects (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    class_level_id INT UNSIGNED,
    subject_id INT UNSIGNED,
    is_core TINYINT DEFAULT 1,

    FOREIGN KEY(class_level_id) REFERENCES class_levels(id),
    FOREIGN KEY(subject_id) REFERENCES subjects(id)
) ENGINE=InnoDB;


-- 14. LEARNER ELECTIVES
CREATE TABLE learner_electives (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    student_id INT UNSIGNED,
    subject_id INT UNSIGNED,
    term_id INT UNSIGNED,

    FOREIGN KEY(student_id) REFERENCES students(id),
    FOREIGN KEY(subject_id) REFERENCES subjects(id),
    FOREIGN KEY(term_id) REFERENCES terms(id)
) ENGINE=InnoDB;


-- 15. SUBJECT TEACHER ASSIGNMENTS
CREATE TABLE subject_teacher_assignments (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    staff_id INT UNSIGNED,
    subject_id INT UNSIGNED,
    stream_id INT UNSIGNED,
    term_id INT UNSIGNED,

    FOREIGN KEY(staff_id) REFERENCES staff(id),
    FOREIGN KEY(subject_id) REFERENCES subjects(id),
    FOREIGN KEY(stream_id) REFERENCES streams(id),
    FOREIGN KEY(term_id) REFERENCES terms(id)
) ENGINE=InnoDB;


-- 16. THEMES
CREATE TABLE themes (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    subject_id INT UNSIGNED,
    class_level_id INT UNSIGNED,
    name VARCHAR(120),

    FOREIGN KEY(subject_id) REFERENCES subjects(id),
    FOREIGN KEY(class_level_id) REFERENCES class_levels(id)
) ENGINE=InnoDB;


-- 17. LEARNING OUTCOMES
CREATE TABLE learning_outcomes (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    theme_id INT UNSIGNED,
    description TEXT,

    FOREIGN KEY(theme_id) REFERENCES themes(id)
) ENGINE=InnoDB;


-- 18. GENERIC SKILLS
CREATE TABLE generic_skills (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    description TEXT
) ENGINE=InnoDB;


-- 19. SKILL RATING LEVELS
CREATE TABLE skill_rating_levels (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    generic_skill_id INT UNSIGNED,
    level_value TINYINT,
    label VARCHAR(40),

    FOREIGN KEY(generic_skill_id)
    REFERENCES generic_skills(id)
) ENGINE=InnoDB;


-- 20. GRADING SCALE
CREATE TABLE grading_scale (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    grade CHAR(1),
    min_score DECIMAL(5,2),
    max_score DECIMAL(5,2),
    descriptor VARCHAR(40)
) ENGINE=InnoDB;


-- 21. ASSESSMENTS
CREATE TABLE assessments (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    student_id INT UNSIGNED,
    subject_id INT UNSIGNED,
    term_id INT UNSIGNED,
    stream_id INT UNSIGNED,
    score DECIMAL(6,2),

    FOREIGN KEY(student_id) REFERENCES students(id),
    FOREIGN KEY(subject_id) REFERENCES subjects(id),
    FOREIGN KEY(term_id) REFERENCES terms(id),
    FOREIGN KEY(stream_id) REFERENCES streams(id)
) ENGINE=InnoDB;


-- 22. SUBJECT TERM RESULTS
CREATE TABLE subject_term_results (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    student_id INT UNSIGNED,
    subject_id INT UNSIGNED,
    term_id INT UNSIGNED,
    final_score DECIMAL(6,2),
    grade CHAR(1),

    FOREIGN KEY(student_id) REFERENCES students(id),
    FOREIGN KEY(subject_id) REFERENCES subjects(id),
    FOREIGN KEY(term_id) REFERENCES terms(id)
) ENGINE=InnoDB;


-- 23. GENERIC SKILL RATINGS
CREATE TABLE generic_skill_ratings (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    student_id INT UNSIGNED,
    generic_skill_id INT UNSIGNED,
    term_id INT UNSIGNED,

    FOREIGN KEY(student_id) REFERENCES students(id),
    FOREIGN KEY(generic_skill_id) REFERENCES generic_skills(id),
    FOREIGN KEY(term_id) REFERENCES terms(id)
) ENGINE=InnoDB;


-- 24. REPORT CARDS
CREATE TABLE report_cards (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    student_id INT UNSIGNED,
    term_id INT UNSIGNED,
    comments TEXT,

    FOREIGN KEY(student_id) REFERENCES students(id),
    FOREIGN KEY(term_id) REFERENCES terms(id)
) ENGINE=InnoDB;


-- 25. ATTENDANCE
CREATE TABLE attendance (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    student_id INT UNSIGNED,
    date DATE,
    status VARCHAR(20),

    FOREIGN KEY(student_id) REFERENCES students(id)
) ENGINE=InnoDB;


-- 26. PERIODS
CREATE TABLE periods (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    day_of_week TINYINT,
    period_num TINYINT
) ENGINE=InnoDB;


-- 27. TIMETABLE
CREATE TABLE timetable (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    stream_id INT UNSIGNED,
    subject_id INT UNSIGNED,
    staff_id INT UNSIGNED,
    period_id INT UNSIGNED,

    FOREIGN KEY(stream_id) REFERENCES streams(id),
    FOREIGN KEY(subject_id) REFERENCES subjects(id),
    FOREIGN KEY(staff_id) REFERENCES staff(id),
    FOREIGN KEY(period_id) REFERENCES periods(id)
) ENGINE=InnoDB;


-- 28. FEE STRUCTURES
CREATE TABLE fee_structures (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    amount DECIMAL(10,2)
) ENGINE=InnoDB;


-- 29. INVOICES
CREATE TABLE invoices (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    student_id INT UNSIGNED,
    amount_due DECIMAL(10,2),

    FOREIGN KEY(student_id) REFERENCES students(id)
) ENGINE=InnoDB;


-- 30. PAYMENTS
CREATE TABLE payments (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    invoice_id INT UNSIGNED,
    amount_paid DECIMAL(10,2),

    FOREIGN KEY(invoice_id) REFERENCES invoices(id)
) ENGINE=InnoDB;


-- 31. DISCIPLINE
CREATE TABLE discipline_records (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    student_id INT UNSIGNED,
    description TEXT,

    FOREIGN KEY(student_id) REFERENCES students(id)
) ENGINE=InnoDB;


-- 32. BOOKS
CREATE TABLE books (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200),
    author VARCHAR(120)
) ENGINE=InnoDB;


-- 33. BOOK LOANS
CREATE TABLE book_loans (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    book_id INT UNSIGNED,

    FOREIGN KEY(book_id) REFERENCES books(id)
) ENGINE=InnoDB;


-- 34. ANNOUNCEMENTS
CREATE TABLE announcements (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200),
    body TEXT
) ENGINE=InnoDB;
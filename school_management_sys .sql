-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 16, 2026 at 11:30 AM
-- Server version: 8.4.7
-- PHP Version: 8.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `school_management_sys`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
CREATE TABLE IF NOT EXISTS `attendance` (
  `attendance_id` int NOT NULL AUTO_INCREMENT,
  `student_id` int NOT NULL,
  `date` date NOT NULL,
  `status` enum('Present','Absent','Late','Excused') COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`attendance_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
CREATE TABLE IF NOT EXISTS `books` (
  `book_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ISBN` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`book_id`),
  UNIQUE KEY `ISBN` (`ISBN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `book_loans`
--

DROP TABLE IF EXISTS `book_loans`;
CREATE TABLE IF NOT EXISTS `book_loans` (
  `loan_id` int NOT NULL AUTO_INCREMENT,
  `book_id` int NOT NULL,
  `borrower_type` enum('Student','Staff') COLLATE utf8mb4_unicode_ci NOT NULL,
  `borrower_id` int NOT NULL,
  `borrow_date` date NOT NULL,
  `due_date` date NOT NULL,
  `return_date` date NOT NULL,
  `fine_amount` decimal(10,2) NOT NULL,
  PRIMARY KEY (`loan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

DROP TABLE IF EXISTS `classes`;
CREATE TABLE IF NOT EXISTS `classes` (
  `class_id` int NOT NULL AUTO_INCREMENT,
  `class_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stream` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` enum('Primary','Secondary','A-Level') COLLATE utf8mb4_unicode_ci NOT NULL,
  `capacity` int NOT NULL,
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`class_id`, `class_name`, `stream`, `level`, `capacity`) VALUES
(1, 'Senior 1', 'A', 'Secondary', 40),
(2, 'Senior 1', 'B', 'Secondary', 30),
(3, 'Senior 2', 'A', 'Secondary', 50);

-- --------------------------------------------------------

--
-- Table structure for table `class_teacher`
--

DROP TABLE IF EXISTS `class_teacher`;
CREATE TABLE IF NOT EXISTS `class_teacher` (
  `class_teacher_id` int NOT NULL AUTO_INCREMENT,
  `class_id` int NOT NULL,
  `staff_id` int NOT NULL,
  `academic_year` int NOT NULL,
  PRIMARY KEY (`class_teacher_id`),
  UNIQUE KEY `class_id` (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exams`
--

DROP TABLE IF EXISTS `exams`;
CREATE TABLE IF NOT EXISTS `exams` (
  `exam_id` int NOT NULL AUTO_INCREMENT,
  `exam_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `term_id` int NOT NULL,
  `exam_date` date NOT NULL,
  PRIMARY KEY (`exam_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exam_results`
--

DROP TABLE IF EXISTS `exam_results`;
CREATE TABLE IF NOT EXISTS `exam_results` (
  `result_id` int NOT NULL AUTO_INCREMENT,
  `exam_id` int NOT NULL,
  `student_id` int NOT NULL,
  `subject_id` int NOT NULL,
  `marks` decimal(5,2) NOT NULL,
  `grade` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`result_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fee_structure`
--

DROP TABLE IF EXISTS `fee_structure`;
CREATE TABLE IF NOT EXISTS `fee_structure` (
  `fee_structure_id` int NOT NULL AUTO_INCREMENT,
  `class_id` int NOT NULL,
  `term_id` int NOT NULL,
  `fee_type_id` int NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  PRIMARY KEY (`fee_structure_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fee_type`
--

DROP TABLE IF EXISTS `fee_type`;
CREATE TABLE IF NOT EXISTS `fee_type` (
  `fee_type_id` int NOT NULL AUTO_INCREMENT,
  `fee_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`fee_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fee_type`
--

INSERT INTO `fee_type` (`fee_type_id`, `fee_type`) VALUES
(1, 'School Fees'),
(2, 'Lunch'),
(3, 'Remidial Lessons'),
(4, 'Study Trip');

-- --------------------------------------------------------

--
-- Table structure for table `notices`
--

DROP TABLE IF EXISTS `notices`;
CREATE TABLE IF NOT EXISTS `notices` (
  `notice_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `audience` enum('Students','Parents','Staff','All') COLLATE utf8mb4_unicode_ci NOT NULL,
  `posted_date` timestamp NOT NULL,
  `expiry` date NOT NULL,
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
CREATE TABLE IF NOT EXISTS `payments` (
  `payments_id` int NOT NULL AUTO_INCREMENT,
  `payment_code` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'unique format PAY-YYYY-000001(start with PAY the the yrear fllowed by a 6 digit value',
  `student_id` int NOT NULL,
  `term_id` int NOT NULL,
  `amount_paid` decimal(10,2) NOT NULL,
  `payment_date` date NOT NULL,
  `payment_method` enum('Cash','Mobile Money','Bank','Cheque') COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_number` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`payments_id`),
  UNIQUE KEY `payment_code` (`payment_code`)
) ;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`payments_id`, `payment_code`, `student_id`, `term_id`, `amount_paid`, `payment_date`, `payment_method`, `reference_number`) VALUES
(1, 'PAY-2026-000001', 1, 1, 100000.00, '2026-01-06', 'Cash', 'TID001'),
(2, 'PAY-2026-000002', 2, 2, 200000.00, '2026-02-10', 'Mobile Money', 'TID002'),
(3, 'PAY-2026-000003', 3, 3, 55000.00, '2026-04-15', 'Bank', 'TID003'),
(4, 'PAY-2025-000001', 4, 1, 123000.00, '2026-02-12', 'Cheque', 'TID004'),
(5, 'PAY-2025-000002', 5, 2, 250000.00, '2026-04-15', 'Cheque', 'TID005'),
(6, 'PAY-2025-000003', 6, 3, 199000.00, '2026-03-27', 'Bank', 'TID006'),
(7, 'PAY-2023-000001', 7, 1, 99000.00, '2026-03-02', 'Cash', 'TID007'),
(8, 'PAY-2023-000002', 8, 2, 120000.00, '2026-06-01', 'Mobile Money', 'TID008'),
(9, 'PAY-2020-000001', 9, 3, 230000.00, '2026-05-01', 'Cheque', 'TID009'),
(10, 'PAY-2020-000002', 10, 2, 190000.00, '2026-06-09', 'Cheque', 'TID010');

-- --------------------------------------------------------

--
-- Table structure for table `payment_reciepts`
--

DROP TABLE IF EXISTS `payment_reciepts`;
CREATE TABLE IF NOT EXISTS `payment_reciepts` (
  `reciept_id` int NOT NULL AUTO_INCREMENT,
  `reciept_number` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'unique format RCP-YYYY-000001',
  `payment_id` int NOT NULL,
  `issued_by` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`reciept_id`),
  UNIQUE KEY `reciept_number` (`reciept_number`),
  UNIQUE KEY `payment_id` (`payment_id`)
) ;

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
CREATE TABLE IF NOT EXISTS `staff` (
  `staff_id` int NOT NULL AUTO_INCREMENT,
  `staff_number` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT ' unique format TCH001 / BUR001',
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('Bursar','Teacher','Admin','Head Teacher') COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hire_date` date NOT NULL,
  PRIMARY KEY (`staff_id`),
  UNIQUE KEY `staff_number` (`staff_number`)
) ;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`staff_id`, `staff_number`, `name`, `role`, `phone`, `email`, `hire_date`) VALUES
(1, 'TCH001', 'WANGI BRIAN', 'Teacher', '0777123123', 'wangibrian@gmail.com', '2016-01-12'),
(2, 'BUR009', 'MILLY JESCA', 'Bursar', '0772345678', 'millyj@gmail.com', '2025-05-05');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
CREATE TABLE IF NOT EXISTS `students` (
  `student_id` int NOT NULL AUTO_INCREMENT,
  `student_names` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `student_number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Format: SCH2025001 (Must start with SCH, followed by year and 3 digits)',
  `gender` enum('male','female','','') COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_of_birth` date NOT NULL,
  `class` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enrollment_date` date NOT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`student_id`),
  UNIQUE KEY `student_number` (`student_number`)
) ;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`student_id`, `student_names`, `student_number`, `gender`, `date_of_birth`, `class`, `enrollment_date`, `status`) VALUES
(1, 'MAYANJA SAMUEL', 'SCH2026001', 'male', '2016-01-01', 'Senior 1', '2026-02-18', 'Enrolled'),
(2, 'BARYOMUNSI CHRISTOPHER', 'SCH2026002', 'male', '2009-06-20', 'Senior 2', '2026-05-29', 'Pending'),
(3, 'JANE RUTH', 'SCH2025001', 'female', '2008-04-04', 'Senior 2', '2026-01-01', 'Enrolled'),
(4, 'KAMUNTU EPHRAIM', 'SCH2020001', 'male', '2004-10-09', 'Senior 3', '2026-03-18', 'Enrolled'),
(5, 'NABAKOOBA JUDITH', 'SCH2025002', 'female', '2007-07-07', 'Senior 4', '2025-02-19', 'Enrolled'),
(6, 'BARUGAHARA BALAM', 'SCH2026003', 'male', '2009-01-28', 'Senior 1', '2026-01-28', 'Pending'),
(7, 'BUTIME TOM', 'SCH2026004', 'male', '0000-00-00', 'Senior 1', '2026-05-04', 'Enrolled'),
(8, 'ALUM SANDRA', 'SCH2010001', 'female', '0200-12-04', 'Senior 6', '0000-00-00', 'Enrolled'),
(9, 'ABER LILLIAN', 'SCH2010002', 'female', '2000-05-09', 'Senior 6', '0000-00-00', 'Enrolled'),
(10, 'KABOYO ALICE', 'SCH2025003', 'female', '0000-00-00', 'Senior 1', '2024-12-17', 'Enrolled');

-- --------------------------------------------------------

--
-- Table structure for table `student_contacts`
--

DROP TABLE IF EXISTS `student_contacts`;
CREATE TABLE IF NOT EXISTS `student_contacts` (
  `contact_id` int NOT NULL AUTO_INCREMENT,
  `student_id` int NOT NULL,
  `guardian_names` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_numbers` int NOT NULL,
  `relationship` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `emergency_contact` int NOT NULL,
  PRIMARY KEY (`contact_id`),
  UNIQUE KEY `student_id` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
CREATE TABLE IF NOT EXISTS `subjects` (
  `subject_id` int NOT NULL AUTO_INCREMENT,
  `subject_code` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'short uppercase code e.g. MTH, ENG, PHY',
  `subject_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`subject_id`),
  UNIQUE KEY `subject_code` (`subject_code`)
) ;

-- --------------------------------------------------------

--
-- Table structure for table `subject_teacher`
--

DROP TABLE IF EXISTS `subject_teacher`;
CREATE TABLE IF NOT EXISTS `subject_teacher` (
  `subject_teacher_id` int NOT NULL AUTO_INCREMENT,
  `staff_id` int NOT NULL,
  `subject_id` int NOT NULL,
  `class_id` int NOT NULL,
  PRIMARY KEY (`subject_teacher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `terms`
--

DROP TABLE IF EXISTS `terms`;
CREATE TABLE IF NOT EXISTS `terms` (
  `term_id` int NOT NULL AUTO_INCREMENT,
  `term_name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `academic_year` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `active_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`term_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `terms`
--

INSERT INTO `terms` (`term_id`, `term_name`, `academic_year`, `start_date`, `end_date`, `active_status`) VALUES
(1, 'Term 1', '2026', '2026-02-10', '2026-04-24', 'Completed'),
(2, 'Term 2', '2026', '2026-05-12', '2026-08-07', 'Ongoing'),
(3, 'Term 3', '2026', '2026-08-28', '2026-11-27', 'Inactive');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

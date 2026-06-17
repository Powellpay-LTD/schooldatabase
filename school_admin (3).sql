-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 12, 2026 at 10:05 PM
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
-- Database: `school admin`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
CREATE TABLE IF NOT EXISTS `attendance` (
  `attendance_id` int NOT NULL AUTO_INCREMENT,
  `student_id` int NOT NULL,
  `attendance_date` date NOT NULL,
  `status` enum('Present','Absent','Late') COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`attendance_id`),
  KEY `student_id` (`student_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`attendance_id`, `student_id`, `attendance_date`, `status`) VALUES
(1, 1, '2025-02-10', 'Present'),
(2, 2, '2025-02-10', 'Present'),
(3, 3, '2025-02-10', 'Absent'),
(4, 4, '2025-02-10', 'Late'),
(5, 1, '2025-02-11', 'Present'),
(6, 2, '2025-02-11', 'Absent'),
(7, 3, '2025-02-11', 'Present'),
(8, 4, '2025-02-11', 'Present');

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
CREATE TABLE IF NOT EXISTS `books` (
  `book_id` int NOT NULL AUTO_INCREMENT,
  `isbn` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `copies_available` int DEFAULT '0',
  PRIMARY KEY (`book_id`),
  UNIQUE KEY `isbn` (`isbn`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`book_id`, `isbn`, `title`, `author`, `subject`, `copies_available`) VALUES
(1, '978000001', 'Mathematics for Secondary Schools', 'J. Okello', 'Mathematics', 5),
(2, '978000002', 'English Grammar', 'P. Nsubuga', 'English', 4),
(3, '978000003', 'Integrated Science', 'D. Mugerwa', 'Science', 6),
(4, '978000004', 'East African History', 'A. Ssenyonjo', 'SST', 3),
(5, '978000005', 'Introduction to ICT', 'K. Namara', 'ICT', 7);

-- --------------------------------------------------------

--
-- Table structure for table `book_loans`
--

DROP TABLE IF EXISTS `book_loans`;
CREATE TABLE IF NOT EXISTS `book_loans` (
  `loan_id` int NOT NULL AUTO_INCREMENT,
  `book_id` int NOT NULL,
  `student_id` int NOT NULL,
  `loan_date` date NOT NULL,
  `due_date` date NOT NULL,
  `return_date` date DEFAULT NULL,
  PRIMARY KEY (`loan_id`),
  KEY `book_id` (`book_id`),
  KEY `student_id` (`student_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `book_loans`
--

INSERT INTO `book_loans` (`loan_id`, `book_id`, `student_id`, `loan_date`, `due_date`, `return_date`) VALUES
(1, 1, 1, '2025-02-01', '2025-02-15', '2025-02-14'),
(2, 2, 2, '2025-02-02', '2025-02-16', '2025-02-15'),
(3, 3, 3, '2025-02-03', '2025-02-17', NULL),
(4, 5, 4, '2025-02-04', '2025-02-18', NULL),
(5, 1, 1, '2025-02-01', '2025-02-15', '2025-02-14'),
(6, 2, 2, '2025-02-02', '2025-02-16', '2025-02-15'),
(7, 3, 3, '2025-02-03', '2025-02-17', NULL),
(8, 5, 4, '2025-02-04', '2025-02-18', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

DROP TABLE IF EXISTS `classes`;
CREATE TABLE IF NOT EXISTS `classes` (
  `class_id` int NOT NULL AUTO_INCREMENT,
  `class_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stream` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `capacity` int DEFAULT NULL,
  PRIMARY KEY (`class_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`class_id`, `class_name`, `stream`, `level`, `capacity`) VALUES
(1, 'Senior One', 'A', 'Secondary', 60),
(2, 'Senior Two', 'A', 'Secondary', 55),
(3, 'Senior Three', 'B', 'Secondary', 50);

-- --------------------------------------------------------

--
-- Table structure for table `class_teacher`
--

DROP TABLE IF EXISTS `class_teacher`;
CREATE TABLE IF NOT EXISTS `class_teacher` (
  `class_teacher_id` int NOT NULL AUTO_INCREMENT,
  `class_id` int NOT NULL,
  `staff_id` int NOT NULL,
  PRIMARY KEY (`class_teacher_id`),
  KEY `class_id` (`class_id`),
  KEY `staff_id` (`staff_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `class_teacher`
--

INSERT INTO `class_teacher` (`class_teacher_id`, `class_id`, `staff_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `exams`
--

DROP TABLE IF EXISTS `exams`;
CREATE TABLE IF NOT EXISTS `exams` (
  `exam_id` int NOT NULL AUTO_INCREMENT,
  `exam_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `term_id` int NOT NULL,
  `exam_date` date DEFAULT NULL,
  PRIMARY KEY (`exam_id`),
  KEY `term_id` (`term_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exams`
--

INSERT INTO `exams` (`exam_id`, `exam_name`, `term_id`, `exam_date`) VALUES
(1, 'Mid Term I', 1, '2025-03-15'),
(2, 'End Term I', 1, '2025-05-01');

-- --------------------------------------------------------

--
-- Table structure for table `exam_results`
--

DROP TABLE IF EXISTS `exam_results`;
CREATE TABLE IF NOT EXISTS `exam_results` (
  `result_id` int NOT NULL AUTO_INCREMENT,
  `student_id` int NOT NULL,
  `exam_id` int NOT NULL,
  `subject_id` int NOT NULL,
  `marks` decimal(5,2) NOT NULL,
  PRIMARY KEY (`result_id`),
  KEY `student_id` (`student_id`),
  KEY `exam_id` (`exam_id`),
  KEY `subject_id` (`subject_id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exam_results`
--

INSERT INTO `exam_results` (`result_id`, `student_id`, `exam_id`, `subject_id`, `marks`) VALUES
(1, 1, 1, 1, 85.00),
(2, 1, 1, 2, 78.00),
(3, 1, 1, 3, 80.00),
(4, 1, 1, 4, 74.00),
(5, 1, 1, 5, 88.00),
(6, 2, 1, 1, 92.00),
(7, 2, 1, 2, 89.00),
(8, 2, 1, 3, 95.00),
(9, 2, 1, 4, 90.00),
(10, 2, 1, 5, 94.00),
(11, 3, 1, 1, 70.00),
(12, 3, 1, 2, 68.00),
(13, 3, 1, 3, 75.00),
(14, 3, 1, 4, 72.00),
(15, 3, 1, 5, 78.00),
(16, 4, 1, 1, 81.00),
(17, 4, 1, 2, 84.00),
(18, 4, 1, 3, 79.00),
(19, 4, 1, 4, 88.00),
(20, 4, 1, 5, 85.00);

-- --------------------------------------------------------

--
-- Table structure for table `fee_structure`
--

DROP TABLE IF EXISTS `fee_structure`;
CREATE TABLE IF NOT EXISTS `fee_structure` (
  `fee_structure_id` int NOT NULL AUTO_INCREMENT,
  `class_id` int NOT NULL,
  `fee_type_id` int NOT NULL,
  `term_id` int NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  PRIMARY KEY (`fee_structure_id`),
  KEY `class_id` (`class_id`),
  KEY `fee_type_id` (`fee_type_id`),
  KEY `term_id` (`term_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fee_structure`
--

INSERT INTO `fee_structure` (`fee_structure_id`, `class_id`, `fee_type_id`, `term_id`, `amount`) VALUES
(1, 1, 1, 1, 500000.00),
(2, 1, 2, 1, 100000.00),
(3, 1, 3, 1, 50000.00),
(4, 2, 1, 1, 550000.00),
(5, 2, 2, 1, 100000.00),
(6, 2, 3, 1, 50000.00),
(7, 3, 1, 1, 600000.00),
(8, 3, 2, 1, 120000.00),
(9, 3, 3, 1, 60000.00);

-- --------------------------------------------------------

--
-- Table structure for table `fee_types`
--

DROP TABLE IF EXISTS `fee_types`;
CREATE TABLE IF NOT EXISTS `fee_types` (
  `fee_type_id` int NOT NULL AUTO_INCREMENT,
  `fee_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`fee_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fee_types`
--

INSERT INTO `fee_types` (`fee_type_id`, `fee_name`) VALUES
(1, 'Tuition'),
(2, 'Development Fee'),
(3, 'PTA'),
(4, 'Sports'),
(5, 'Computer Lab');

-- --------------------------------------------------------

--
-- Table structure for table `notices`
--

DROP TABLE IF EXISTS `notices`;
CREATE TABLE IF NOT EXISTS `notices` (
  `notice_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `audience` enum('Students','Parents','Staff','All') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `posted_date` date DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  PRIMARY KEY (`notice_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notices`
--

INSERT INTO `notices` (`notice_id`, `title`, `content`, `audience`, `posted_date`, `expiry_date`) VALUES
(1, 'Opening of Term', 'All students should report by 3rd February 2025.', 'All', '2025-01-25', '2025-02-05'),
(2, 'Exam Timetable', 'Mid Term examinations begin on 15th March 2025.', 'Students', '2025-03-01', '2025-03-20'),
(3, 'Fee Reminder', 'Parents are reminded to clear school fees balances.', 'Parents', '2025-03-05', '2025-03-31'),
(4, 'Opening of Term', 'All students should report by 3rd February 2025.', 'All', '2025-01-25', '2025-02-05'),
(5, 'Exam Timetable', 'Mid Term examinations begin on 15th March 2025.', 'Students', '2025-03-01', '2025-03-20'),
(6, 'Fee Reminder', 'Parents are reminded to clear school fees balances.', 'Parents', '2025-03-05', '2025-03-31');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
CREATE TABLE IF NOT EXISTS `payments` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `payment_code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `student_id` int NOT NULL,
  `amount_paid` decimal(12,2) NOT NULL,
  `payment_date` date NOT NULL,
  `payment_method` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_number` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  UNIQUE KEY `payment_code` (`payment_code`),
  KEY `student_id` (`student_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`payment_id`, `payment_code`, `student_id`, `amount_paid`, `payment_date`, `payment_method`, `reference_number`) VALUES
(1, 'PAY001', 1, 300000.00, '2025-02-10', 'Mobile Money', 'MM12345'),
(2, 'PAY002', 2, 650000.00, '2025-02-11', 'Cash', 'CASH001'),
(3, 'PAY003', 3, 400000.00, '2025-02-12', 'Bank', 'BK67890'),
(4, 'PAY004', 4, 500000.00, '2025-02-13', 'Mobile Money', 'MM54321');

-- --------------------------------------------------------

--
-- Table structure for table `payment_receipts`
--

DROP TABLE IF EXISTS `payment_receipts`;
CREATE TABLE IF NOT EXISTS `payment_receipts` (
  `receipt_id` int NOT NULL AUTO_INCREMENT,
  `receipt_number` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_id` int NOT NULL,
  `issue_date` date NOT NULL,
  `issued_by` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`receipt_id`),
  UNIQUE KEY `receipt_number` (`receipt_number`),
  KEY `payment_id` (`payment_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_receipts`
--

INSERT INTO `payment_receipts` (`receipt_id`, `receipt_number`, `payment_id`, `issue_date`, `issued_by`) VALUES
(1, 'RCP001', 1, '2025-02-10', 'Bursar'),
(2, 'RCP002', 2, '2025-02-11', 'Bursar'),
(3, 'RCP003', 3, '2025-02-12', 'Bursar'),
(4, 'RCP004', 4, '2025-02-13', 'Bursar');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
CREATE TABLE IF NOT EXISTS `staff` (
  `staff_id` int NOT NULL AUTO_INCREMENT,
  `staff_no` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `full_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hire_date` date DEFAULT NULL,
  PRIMARY KEY (`staff_id`),
  UNIQUE KEY `staff_no` (`staff_no`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`staff_id`, `staff_no`, `full_name`, `role`, `phone`, `hire_date`) VALUES
(1, 'TCH001', 'James Mugisha', 'Teacher', '0701000001', '2022-01-15'),
(2, 'TCH002', 'Sarah Nankya', 'Teacher', '0701000002', '2021-05-10'),
(3, 'TCH003', 'David Kasozi', 'Teacher', '0701000003', '2020-03-20'),
(4, 'BUR001', 'Grace Namutebi', 'Bursar', '0701000004', '2019-07-01'),
(5, 'ADM001', 'Peter Ssekandi', 'Administrator', '0701000005', '2018-02-12');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
CREATE TABLE IF NOT EXISTS `students` (
  `student_id` int NOT NULL AUTO_INCREMENT,
  `student_number` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `full_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `class_id` int DEFAULT NULL,
  `enrollment_date` date DEFAULT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`student_id`),
  UNIQUE KEY `student_number` (`student_number`),
  KEY `class_id` (`class_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`student_id`, `student_number`, `full_name`, `gender`, `date_of_birth`, `class_id`, `enrollment_date`, `status`) VALUES
(1, 'STU001', 'John Kato', 'Male', '2009-05-12', 1, '2025-02-01', 'Active'),
(2, 'STU002', 'Mary Namusoke', 'Female', '2008-09-20', 1, '2025-02-01', 'Active'),
(3, 'STU003', 'Peter Ssemanda', 'Male', '2008-11-15', 2, '2025-02-01', 'Active'),
(4, 'STU004', 'Sarah Nakato', 'Female', '2007-07-10', 3, '2025-02-01', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
CREATE TABLE IF NOT EXISTS `subjects` (
  `subject_id` int NOT NULL AUTO_INCREMENT,
  `subject_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`subject_id`),
  UNIQUE KEY `subject_code` (`subject_code`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`subject_id`, `subject_code`, `subject_name`) VALUES
(1, 'MAT', 'Mathematics'),
(2, 'ENG', 'English'),
(3, 'SCI', 'Science'),
(4, 'SST', 'Social Studies'),
(5, 'ICT', 'Computer Studies');

-- --------------------------------------------------------

--
-- Table structure for table `subject_teacher`
--

DROP TABLE IF EXISTS `subject_teacher`;
CREATE TABLE IF NOT EXISTS `subject_teacher` (
  `subject_teacher_id` int NOT NULL AUTO_INCREMENT,
  `subject_id` int NOT NULL,
  `class_id` int NOT NULL,
  `staff_id` int NOT NULL,
  PRIMARY KEY (`subject_teacher_id`),
  KEY `subject_id` (`subject_id`),
  KEY `class_id` (`class_id`),
  KEY `staff_id` (`staff_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subject_teacher`
--

INSERT INTO `subject_teacher` (`subject_teacher_id`, `subject_id`, `class_id`, `staff_id`) VALUES
(1, 1, 1, 1),
(2, 2, 1, 2),
(3, 3, 1, 3),
(4, 1, 2, 1),
(5, 2, 2, 2),
(6, 3, 2, 3),
(7, 1, 3, 1),
(8, 2, 3, 2),
(9, 3, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `terms`
--

DROP TABLE IF EXISTS `terms`;
CREATE TABLE IF NOT EXISTS `terms` (
  `term_id` int NOT NULL AUTO_INCREMENT,
  `term_name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `academic_year` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `active_status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`term_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `terms`
--

INSERT INTO `terms` (`term_id`, `term_name`, `academic_year`, `start_date`, `end_date`, `active_status`) VALUES
(1, 'Term I', '2025', '2025-02-03', '2025-05-02', 1),
(2, 'Term II', '2025', '2025-05-26', '2025-08-22', 0),
(3, 'Term III', '2025', '2025-09-15', '2025-12-05', 0);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_attendance_summary`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `v_attendance_summary`;
CREATE TABLE IF NOT EXISTS `v_attendance_summary` (
`attendance_pct` decimal(26,2)
,`class_name` varchar(50)
,`days_absent` bigint
,`days_late` bigint
,`days_present` bigint
,`student_name` varchar(100)
,`student_no` varchar(20)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_payment_summary`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `v_payment_summary`;
CREATE TABLE IF NOT EXISTS `v_payment_summary` (
`first_payment` date
,`last_payment` date
,`payment_method` varchar(50)
,`total_amount` decimal(34,2)
,`total_transactions` bigint
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_student_fee_balance`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `v_student_fee_balance`;
CREATE TABLE IF NOT EXISTS `v_student_fee_balance` (
`balance` decimal(35,2)
,`class_name` varchar(50)
,`status` varchar(7)
,`student_name` varchar(100)
,`student_no` varchar(20)
,`term` varchar(20)
,`total_due` decimal(34,2)
,`total_paid` decimal(34,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_top_exam_performers`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `v_top_exam_performers`;
CREATE TABLE IF NOT EXISTS `v_top_exam_performers` (
`average_mark` decimal(6,2)
,`class_name` varchar(50)
,`exam_name` varchar(100)
,`student_name` varchar(100)
,`student_no` varchar(20)
,`subjects_sat` bigint
);

-- --------------------------------------------------------

--
-- Structure for view `v_attendance_summary`
--
DROP TABLE IF EXISTS `v_attendance_summary`;

DROP VIEW IF EXISTS `v_attendance_summary`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_attendance_summary`  AS SELECT `s`.`student_number` AS `student_no`, `s`.`full_name` AS `student_name`, `c`.`class_name` AS `class_name`, count((case when (`a`.`status` = 'Present') then 1 end)) AS `days_present`, count((case when (`a`.`status` = 'Absent') then 1 end)) AS `days_absent`, count((case when (`a`.`status` = 'Late') then 1 end)) AS `days_late`, round(((count((case when (`a`.`status` = 'Present') then 1 end)) / nullif(count(0),0)) * 100),2) AS `attendance_pct` FROM ((`students` `s` join `classes` `c` on((`s`.`class_id` = `c`.`class_id`))) left join `attendance` `a` on((`s`.`student_id` = `a`.`student_id`))) GROUP BY `s`.`student_id`, `s`.`student_number`, `s`.`full_name`, `c`.`class_name` ;

-- --------------------------------------------------------

--
-- Structure for view `v_payment_summary`
--
DROP TABLE IF EXISTS `v_payment_summary`;

DROP VIEW IF EXISTS `v_payment_summary`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_payment_summary`  AS SELECT `payments`.`payment_method` AS `payment_method`, count(0) AS `total_transactions`, sum(`payments`.`amount_paid`) AS `total_amount`, min(`payments`.`payment_date`) AS `first_payment`, max(`payments`.`payment_date`) AS `last_payment` FROM `payments` GROUP BY `payments`.`payment_method` ;

-- --------------------------------------------------------

--
-- Structure for view `v_student_fee_balance`
--
DROP TABLE IF EXISTS `v_student_fee_balance`;

DROP VIEW IF EXISTS `v_student_fee_balance`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_student_fee_balance`  AS SELECT `s`.`student_number` AS `student_no`, `s`.`full_name` AS `student_name`, `c`.`class_name` AS `class_name`, `t`.`term_name` AS `term`, coalesce(`f`.`total_due`,0) AS `total_due`, coalesce(`p`.`total_paid`,0) AS `total_paid`, (coalesce(`f`.`total_due`,0) - coalesce(`p`.`total_paid`,0)) AS `balance`, (case when ((coalesce(`f`.`total_due`,0) - coalesce(`p`.`total_paid`,0)) <= 0) then 'CLEARED' else 'PENDING' end) AS `status` FROM ((((`students` `s` join `classes` `c` on((`s`.`class_id` = `c`.`class_id`))) join `terms` `t`) left join (select `fee_structure`.`class_id` AS `class_id`,`fee_structure`.`term_id` AS `term_id`,sum(`fee_structure`.`amount`) AS `total_due` from `fee_structure` group by `fee_structure`.`class_id`,`fee_structure`.`term_id`) `f` on(((`c`.`class_id` = `f`.`class_id`) and (`t`.`term_id` = `f`.`term_id`)))) left join (select `payments`.`student_id` AS `student_id`,sum(`payments`.`amount_paid`) AS `total_paid` from `payments` group by `payments`.`student_id`) `p` on((`s`.`student_id` = `p`.`student_id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `v_top_exam_performers`
--
DROP TABLE IF EXISTS `v_top_exam_performers`;

DROP VIEW IF EXISTS `v_top_exam_performers`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_top_exam_performers`  AS SELECT `s`.`student_number` AS `student_no`, `s`.`full_name` AS `student_name`, `c`.`class_name` AS `class_name`, `e`.`exam_name` AS `exam_name`, round(avg(`er`.`marks`),2) AS `average_mark`, count(`er`.`subject_id`) AS `subjects_sat` FROM (((`exam_results` `er` join `students` `s` on((`er`.`student_id` = `s`.`student_id`))) join `classes` `c` on((`s`.`class_id` = `c`.`class_id`))) join `exams` `e` on((`er`.`exam_id` = `e`.`exam_id`))) GROUP BY `s`.`student_id`, `e`.`exam_id` ORDER BY `average_mark` DESC ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

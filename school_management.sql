-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 12, 2026 at 10:04 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `school_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `attendance_id` int(11) NOT NULL,
  `student_number` varchar(20) NOT NULL,
  `date` date NOT NULL,
  `status` enum('Present','Absent','Late','Excused') NOT NULL,
  `recorded_by` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `isbn` varchar(20) NOT NULL,
  `title` varchar(255) NOT NULL,
  `author` varchar(150) NOT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `copies_available` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `book_loans`
--

CREATE TABLE `book_loans` (
  `loan_id` int(11) NOT NULL,
  `student_number` varchar(20) NOT NULL,
  `isbn` varchar(20) NOT NULL,
  `loan_date` date NOT NULL,
  `due_date` date NOT NULL,
  `return_date` date DEFAULT NULL,
  `fine_amount` decimal(10,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE `classes` (
  `class_id` int(11) NOT NULL,
  `class_name` varchar(50) NOT NULL,
  `stream` varchar(20) DEFAULT NULL,
  `level` enum('Primary','Secondary','A-Level') NOT NULL,
  `capacity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`class_id`, `class_name`, `stream`, `level`, `capacity`) VALUES
(1, 'Senior 1', 'A', 'Secondary', 40),
(2, 'Senior 1', 'B', 'Secondary', 40),
(3, 'Primary 1', 'Blue', 'Primary', 35);

-- --------------------------------------------------------

--
-- Table structure for table `class_teacher`
--

CREATE TABLE `class_teacher` (
  `class_teacher_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `staff_number` varchar(20) NOT NULL,
  `term_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exams`
--

CREATE TABLE `exams` (
  `exam_id` int(11) NOT NULL,
  `exam_name` varchar(100) NOT NULL,
  `type` enum('End of Term','Continuous Assessment','Mock','UNEB') NOT NULL,
  `term_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exam_results`
--

CREATE TABLE `exam_results` (
  `result_id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `student_number` varchar(20) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `marks` decimal(5,2) NOT NULL,
  `total_marks` decimal(5,2) NOT NULL,
  `grade` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fee_structure`
--

CREATE TABLE `fee_structure` (
  `fee_structure_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `fee_type_id` int(11) NOT NULL,
  `term_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fee_types`
--

CREATE TABLE `fee_types` (
  `fee_type_id` int(11) NOT NULL,
  `fee_type_name` enum('Tuition','Development Fee','PTA','Sports','Computer Lab','Lunch','Transport','Uniform') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fee_types`
--

INSERT INTO `fee_types` (`fee_type_id`, `fee_type_name`) VALUES
(1, 'Tuition'),
(2, 'Development Fee'),
(3, 'PTA'),
(4, 'Sports'),
(5, 'Computer Lab'),
(6, 'Lunch'),
(7, 'Transport'),
(8, 'Uniform');

-- --------------------------------------------------------

--
-- Table structure for table `notices`
--

CREATE TABLE `notices` (
  `notice_id` int(11) NOT NULL,
  `title` varchar(150) NOT NULL,
  `content` text NOT NULL,
  `audience` enum('Students','Parents','Staff','All') NOT NULL,
  `posted_date` date NOT NULL,
  `expiry_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_code` varchar(50) NOT NULL,
  `student_number` varchar(20) NOT NULL,
  `amount_paid` decimal(10,2) NOT NULL,
  `date` date NOT NULL,
  `method` enum('Cash','Mobile Money','Bank','Cheque') NOT NULL,
  `reference_number` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`payment_code`, `student_number`, `amount_paid`, `date`, `method`, `reference_number`) VALUES
('PAY-2026-001', 'STD2026001', 500000.00, '2026-02-01', 'Bank', 'BK-REF1101'),
('PAY-2026-002', 'STD2026002', 450000.00, '2026-02-01', 'Mobile Money', 'MM-TXN001'),
('PAY-2026-003', 'STD2026003', 500000.00, '2026-02-02', 'Bank', 'BK-REF1102'),
('PAY-2026-004', 'STD2026004', 350000.00, '2026-02-02', 'Cash', NULL),
('PAY-2026-005', 'STD2026005', 500000.00, '2026-02-03', 'Cheque', 'CHQ-00041'),
('PAY-2026-006', 'STD2026006', 400000.00, '2026-02-03', 'Bank', 'BK-REF1103'),
('PAY-2026-007', 'STD2026007', 500000.00, '2026-02-04', 'Mobile Money', 'MM-TXN002'),
('PAY-2026-008', 'STD2026008', 300000.00, '2026-02-04', 'Cash', NULL),
('PAY-2026-009', 'STD2026009', 250000.00, '2026-02-05', 'Bank', 'BK-REF1104'),
('PAY-2026-010', 'STD2026010', 250000.00, '2026-02-05', 'Mobile Money', 'MM-TXN003');

-- --------------------------------------------------------

--
-- Table structure for table `payment_receipts`
--

CREATE TABLE `payment_receipts` (
  `receipt_number` varchar(50) NOT NULL,
  `payment_code` varchar(50) NOT NULL,
  `issued_by` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment_receipts`
--

INSERT INTO `payment_receipts` (`receipt_number`, `payment_code`, `issued_by`) VALUES
('REC-9001', 'PAY-2026-001', 'STF002'),
('REC-9002', 'PAY-2026-002', 'STF002'),
('REC-9003', 'PAY-2026-003', 'STF002'),
('REC-9004', 'PAY-2026-004', 'STF002'),
('REC-9005', 'PAY-2026-005', 'STF002'),
('REC-9006', 'PAY-2026-006', 'STF002'),
('REC-9007', 'PAY-2026-007', 'STF002'),
('REC-9008', 'PAY-2026-008', 'STF002'),
('REC-9009', 'PAY-2026-009', 'STF002'),
('REC-9010', 'PAY-2026-010', 'STF002');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `staff_number` varchar(20) NOT NULL,
  `names` varchar(150) NOT NULL,
  `role` enum('Teacher','Bursar','Admin','Head Teacher') NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `hire_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`staff_number`, `names`, `role`, `phone`, `email`, `hire_date`) VALUES
('STF001', 'John Kasasa', 'Head Teacher', '+256701111111', 'j.kasasa@school.com', '2015-01-10'),
('STF002', 'Sarah Nsubuga', 'Bursar', '+256702222222', 's.nsubuga@school.com', '2018-03-15'),
('STF003', 'Moses Mukasa', 'Teacher', '+256703333333', 'm.mukasa@school.com', '2020-02-01');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `student_number` varchar(20) NOT NULL,
  `names` varchar(150) NOT NULL,
  `gender` enum('Male','Female','Other') NOT NULL,
  `date_of_birth` date NOT NULL,
  `class_id` int(11) DEFAULT NULL,
  `enrollment_date` date NOT NULL,
  `status` varchar(20) DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`student_number`, `names`, `gender`, `date_of_birth`, `class_id`, `enrollment_date`, `status`) VALUES
('STD2026001', 'Brian Kato', 'Male', '2012-04-14', 1, '2026-01-20', 'Active'),
('STD2026002', 'Angel Namato', 'Female', '2013-08-23', 1, '2026-01-21', 'Active'),
('STD2026003', 'Derrick Wasswa', 'Male', '2012-11-02', 1, '2026-01-22', 'Active'),
('STD2026004', 'Fiona Naiga', 'Female', '2013-05-19', 1, '2026-01-25', 'Active'),
('STD2026005', 'Alex Kakooza', 'Male', '2012-09-12', 1, '2026-01-26', 'Active'),
('STD2026006', 'Sandra Nabakooza', 'Female', '2013-01-30', 2, '2026-01-26', 'Active'),
('STD2026007', 'Ian Ssewankambo', 'Male', '2012-07-15', 2, '2026-01-27', 'Active'),
('STD2026008', 'Patricia Namara', 'Female', '2013-03-08', 2, '2026-01-27', 'Active'),
('STD2026009', 'Micheal Opio', 'Male', '2019-10-11', 3, '2026-01-28', 'Active'),
('STD2026010', 'Esther Awor', 'Female', '2019-06-25', 3, '2026-01-28', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `student_contacts`
--

CREATE TABLE `student_contacts` (
  `contact_id` int(11) NOT NULL,
  `student_number` varchar(20) NOT NULL,
  `guardian_names` varchar(150) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `relationship` varchar(50) NOT NULL,
  `is_emergency_contact` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `subject_id` int(11) NOT NULL,
  `subject_name` varchar(100) NOT NULL,
  `subject_code` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`subject_id`, `subject_name`, `subject_code`) VALUES
(1, 'Mathematics', 'MTH'),
(2, 'English Language', 'ENG');

-- --------------------------------------------------------

--
-- Table structure for table `subject_teacher`
--

CREATE TABLE `subject_teacher` (
  `subject_teacher_id` int(11) NOT NULL,
  `staff_number` varchar(20) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `term_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `terms`
--

CREATE TABLE `terms` (
  `term_id` int(11) NOT NULL,
  `term_name` varchar(50) NOT NULL,
  `academic_year` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `active_status` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `terms`
--

INSERT INTO `terms` (`term_id`, `term_name`, `academic_year`, `start_date`, `end_date`, `active_status`) VALUES
(1, 'Term 1', 2026, '2026-02-02', '2026-05-01', 1),
(2, 'Term 2', 2026, '2026-05-25', '2026-08-21', 0),
(3, 'Term 3', 2026, '2026-09-14', '2026-12-04', 0);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_student_financial_balances`
-- (See below for the actual view)
--
CREATE TABLE `view_student_financial_balances` (
`student_number` varchar(20)
,`student_name` varchar(150)
,`class_name` varchar(50)
,`total_billed` decimal(32,2)
,`total_paid` decimal(32,2)
,`outstanding_balance` decimal(33,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_termly_academic_performance`
-- (See below for the actual view)
--
CREATE TABLE `view_termly_academic_performance` (
`result_id` int(11)
,`student_number` varchar(20)
,`student_name` varchar(150)
,`class_name` varchar(50)
,`subject_name` varchar(100)
,`exam_name` varchar(100)
,`exam_type` enum('End of Term','Continuous Assessment','Mock','UNEB')
,`marks` decimal(5,2)
,`total_marks` decimal(5,2)
,`grade` varchar(5)
,`term_name` varchar(50)
,`academic_year` int(11)
);

-- --------------------------------------------------------

--
-- Structure for view `view_student_financial_balances`
--
DROP TABLE IF EXISTS `view_student_financial_balances`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_student_financial_balances`  AS SELECT `s`.`student_number` AS `student_number`, `s`.`names` AS `student_name`, `c`.`class_name` AS `class_name`, coalesce(`fs`.`total_fees_billed`,0) AS `total_billed`, coalesce(`p`.`total_amount_paid`,0) AS `total_paid`, coalesce(`fs`.`total_fees_billed`,0) - coalesce(`p`.`total_amount_paid`,0) AS `outstanding_balance` FROM (((`students` `s` join `classes` `c` on(`s`.`class_id` = `c`.`class_id`)) left join (select `fee_structure`.`class_id` AS `class_id`,sum(`fee_structure`.`amount`) AS `total_fees_billed` from `fee_structure` group by `fee_structure`.`class_id`) `fs` on(`s`.`class_id` = `fs`.`class_id`)) left join (select `payments`.`student_number` AS `student_number`,sum(`payments`.`amount_paid`) AS `total_amount_paid` from `payments` group by `payments`.`student_number`) `p` on(`s`.`student_number` = `p`.`student_number`)) ;

-- --------------------------------------------------------

--
-- Structure for view `view_termly_academic_performance`
--
DROP TABLE IF EXISTS `view_termly_academic_performance`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_termly_academic_performance`  AS SELECT `er`.`result_id` AS `result_id`, `s`.`student_number` AS `student_number`, `s`.`names` AS `student_name`, `c`.`class_name` AS `class_name`, `sub`.`subject_name` AS `subject_name`, `e`.`exam_name` AS `exam_name`, `e`.`type` AS `exam_type`, `er`.`marks` AS `marks`, `er`.`total_marks` AS `total_marks`, `er`.`grade` AS `grade`, `t`.`term_name` AS `term_name`, `t`.`academic_year` AS `academic_year` FROM (((((`exam_results` `er` join `students` `s` on(`er`.`student_number` = `s`.`student_number`)) join `classes` `c` on(`s`.`class_id` = `c`.`class_id`)) join `exams` `e` on(`er`.`exam_id` = `e`.`exam_id`)) join `terms` `t` on(`e`.`term_id` = `t`.`term_id`)) join `subjects` `sub` on(`er`.`subject_id` = `sub`.`subject_id`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`attendance_id`),
  ADD KEY `student_number` (`student_number`),
  ADD KEY `recorded_by` (`recorded_by`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`isbn`),
  ADD KEY `subject_id` (`subject_id`);

--
-- Indexes for table `book_loans`
--
ALTER TABLE `book_loans`
  ADD PRIMARY KEY (`loan_id`),
  ADD KEY `student_number` (`student_number`),
  ADD KEY `isbn` (`isbn`);

--
-- Indexes for table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`class_id`);

--
-- Indexes for table `class_teacher`
--
ALTER TABLE `class_teacher`
  ADD PRIMARY KEY (`class_teacher_id`),
  ADD KEY `class_id` (`class_id`),
  ADD KEY `staff_number` (`staff_number`),
  ADD KEY `term_id` (`term_id`);

--
-- Indexes for table `exams`
--
ALTER TABLE `exams`
  ADD PRIMARY KEY (`exam_id`),
  ADD KEY `term_id` (`term_id`);

--
-- Indexes for table `exam_results`
--
ALTER TABLE `exam_results`
  ADD PRIMARY KEY (`result_id`),
  ADD KEY `exam_id` (`exam_id`),
  ADD KEY `student_number` (`student_number`),
  ADD KEY `subject_id` (`subject_id`);

--
-- Indexes for table `fee_structure`
--
ALTER TABLE `fee_structure`
  ADD PRIMARY KEY (`fee_structure_id`),
  ADD KEY `class_id` (`class_id`),
  ADD KEY `fee_type_id` (`fee_type_id`),
  ADD KEY `term_id` (`term_id`);

--
-- Indexes for table `fee_types`
--
ALTER TABLE `fee_types`
  ADD PRIMARY KEY (`fee_type_id`);

--
-- Indexes for table `notices`
--
ALTER TABLE `notices`
  ADD PRIMARY KEY (`notice_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_code`),
  ADD KEY `student_number` (`student_number`);

--
-- Indexes for table `payment_receipts`
--
ALTER TABLE `payment_receipts`
  ADD PRIMARY KEY (`receipt_number`),
  ADD UNIQUE KEY `payment_code` (`payment_code`),
  ADD KEY `issued_by` (`issued_by`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`staff_number`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`student_number`),
  ADD KEY `class_id` (`class_id`);

--
-- Indexes for table `student_contacts`
--
ALTER TABLE `student_contacts`
  ADD PRIMARY KEY (`contact_id`),
  ADD KEY `student_number` (`student_number`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`subject_id`),
  ADD UNIQUE KEY `subject_code` (`subject_code`);

--
-- Indexes for table `subject_teacher`
--
ALTER TABLE `subject_teacher`
  ADD PRIMARY KEY (`subject_teacher_id`),
  ADD KEY `staff_number` (`staff_number`),
  ADD KEY `subject_id` (`subject_id`),
  ADD KEY `class_id` (`class_id`),
  ADD KEY `term_id` (`term_id`);

--
-- Indexes for table `terms`
--
ALTER TABLE `terms`
  ADD PRIMARY KEY (`term_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `attendance_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `book_loans`
--
ALTER TABLE `book_loans`
  MODIFY `loan_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `class_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `class_teacher`
--
ALTER TABLE `class_teacher`
  MODIFY `class_teacher_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exams`
--
ALTER TABLE `exams`
  MODIFY `exam_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exam_results`
--
ALTER TABLE `exam_results`
  MODIFY `result_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fee_structure`
--
ALTER TABLE `fee_structure`
  MODIFY `fee_structure_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fee_types`
--
ALTER TABLE `fee_types`
  MODIFY `fee_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `notices`
--
ALTER TABLE `notices`
  MODIFY `notice_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_contacts`
--
ALTER TABLE `student_contacts`
  MODIFY `contact_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `subject_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `subject_teacher`
--
ALTER TABLE `subject_teacher`
  MODIFY `subject_teacher_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `terms`
--
ALTER TABLE `terms`
  MODIFY `term_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`student_number`) REFERENCES `students` (`student_number`),
  ADD CONSTRAINT `attendance_ibfk_2` FOREIGN KEY (`recorded_by`) REFERENCES `staff` (`staff_number`);

--
-- Constraints for table `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `books_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`);

--
-- Constraints for table `book_loans`
--
ALTER TABLE `book_loans`
  ADD CONSTRAINT `book_loans_ibfk_1` FOREIGN KEY (`student_number`) REFERENCES `students` (`student_number`),
  ADD CONSTRAINT `book_loans_ibfk_2` FOREIGN KEY (`isbn`) REFERENCES `books` (`isbn`);

--
-- Constraints for table `class_teacher`
--
ALTER TABLE `class_teacher`
  ADD CONSTRAINT `class_teacher_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `classes` (`class_id`),
  ADD CONSTRAINT `class_teacher_ibfk_2` FOREIGN KEY (`staff_number`) REFERENCES `staff` (`staff_number`),
  ADD CONSTRAINT `class_teacher_ibfk_3` FOREIGN KEY (`term_id`) REFERENCES `terms` (`term_id`);

--
-- Constraints for table `exams`
--
ALTER TABLE `exams`
  ADD CONSTRAINT `exams_ibfk_1` FOREIGN KEY (`term_id`) REFERENCES `terms` (`term_id`);

--
-- Constraints for table `exam_results`
--
ALTER TABLE `exam_results`
  ADD CONSTRAINT `exam_results_ibfk_1` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`exam_id`),
  ADD CONSTRAINT `exam_results_ibfk_2` FOREIGN KEY (`student_number`) REFERENCES `students` (`student_number`),
  ADD CONSTRAINT `exam_results_ibfk_3` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`);

--
-- Constraints for table `fee_structure`
--
ALTER TABLE `fee_structure`
  ADD CONSTRAINT `fee_structure_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `classes` (`class_id`),
  ADD CONSTRAINT `fee_structure_ibfk_2` FOREIGN KEY (`fee_type_id`) REFERENCES `fee_types` (`fee_type_id`),
  ADD CONSTRAINT `fee_structure_ibfk_3` FOREIGN KEY (`term_id`) REFERENCES `terms` (`term_id`);

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`student_number`) REFERENCES `students` (`student_number`);

--
-- Constraints for table `payment_receipts`
--
ALTER TABLE `payment_receipts`
  ADD CONSTRAINT `payment_receipts_ibfk_1` FOREIGN KEY (`payment_code`) REFERENCES `payments` (`payment_code`),
  ADD CONSTRAINT `payment_receipts_ibfk_2` FOREIGN KEY (`issued_by`) REFERENCES `staff` (`staff_number`);

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `classes` (`class_id`);

--
-- Constraints for table `student_contacts`
--
ALTER TABLE `student_contacts`
  ADD CONSTRAINT `student_contacts_ibfk_1` FOREIGN KEY (`student_number`) REFERENCES `students` (`student_number`) ON DELETE CASCADE;

--
-- Constraints for table `subject_teacher`
--
ALTER TABLE `subject_teacher`
  ADD CONSTRAINT `subject_teacher_ibfk_1` FOREIGN KEY (`staff_number`) REFERENCES `staff` (`staff_number`),
  ADD CONSTRAINT `subject_teacher_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`),
  ADD CONSTRAINT `subject_teacher_ibfk_3` FOREIGN KEY (`class_id`) REFERENCES `classes` (`class_id`),
  ADD CONSTRAINT `subject_teacher_ibfk_4` FOREIGN KEY (`term_id`) REFERENCES `terms` (`term_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

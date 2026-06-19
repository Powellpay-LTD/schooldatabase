-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 19, 2026 at 12:04 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `assignment_week1`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `attendance_id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `attendance_date` date NOT NULL,
  `status` enum('Present','Absent','Late','Excused') NOT NULL,
  `recorded_by_staff_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `book_id` int(11) NOT NULL,
  `isbn` varchar(20) DEFAULT NULL,
  `title` varchar(200) NOT NULL,
  `author` varchar(150) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `copies_available` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `book_loans`
--

CREATE TABLE `book_loans` (
  `loan_id` int(11) NOT NULL,
  `book_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
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
  `capacity` int(11) DEFAULT 40
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `class_teacher`
--

CREATE TABLE `class_teacher` (
  `assignment_id` int(11) NOT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `term_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exams`
--

CREATE TABLE `exams` (
  `exam_id` int(11) NOT NULL,
  `exam_name` varchar(100) NOT NULL,
  `exam_type` enum('End of Term','Continuous Assessment','Mock','UNEB') NOT NULL,
  `term_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exam_results`
--

CREATE TABLE `exam_results` (
  `result_id` int(11) NOT NULL,
  `exam_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `marks` int(11) NOT NULL,
  `total_marks` int(11) DEFAULT 100,
  `grade` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fee_structure`
--

CREATE TABLE `fee_structure` (
  `structure_id` int(11) NOT NULL,
  `class_id` int(11) DEFAULT NULL,
  `fee_type_id` int(11) DEFAULT NULL,
  `amount_payable` decimal(12,2) NOT NULL,
  `term_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fee_types`
--

CREATE TABLE `fee_types` (
  `fee_type_id` int(11) NOT NULL,
  `fee_type_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notices`
--

CREATE TABLE `notices` (
  `notice_id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `content` text NOT NULL,
  `audience` enum('Students','Parents','Staff','All') DEFAULT 'All',
  `posted_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `expiry_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `payment_code` varchar(50) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `amount_paid` decimal(12,2) NOT NULL,
  `payment_date` date NOT NULL,
  `method` enum('Cash','Mobile Money','Bank','Cheque') NOT NULL,
  `reference_number` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_receipts`
--

CREATE TABLE `payment_receipts` (
  `receipt_id` int(11) NOT NULL,
  `receipt_number` varchar(50) NOT NULL,
  `payment_id` int(11) DEFAULT NULL,
  `issued_by_staff_id` int(11) DEFAULT NULL,
  `issue_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `staff_id` int(11) NOT NULL,
  `staff_number` varchar(20) NOT NULL,
  `names` varchar(150) NOT NULL,
  `role` enum('Teacher','Bursar','Admin','Head Teacher') NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `hire_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `student_id` int(11) NOT NULL,
  `student_number` varchar(20) NOT NULL,
  `names` varchar(150) NOT NULL,
  `gender` enum('Male','Female') NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `enrollment_date` date DEFAULT NULL,
  `status` enum('Active','Suspended','Alumni','Dropped') DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_contacts`
--

CREATE TABLE `student_contacts` (
  `contact_id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `guardian_names` varchar(150) NOT NULL,
  `phone_numbers` varchar(100) NOT NULL,
  `relationship` varchar(50) DEFAULT NULL,
  `emergency_contact` tinyint(1) DEFAULT 0
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

-- --------------------------------------------------------

--
-- Table structure for table `subject_teacher`
--

CREATE TABLE `subject_teacher` (
  `assignment_id` int(11) NOT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `terms`
--

CREATE TABLE `terms` (
  `term_id` int(11) NOT NULL,
  `term_name` varchar(50) NOT NULL,
  `academic_year` varchar(10) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `active_status` enum('Active','Inactive') DEFAULT 'Inactive'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`attendance_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `recorded_by_staff_id` (`recorded_by_staff_id`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`book_id`),
  ADD UNIQUE KEY `isbn` (`isbn`),
  ADD KEY `subject_id` (`subject_id`);

--
-- Indexes for table `book_loans`
--
ALTER TABLE `book_loans`
  ADD PRIMARY KEY (`loan_id`),
  ADD KEY `book_id` (`book_id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`class_id`);

--
-- Indexes for table `class_teacher`
--
ALTER TABLE `class_teacher`
  ADD PRIMARY KEY (`assignment_id`),
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `class_id` (`class_id`),
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
  ADD KEY `student_id` (`student_id`),
  ADD KEY `subject_id` (`subject_id`);

--
-- Indexes for table `fee_structure`
--
ALTER TABLE `fee_structure`
  ADD PRIMARY KEY (`structure_id`),
  ADD KEY `class_id` (`class_id`),
  ADD KEY `fee_type_id` (`fee_type_id`),
  ADD KEY `term_id` (`term_id`);

--
-- Indexes for table `fee_types`
--
ALTER TABLE `fee_types`
  ADD PRIMARY KEY (`fee_type_id`),
  ADD UNIQUE KEY `fee_type_name` (`fee_type_name`);

--
-- Indexes for table `notices`
--
ALTER TABLE `notices`
  ADD PRIMARY KEY (`notice_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD UNIQUE KEY `payment_code` (`payment_code`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `payment_receipts`
--
ALTER TABLE `payment_receipts`
  ADD PRIMARY KEY (`receipt_id`),
  ADD UNIQUE KEY `receipt_number` (`receipt_number`),
  ADD KEY `payment_id` (`payment_id`),
  ADD KEY `issued_by_staff_id` (`issued_by_staff_id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`staff_id`),
  ADD UNIQUE KEY `staff_number` (`staff_number`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`student_id`),
  ADD UNIQUE KEY `student_number` (`student_number`),
  ADD KEY `class_id` (`class_id`);

--
-- Indexes for table `student_contacts`
--
ALTER TABLE `student_contacts`
  ADD PRIMARY KEY (`contact_id`),
  ADD KEY `student_id` (`student_id`);

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
  ADD PRIMARY KEY (`assignment_id`),
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `subject_id` (`subject_id`),
  ADD KEY `class_id` (`class_id`);

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
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `book_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `book_loans`
--
ALTER TABLE `book_loans`
  MODIFY `loan_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `class_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `class_teacher`
--
ALTER TABLE `class_teacher`
  MODIFY `assignment_id` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `structure_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fee_types`
--
ALTER TABLE `fee_types`
  MODIFY `fee_type_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notices`
--
ALTER TABLE `notices`
  MODIFY `notice_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_receipts`
--
ALTER TABLE `payment_receipts`
  MODIFY `receipt_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `staff_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_contacts`
--
ALTER TABLE `student_contacts`
  MODIFY `contact_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `subject_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subject_teacher`
--
ALTER TABLE `subject_teacher`
  MODIFY `assignment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `terms`
--
ALTER TABLE `terms`
  MODIFY `term_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `attendance_ibfk_2` FOREIGN KEY (`recorded_by_staff_id`) REFERENCES `staff` (`staff_id`) ON DELETE SET NULL;

--
-- Constraints for table `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `books_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`) ON DELETE SET NULL;

--
-- Constraints for table `book_loans`
--
ALTER TABLE `book_loans`
  ADD CONSTRAINT `book_loans_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `book_loans_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE CASCADE;

--
-- Constraints for table `class_teacher`
--
ALTER TABLE `class_teacher`
  ADD CONSTRAINT `class_teacher_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `class_teacher_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `classes` (`class_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `class_teacher_ibfk_3` FOREIGN KEY (`term_id`) REFERENCES `terms` (`term_id`) ON DELETE CASCADE;

--
-- Constraints for table `exams`
--
ALTER TABLE `exams`
  ADD CONSTRAINT `exams_ibfk_1` FOREIGN KEY (`term_id`) REFERENCES `terms` (`term_id`) ON DELETE CASCADE;

--
-- Constraints for table `exam_results`
--
ALTER TABLE `exam_results`
  ADD CONSTRAINT `exam_results_ibfk_1` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`exam_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `exam_results_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `exam_results_ibfk_3` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`) ON DELETE CASCADE;

--
-- Constraints for table `fee_structure`
--
ALTER TABLE `fee_structure`
  ADD CONSTRAINT `fee_structure_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `classes` (`class_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fee_structure_ibfk_2` FOREIGN KEY (`fee_type_id`) REFERENCES `fee_types` (`fee_type_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fee_structure_ibfk_3` FOREIGN KEY (`term_id`) REFERENCES `terms` (`term_id`) ON DELETE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE CASCADE;

--
-- Constraints for table `payment_receipts`
--
ALTER TABLE `payment_receipts`
  ADD CONSTRAINT `payment_receipts_ibfk_1` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`payment_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payment_receipts_ibfk_2` FOREIGN KEY (`issued_by_staff_id`) REFERENCES `staff` (`staff_id`) ON DELETE SET NULL;

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `classes` (`class_id`) ON DELETE SET NULL;

--
-- Constraints for table `student_contacts`
--
ALTER TABLE `student_contacts`
  ADD CONSTRAINT `student_contacts_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE CASCADE;

--
-- Constraints for table `subject_teacher`
--
ALTER TABLE `subject_teacher`
  ADD CONSTRAINT `subject_teacher_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `subject_teacher_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `subject_teacher_ibfk_3` FOREIGN KEY (`class_id`) REFERENCES `classes` (`class_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

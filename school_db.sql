-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 19, 2026 at 06:28 AM
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
-- Database: `school_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `studentdata_agrolink_data_final`
--

DROP TABLE IF EXISTS `studentdata_agrolink_data_final`;
CREATE TABLE IF NOT EXISTS `studentdata_agrolink_data_final` (
  `id` int DEFAULT NULL,
  `student_name` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `student_age` int DEFAULT NULL,
  `student_gender` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nationality` varchar(7) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `religion` int DEFAULT NULL,
  `student_order` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `student_class` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `student_stream` int DEFAULT NULL,
  `entry_year` int DEFAULT NULL,
  `student_adm_number` int DEFAULT NULL,
  `student_code` int DEFAULT NULL,
  `color` int DEFAULT NULL,
  `father_name` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `father_occupation` int DEFAULT NULL,
  `father_contact` int DEFAULT NULL,
  `father_alt_contact` int DEFAULT NULL,
  `mother_name` int DEFAULT NULL,
  `mother_occupation` int DEFAULT NULL,
  `mother_contact` int DEFAULT NULL,
  `mother_alt_contact` int DEFAULT NULL,
  `guardian_name` int DEFAULT NULL,
  `guardian_occupation` int DEFAULT NULL,
  `guardian_contact` int DEFAULT NULL,
  `guardian_alt_contact` int DEFAULT NULL,
  `residential_area` int DEFAULT NULL,
  `zone` int DEFAULT NULL,
  `road` int DEFAULT NULL,
  `health_problem` int DEFAULT NULL,
  `emergency_person` int DEFAULT NULL,
  `other_information` int DEFAULT NULL,
  `date_of_birth` int DEFAULT NULL,
  `image` int DEFAULT NULL,
  `registration_date` int DEFAULT NULL,
  `created_by` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `studentdata_agrolink_data_final`
--

INSERT INTO `studentdata_agrolink_data_final` (`id`, `student_name`, `student_age`, `student_gender`, `nationality`, `religion`, `student_order`, `student_class`, `student_stream`, `entry_year`, `student_adm_number`, `student_code`, `color`, `father_name`, `father_occupation`, `father_contact`, `father_alt_contact`, `mother_name`, `mother_occupation`, `mother_contact`, `mother_alt_contact`, `guardian_name`, `guardian_occupation`, `guardian_contact`, `guardian_alt_contact`, `residential_area`, `zone`, `road`, `health_problem`, `emergency_person`, `other_information`, `date_of_birth`, `image`, `registration_date`, `created_by`) VALUES
(0, 'Demo Student', 16, 'female', 'Ugandan', 0, 'boarding', 'S4', 0, 2017, 0, 1004237000, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'BBOSA HAMUZA', 16, 'male', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237001, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'KABUGO RATIFAH', 16, 'female', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237002, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'BBOSA UMAR', 16, 'male', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237003, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'SAKA DAGLUS', 16, 'male', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237004, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'NASANGA MEBRA', 16, 'female', 'Ugandan', 0, 'boarding', 'S4', 0, 2017, 0, 1004237005, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'NAMBAZIIRA VANESSA', 17, 'female', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237006, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'WAMALA ANDREW', 17, 'male', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237007, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'NAKALEMA SHARON', 17, 'female', 'Ugandan', 0, 'boarding', 'S4', 0, 2017, 0, 1004237008, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'UWERA DIVINE MARY', 17, 'female', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237009, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'BABIRYE JAMIRA NATAL', 17, 'female', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237010, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'NAKAYI BEATRICE SHEILAH', 17, 'female', 'Ugandan', 0, 'boarding', 'S4', 0, 2017, 0, 1004237011, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'NAMIREMBE HAAWAH', 17, 'female', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237012, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'SSEMANDA HAKISAM', 17, 'male', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237013, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'NANTEZA NULIAT', 17, 'female', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237014, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'CEDRIC IBRAHIM', 17, 'male', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237015, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'KASOZI JOSHUA', 17, 'male', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237016, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'SSEMANDA FRED', 17, 'male', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237017, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'MBABAZI VANESSA NABUKENYA', 17, 'female', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237018, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'BIRUNGI HUSSEIN', 17, 'male', 'Ugandan', 0, 'boarding', 'S4', 0, 2017, 0, 1004237019, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'SSENKUNGU ADRIAN', 17, 'male', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237020, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'KAKOOZA FRED', 17, 'male', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237021, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'NAKAYEMBA AISHA', 17, 'female', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237022, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'NAKALUNGI SELIN', 17, 'female', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237023, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'NABAKKA SHEILLA', 17, 'female', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237024, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'NALULE HELLEN', 17, 'female', 'Ugandan', 0, 'day', 'C', 0, 2017, 0, 1004237025, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'IMALINGAT EMMANUEL', 17, 'male', 'Ugandan', 0, 'boarding', 'S4', 0, 2017, 0, 1004237026, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'KASUMBA BENON', 17, 'male', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237027, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'OMODING SAVIOUR', 18, 'male', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237028, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'MUSUMBA TIMOTHY', 18, 'male', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237029, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'YC', 18, 'male', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237030, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'LAKER ROSE', 18, 'female', 'Ugandan', 0, 'boarding', 'S4', 0, 2017, 0, 1004237031, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'ASARA KETTY', 18, 'female', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237032, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'MUYANJA ASHIRAF', 18, 'male', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237033, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'KYOBE ISAAC', 18, 'male', 'Ugandan', 0, 'boarding', 'S4', 0, 2017, 0, 1004237034, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'MATENDE DENNIS', 18, 'male', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237035, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'LUBEGA ELVIS', 18, 'male', 'Ugandan', 0, 'boarding', 'S4', 0, 2017, 0, 1004237036, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'NAKISUYI EVA', 18, 'female', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237037, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'MBONIGABA EMMANUEL', 18, 'male', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237038, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'MUTARAHAZA JONATHAN', 18, 'male', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237039, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'MBAZIIRA ABDUL HAKIM', 18, 'male', 'Ugandan', 0, 'boarding', 'S4', 0, 2017, 0, 1004237040, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'OKONKWA ABIGAIL', 18, 'female', 'Ugandan', 0, 'boarding', 'S4', 0, 2017, 0, 1004237041, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'KALULE NANFUKA SHADIA', 18, 'female', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237042, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'NAMUKWAYA DEZIRANTA', 18, 'female', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237043, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'KALUNGI IVAN', 18, 'male', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237044, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'KATULA EDRIISE', 18, 'male', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237045, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'AKIBO JANE', 15, 'female', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237046, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'LUBWAMA IMRAN', 15, 'male', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237047, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'NANYONGA TRACY', 15, 'female', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237048, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'NAKYANZI JACKIE', 15, 'female', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237049, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'KISAKYE AISHA', 15, 'female', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237050, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'NANYONGA AISHA', 15, 'female', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237051, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'NAKAKANDE DIANA', 15, 'female', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237052, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'NAMPIJJA PHIONA', 15, 'female', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237053, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'AMUTUHIRE EVELYN', 15, 'female', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237054, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'MULEMA CHRISPINE', 15, 'male', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237055, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'ANYANGO RUTH REJOICE', 15, 'female', 'Ugandan', 0, 'boarding', 'S4', 0, 2017, 0, 1004237056, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'AKAO KEZIAH', 15, 'female', 'Ugandan', 0, 'boarding', 'S4', 0, 2017, 0, 1004237057, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'NAKAYIMA GRACE', 15, 'female', 'Ugandan', 0, 'boarding', 'S4', 0, 2017, 0, 1004237058, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'NALUYIMA JUSTINE', 15, 'female', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237059, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'LWANGA DANIEL', 15, 'male', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237060, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'OMIKU GEOFREY', 15, 'male', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237061, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'SSEGIRINYA COLLINS', 15, 'male', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237062, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'SIGONKE JONATHAN', 15, 'male', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237063, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'MUKASA FRED', 15, 'male', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237064, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'SSENYONJO KEVIN', 15, 'male', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237065, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'MUTAAWE MULISHID', 15, 'male', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237066, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'MUKWAYA AKRAM AKIM', 15, 'male', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237067, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'MUWONGE ABDUSHAKURU', 16, 'male', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237068, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'NYANZI MUHAMMAD', 16, 'male', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237069, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'KIRABO BARBRAH', 16, 'female', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237070, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'NAYIGWE ASIA', 16, 'female', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237071, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'NAKIYINGI OLIVER', 16, 'female', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237072, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'NAMBUUSI VANESSA', 16, 'female', 'Ugandan', 0, 'boarding', 'S4', 0, 2017, 0, 1004237073, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'MWETAMINWA FARAJA', 16, 'male', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237074, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'MUTOKAMBALI CHIZA', 16, 'male', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237075, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'KABUYE JOSEPH', 16, 'male', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237076, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'TURYAKIRA ALLAN', 16, 'male', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237077, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'KAKANDE DANIEL', 16, 'male', 'Ugandan', 0, 'boarding', 'S4', 0, 2017, 0, 1004237078, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'NANYOMBI HAWAH', 16, 'female', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237079, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'BABIRYE YVONNE', 16, 'female', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237080, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'NABATEREGGA DEZIRANTA', 16, 'female', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237081, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'BAMWEYANA CHRIZESTOM', 16, 'male', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237082, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'SSENFUKA TONNY', 16, 'male', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237083, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'MUKISA MONICA', 16, 'female', 'Ugandan', 0, 'boarding', 'S4', 0, 2017, 0, 1004237084, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'MATOVU DALTON', 16, 'male', 'Ugandan', 0, 'boarding', 'S4', 0, 2017, 0, 1004237085, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'KALIISA SADAM', 16, 'male', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237086, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'KIZITO RASHID ', 16, 'male', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237087, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'NANGENDO JACKLINE', 16, 'female', 'Ugandan', 0, 'boarding', 'S4', 0, 2017, 0, 1004237088, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'MUGAMBWA GEOFREY', 16, 'male', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237089, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'TENDO PATIENCE', 16, 'female', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237090, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'AKELLO NAUME', 16, 'female', 'Ugandan', 0, 'boarding', 'S4', 0, 2017, 0, 1004237091, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'NANKYA NUBUWATI', 16, 'female', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237092, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'MULINDWA ASHIRAF', 16, 'male', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237093, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'NABUKEERA LATICIA', 16, 'female', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237094, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'KIRUMIRA ISAAC', 16, 'male', 'Ugandan', 0, 'boarding', 'S4', 0, 2017, 0, 1004237095, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'MAYANJA SOWED', 16, 'male', 'Ugandan', 0, 'boarding', 'S4', 0, 2017, 0, 1004237096, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'MUSOKE FAHAD', 16, 'male', 'Ugandan', 0, 'boarding', 'S4', 0, 2017, 0, 1004237097, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'NAKIGUDDE CAROL', 16, 'female', 'Ugandan', 0, 'boarding', 'S4', 0, 2017, 0, 1004237098, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'NAKASITA JOAN', 16, 'female', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237099, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'NAMAYAJA LETICIA', 16, 'female', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237100, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'NAKAZIBWE MADINAH', 16, 'female', 'Ugandan', 0, 'boarding', 'S4', 0, 2017, 0, 1004237101, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'WABYONA PIUS', 16, 'male', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237102, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'KAWEESA MATHIUS', 16, 'male', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237103, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'KISEKKA EMMANUEL', 16, 'male', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237104, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'MBABALI JUNIOR', 16, 'male', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237105, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'MAKEKE ABUBAKER', 16, 'male', 'Ugandan', 0, 'boarding', 'S4', 0, 2017, 0, 1004237106, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'NAAVA JESCA', 16, 'female', 'Ugandan', 0, 'boarding', 'S4', 0, 2017, 0, 1004237107, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'KOBUSINGYE CONSOLATA', 16, 'female', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237108, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'NAKAKANDE EVELYN', 16, 'female', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237109, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'SSEBULIME BRIAN', 16, 'male', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237110, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'SSEGAWA JULIUS', 16, 'female', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237111, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'JUMA PETER SAMUEL', 16, 'male', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237112, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'LUBUULWA ANWAL', 16, 'male', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237113, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'LUBEGA ISMA', 16, 'male', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237114, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'TOMUSANGE BENEDICT', 16, 'male', 'Ugandan', 0, 'boarding', 'S4', 0, 2017, 0, 1004237115, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'AMON NEGA WILLIAM', 16, 'male', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237116, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'MATOVU EDGER', 16, 'male', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237117, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'NSUBUGA JONATHAN', 16, 'male', 'Ugandan', 0, 'boarding', 'S4', 0, 2017, 0, 1004237118, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'SSAJJABI TRAVOUR', 16, 'male', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237119, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'NALUBEGA RASHIDAH', 16, 'female', 'Ugandan', 0, 'boarding', 'S4', 0, 2017, 0, 1004237120, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'LUKOO CHANCE', 16, 'female', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237121, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'LUWANDAGGA YASIN', 16, 'male', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237122, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'DDUMBA SHAKIYU', 16, 'male', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237123, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'NSUBUGA ERICK', 16, 'male', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237124, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'SAAVA EDRINE', 16, 'male', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237125, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'NSEREKO AMINAH', 16, 'female', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237126, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'MUKAS PATRICK', 16, 'male', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237127, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'NOKRACH DENIS MUSTAF', 16, 'male', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237128, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'NANYANZI VICTORIA', 16, 'female', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237129, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'KICONCO CHRISTINE', 16, 'female', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237130, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'NABAWEESI SHIBAH', 16, 'female', 'Ugandan', 0, 'boarding', 'S4', 0, 2017, 0, 1004237131, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'NAKABUGO AZIIZA', 16, 'female', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237132, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'NAKIBUYE KAUTHARAH', 16, 'female', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237133, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'NANSASI HANIFAH', 16, 'female', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237134, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'KARONDO BENEDY', 16, 'male', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237135, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'NANYONJO JALIA', 16, 'female', 'Ugandan', 0, 'boarding', 'S4', 0, 2017, 0, 1004237136, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'NANDAWULA GORRET', 16, 'female', 'Ugandan', 0, 'boarding', 'S4', 0, 2017, 0, 1004237137, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'NAMUTEBI JANAT', 16, 'female', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237138, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'MALONGO SUZAN', 16, 'female', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237139, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'NAKAMYA MARGRET', 16, 'female', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237140, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'KYAMPAIKE SYLIVIA', 16, 'female', 'Ugandan', 0, 'boarding', 'S4', 0, 2017, 0, 1004237141, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'ASHABA MARY', 16, 'female', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237142, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'LUKOO NDOOLE CHANCE', 16, 'female', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237143, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'KIBIRIGE JAMES', 16, 'male', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237144, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'SAMULA KELVIN', 16, 'male', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237145, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'SSEMANDA JAMES MARK', 16, 'male', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237146, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'SSEMWOGERERE FAISWAL', 16, 'male', 'Ugandan', 0, 'boarding', 'S4', 0, 2017, 0, 1004237147, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'AINOMUGISHA CHRICENT', 16, 'female', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237148, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'UMAR SAID', 16, 'male', 'Ugandan', 0, 'boarding', 'S4', 0, 2017, 0, 1004237149, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'KABIITO SUDAIS', 16, 'male', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237150, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'NAMUBIRU BRIDGET ', 16, 'female', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237151, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'KATABIRA DESIRE', 16, 'male', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237152, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'NAKIMERA ALICE', 16, 'female', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237153, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'OPIO EMMANUEL', 16, 'male', 'Ugandan', 0, 'boarding', 'S4', 0, 2017, 0, 1004237154, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'NAKAJJUBI WINNIE', 16, 'female', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237155, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'MAKOHA NESBONE', 16, 'male', 'Ugandan', 0, 'boarding', 'S4', 0, 2017, 0, 1004237156, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'BATTE ALI', 16, 'male', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237157, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'NZAYIREBA RODGERS', 16, 'male', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237158, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'KASIKYE ISMAEL', 16, 'male', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237159, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'NABATANZI GRACE', 16, 'female', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237160, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'BUKENYA EDWARD ', 16, 'male', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237161, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'NAMUBIRU MARION', 16, 'female', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237162, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'MWETAMINWA NOELLA', 16, 'female', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237163, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'MWETAMINWA FARAJ', 16, 'male', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237164, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'NALUGEMWA SWABURAH', 16, 'female', 'Ugandan', 0, 'boarding', 'S4', 0, 2017, 0, 1004237165, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'OPOLOT MARTIN', 16, 'female', 'Ugandan', 0, 'day', 'S4', 0, 2017, 0, 1004237166, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'ADOLF CHIRHALABWA AKWATI', 18, 'male', 'Ugandan', 0, 'day', 'S6', 0, 2019, 0, 1004237167, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'AKAMPULIRA DARVIN', 18, 'male', 'Ugandan', 0, 'day', 'S6', 0, 2019, 0, 1004237168, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'ATUHAIRE INNOCENT', 18, 'male', 'Ugandan', 0, 'day', 'S6', 0, 2019, 0, 1004237169, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'BALABA ALOYSIOUS', 18, 'male', 'Ugandan', 0, 'day', 'S6', 0, 2019, 0, 1004237170, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'BULYABA SOPHIA', 18, 'female', 'Ugandan', 0, 'left', 'S6', 0, 2019, 0, 1004237171, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'EMMANUEL FORTUNE', 18, 'male', 'Ugandan', 0, 'day', 'S6', 0, 2019, 0, 1004237172, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'JUMBA PASCAL', 18, 'male', 'Ugandan', 0, 'day', 'S6', 0, 2019, 0, 1004237173, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'KABAJJO TONNY', 18, 'male', 'Ugandan', 0, 'day', 'S6', 0, 2019, 0, 1004237174, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'KATUMBA RONALD', 18, 'male', 'Ugandan', 0, 'day', 'S6', 0, 2019, 0, 1004237175, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'KAWALYA VICENT', 18, 'male', 'Ugandan', 0, 'day', 'S6', 0, 2019, 0, 1004237176, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'KEIZIRE FELIX', 18, 'male', 'Ugandan', 0, 'day', 'S6', 0, 2019, 0, 1004237177, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'KIWENDA SYRUS', 18, 'male', 'Ugandan', 0, 'day', 'S6', 0, 2019, 0, 1004237178, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'KYESWA NAJIB MAYANJA', 18, 'male', 'Ugandan', 0, 'day', 'S6', 0, 2019, 0, 1004237179, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'LUGONVU ANDREW', 18, 'male', 'Ugandan', 0, 'day', 'S6', 0, 2019, 0, 1004237180, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'MADANDA CHARLES', 18, 'male', 'Ugandan', 0, 'boarding', 'S6', 0, 2019, 0, 1004237181, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'MATOVU ABDUL WAHAB', 19, 'male', 'Ugandan', 0, 'day', 'S6', 0, 2019, 0, 1004237182, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'MATOVU AKISAMU', 19, 'male', 'Ugandan', 0, 'day', 'S6', 0, 2019, 0, 1004237183, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'MBABAZI SARAH', 19, 'female', 'Ugandan', 0, 'day', 'S6', 0, 2019, 0, 1004237184, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'MBAZUDDE PRITTTY', 19, 'female', 'Ugandan', 0, 'day', 'S6', 0, 2019, 0, 1004237185, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'MPALANYI KENNETH', 19, 'male', 'Ugandan', 0, 'day', 'S6', 0, 2019, 0, 1004237186, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'MUKALAZI ANDREW', 19, 'male', 'Ugandan', 0, 'day', 'S6', 0, 2019, 0, 1004237187, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'MULINDA FRANK', 19, 'male', 'Ugandan', 0, 'day', 'S6', 0, 2019, 0, 1004237188, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'MUTEBI ASLAM', 19, 'male', 'Ugandan', 0, 'day', 'S6', 0, 2019, 0, 1004237189, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'MWANJE ABDUL KARIM ', 19, 'male', 'Ugandan', 0, 'day', 'S6', 0, 2019, 0, 1004237190, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'NABISUBI HAJARA', 19, 'female', 'Ugandan', 0, 'boarding', 'S6', 0, 2019, 0, 1004237191, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'NAJJINGO CISSY', 19, 'female', 'Ugandan', 0, 'day', 'S6', 0, 2019, 0, 1004237192, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'NAJJUKO NULALU NAKANDI', 19, 'female', 'Ugandan', 0, 'day', 'S6', 0, 2019, 0, 1004237193, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'NAJJUMA MADINAH', 19, 'female', 'Ugandan', 0, 'day', 'S6', 0, 2019, 0, 1004237194, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'NAKAFUNGA MASTULAH', 19, 'male', 'Ugandan', 0, 'boarding', 'S6', 0, 2019, 0, 1004237195, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'NAKYEYUNE MOUREEN', 19, 'male', 'Ugandan', 0, 'day', 'S6', 0, 2019, 0, 1004237196, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'NALUBEGA VANESSA', 19, 'male', 'Ugandan', 0, 'left', 'S6', 0, 2019, 0, 1004237197, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'NAMANDA BRENDA MARY', 19, 'male', 'Ugandan', 0, 'day', 'S6', 0, 2019, 0, 1004237198, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'NAMPIIJA BASHIRAH', 19, 'female', 'Ugandan', 0, 'boarding', 'S6', 0, 2019, 0, 1004237199, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'NAMUMBYA MERCY', 19, 'male', 'Ugandan', 0, 'day', 'S6', 0, 2019, 0, 1004237200, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'NAMWEBYA BETTY', 20, 'male', 'Ugandan', 0, 'day', 'S6', 0, 2019, 0, 1004237201, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'NANYONJO SHADIA', 20, 'male', 'Ugandan', 0, 'boarding', 'S6', 0, 2019, 0, 1004237202, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'NATASHA PHIBE', 20, 'male', 'Ugandan', 0, 'left', 'S6', 0, 2019, 0, 1004237203, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'NAYIGA SUSAN', 20, 'male', 'Ugandan', 0, 'boarding', 'S6', 0, 2019, 0, 1004237204, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'NTEGEDDE FATIA', 20, 'male', 'Ugandan', 0, 'day', 'S6', 0, 2019, 0, 1004237205, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'KOMAKETCH ABEMOCECA', 20, 'male', 'Ugandan', 0, 'day', 'S6', 0, 2019, 0, 1004237206, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'SSEMAGANDA MOURICE', 20, 'male', 'Ugandan', 0, 'day', 'S6', 0, 2019, 0, 1004237207, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'MWANJE RYAN', 20, 'male', 'Ugandan', 0, 'day', 'S6', 0, 2019, 0, 1004237208, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'BAYIGA MARION', 20, 'male', 'Ugandan', 0, 'day', 'S6', 0, 2019, 0, 1004237209, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004'),
(0, 'OKELLO ALFRED', 20, 'male', 'Ugandan', 0, 'boarding', 'S6', 0, 2019, 0, 1004237210, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1004');

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_boarding_students`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `view_boarding_students`;
CREATE TABLE IF NOT EXISTS `view_boarding_students` (
`student_code` int
,`student_name` varchar(25)
,`student_class` varchar(2)
,`student_gender` varchar(6)
,`student_age` int
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_clean_student_roster`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `view_clean_student_roster`;
CREATE TABLE IF NOT EXISTS `view_clean_student_roster` (
`student_code` int
,`student_name` varchar(25)
,`student_gender` varchar(6)
,`student_age` int
,`nationality` varchar(7)
,`student_class` varchar(2)
,`residency_type` varchar(8)
,`entry_year` int
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_day_students`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `view_day_students`;
CREATE TABLE IF NOT EXISTS `view_day_students` (
`student_code` int
,`student_name` varchar(25)
,`student_class` varchar(2)
,`student_gender` varchar(6)
,`student_age` int
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_student_demographics`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `view_student_demographics`;
CREATE TABLE IF NOT EXISTS `view_student_demographics` (
`student_class` varchar(2)
,`student_gender` varchar(6)
,`total_students` bigint
,`average_age` decimal(14,4)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_students`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `vw_students`;
CREATE TABLE IF NOT EXISTS `vw_students` (
`id` int
,`student_name` varchar(25)
,`student_age` int
,`student_gender` varchar(6)
,`nationality` varchar(7)
,`religion` int
,`student_order` varchar(8)
,`student_class` varchar(2)
,`student_stream` int
,`entry_year` int
,`student_adm_number` int
,`student_code` int
,`color` int
,`father_name` varchar(1)
,`father_occupation` int
,`father_contact` int
,`father_alt_contact` int
,`mother_name` int
,`mother_occupation` int
,`mother_contact` int
,`mother_alt_contact` int
,`guardian_name` int
,`guardian_occupation` int
,`guardian_contact` int
,`guardian_alt_contact` int
,`residential_area` int
,`zone` int
,`road` int
,`health_problem` int
,`emergency_person` int
,`other_information` int
,`date_of_birth` int
,`image` int
,`registration_date` int
,`created_by` varchar(4)
);

-- --------------------------------------------------------

--
-- Structure for view `view_boarding_students`
--
DROP TABLE IF EXISTS `view_boarding_students`;

DROP VIEW IF EXISTS `view_boarding_students`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_boarding_students`  AS SELECT `studentdata_agrolink_data_final`.`student_code` AS `student_code`, `studentdata_agrolink_data_final`.`student_name` AS `student_name`, `studentdata_agrolink_data_final`.`student_class` AS `student_class`, `studentdata_agrolink_data_final`.`student_gender` AS `student_gender`, `studentdata_agrolink_data_final`.`student_age` AS `student_age` FROM `studentdata_agrolink_data_final` WHERE (`studentdata_agrolink_data_final`.`student_order` = 'boarding') ;

-- --------------------------------------------------------

--
-- Structure for view `view_clean_student_roster`
--
DROP TABLE IF EXISTS `view_clean_student_roster`;

DROP VIEW IF EXISTS `view_clean_student_roster`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_clean_student_roster`  AS SELECT `studentdata_agrolink_data_final`.`student_code` AS `student_code`, `studentdata_agrolink_data_final`.`student_name` AS `student_name`, `studentdata_agrolink_data_final`.`student_gender` AS `student_gender`, `studentdata_agrolink_data_final`.`student_age` AS `student_age`, `studentdata_agrolink_data_final`.`nationality` AS `nationality`, `studentdata_agrolink_data_final`.`student_class` AS `student_class`, `studentdata_agrolink_data_final`.`student_order` AS `residency_type`, `studentdata_agrolink_data_final`.`entry_year` AS `entry_year` FROM `studentdata_agrolink_data_final` ;

-- --------------------------------------------------------

--
-- Structure for view `view_day_students`
--
DROP TABLE IF EXISTS `view_day_students`;

DROP VIEW IF EXISTS `view_day_students`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_day_students`  AS SELECT `studentdata_agrolink_data_final`.`student_code` AS `student_code`, `studentdata_agrolink_data_final`.`student_name` AS `student_name`, `studentdata_agrolink_data_final`.`student_class` AS `student_class`, `studentdata_agrolink_data_final`.`student_gender` AS `student_gender`, `studentdata_agrolink_data_final`.`student_age` AS `student_age` FROM `studentdata_agrolink_data_final` WHERE (`studentdata_agrolink_data_final`.`student_order` = 'day') ;

-- --------------------------------------------------------

--
-- Structure for view `view_student_demographics`
--
DROP TABLE IF EXISTS `view_student_demographics`;

DROP VIEW IF EXISTS `view_student_demographics`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_student_demographics`  AS SELECT `studentdata_agrolink_data_final`.`student_class` AS `student_class`, `studentdata_agrolink_data_final`.`student_gender` AS `student_gender`, count(0) AS `total_students`, avg(`studentdata_agrolink_data_final`.`student_age`) AS `average_age` FROM `studentdata_agrolink_data_final` GROUP BY `studentdata_agrolink_data_final`.`student_class`, `studentdata_agrolink_data_final`.`student_gender` ;

-- --------------------------------------------------------

--
-- Structure for view `vw_students`
--
DROP TABLE IF EXISTS `vw_students`;

DROP VIEW IF EXISTS `vw_students`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_students`  AS SELECT `studentdata_agrolink_data_final`.`id` AS `id`, `studentdata_agrolink_data_final`.`student_name` AS `student_name`, `studentdata_agrolink_data_final`.`student_age` AS `student_age`, `studentdata_agrolink_data_final`.`student_gender` AS `student_gender`, `studentdata_agrolink_data_final`.`nationality` AS `nationality`, `studentdata_agrolink_data_final`.`religion` AS `religion`, `studentdata_agrolink_data_final`.`student_order` AS `student_order`, `studentdata_agrolink_data_final`.`student_class` AS `student_class`, `studentdata_agrolink_data_final`.`student_stream` AS `student_stream`, `studentdata_agrolink_data_final`.`entry_year` AS `entry_year`, `studentdata_agrolink_data_final`.`student_adm_number` AS `student_adm_number`, `studentdata_agrolink_data_final`.`student_code` AS `student_code`, `studentdata_agrolink_data_final`.`color` AS `color`, `studentdata_agrolink_data_final`.`father_name` AS `father_name`, `studentdata_agrolink_data_final`.`father_occupation` AS `father_occupation`, `studentdata_agrolink_data_final`.`father_contact` AS `father_contact`, `studentdata_agrolink_data_final`.`father_alt_contact` AS `father_alt_contact`, `studentdata_agrolink_data_final`.`mother_name` AS `mother_name`, `studentdata_agrolink_data_final`.`mother_occupation` AS `mother_occupation`, `studentdata_agrolink_data_final`.`mother_contact` AS `mother_contact`, `studentdata_agrolink_data_final`.`mother_alt_contact` AS `mother_alt_contact`, `studentdata_agrolink_data_final`.`guardian_name` AS `guardian_name`, `studentdata_agrolink_data_final`.`guardian_occupation` AS `guardian_occupation`, `studentdata_agrolink_data_final`.`guardian_contact` AS `guardian_contact`, `studentdata_agrolink_data_final`.`guardian_alt_contact` AS `guardian_alt_contact`, `studentdata_agrolink_data_final`.`residential_area` AS `residential_area`, `studentdata_agrolink_data_final`.`zone` AS `zone`, `studentdata_agrolink_data_final`.`road` AS `road`, `studentdata_agrolink_data_final`.`health_problem` AS `health_problem`, `studentdata_agrolink_data_final`.`emergency_person` AS `emergency_person`, `studentdata_agrolink_data_final`.`other_information` AS `other_information`, `studentdata_agrolink_data_final`.`date_of_birth` AS `date_of_birth`, `studentdata_agrolink_data_final`.`image` AS `image`, `studentdata_agrolink_data_final`.`registration_date` AS `registration_date`, `studentdata_agrolink_data_final`.`created_by` AS `created_by` FROM `studentdata_agrolink_data_final` ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- AgroLink School Database
-- File: 01_database_setup.sql — DDL (database, tables, indexes)
-- Database: agro_link

CREATE DATABASE IF NOT EXISTS agro_link
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE agro_link;

DROP TABLE IF EXISTS students;

CREATE TABLE students (
  id                 INT UNSIGNED      NOT NULL AUTO_INCREMENT,
  student_name       VARCHAR(100)      NOT NULL,
  student_age        TINYINT UNSIGNED  DEFAULT NULL,
  student_gender     ENUM('male','female') NOT NULL,
  nationality        VARCHAR(50)       NOT NULL DEFAULT 'Ugandan',
  religion           VARCHAR(50)       DEFAULT NULL,
  student_order      ENUM('day','boarding','left') NOT NULL DEFAULT 'day',
  student_class      VARCHAR(10)       NOT NULL,
  student_stream     VARCHAR(30)       DEFAULT NULL,
  entry_year         YEAR              NOT NULL,
  student_adm_number BIGINT UNSIGNED   DEFAULT NULL,
  student_code       BIGINT UNSIGNED   NOT NULL,
  color              INT               DEFAULT 0,
  father_name        VARCHAR(100)      DEFAULT NULL,
  father_occupation  VARCHAR(100)      DEFAULT NULL,
  father_contact     BIGINT            DEFAULT 0,
  father_alt_contact BIGINT            DEFAULT 0,
  mother_name        VARCHAR(100)      DEFAULT NULL,
  mother_occupation  VARCHAR(100)      DEFAULT NULL,
  mother_contact     BIGINT            DEFAULT 0,
  mother_alt_contact BIGINT            DEFAULT 0,
  guardian_name      VARCHAR(100)      DEFAULT NULL,
  guardian_occupation VARCHAR(100)     DEFAULT NULL,
  guardian_contact   BIGINT            DEFAULT 0,
  guardian_alt_contact BIGINT          DEFAULT 0,
  residential_area   VARCHAR(100)      DEFAULT NULL,
  zone               VARCHAR(50)       DEFAULT NULL,
  road               VARCHAR(100)      DEFAULT NULL,
  health_problem     VARCHAR(200)      DEFAULT NULL,
  emergency_person   VARCHAR(100)      DEFAULT NULL,
  other_information  TEXT              DEFAULT NULL,
  date_of_birth      DATE              DEFAULT NULL,
  image              VARCHAR(255)      DEFAULT NULL,
  registration_date  DATE              DEFAULT NULL,
  created_by         INT UNSIGNED      DEFAULT 1004,
  PRIMARY KEY (id),
  UNIQUE KEY uq_student_code (student_code),
  KEY idx_student_class (student_class),
  KEY idx_entry_year (entry_year)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

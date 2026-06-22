<?php

declare(strict_types=1);

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

/**
 * SCHOOLPAY — SCHOOL MANAGEMENT SYSTEM DATABASE BLUEPRINT
 * 
 * ╔══════════════════════════════════════════════════════════════╗
 * ║  THIS FILE IS A BLUEPRINT FOR MODULAR MIGRATIONS            ║
 * ║  It bridges the raw SQL files → backend framework (Laravel) ║
 * ║  Break each table into its own migration file (modular).   ║
 * ║  Follow the naming convention:                              ║
 * ║    YYYY_MM_DD_HHMMSS_create_{table}_table.php               ║
 * ╚══════════════════════════════════════════════════════════════╝
 * 
 * Architecture: Modular monolith with CQRS-ready schema
 * Design Philosophy: Audit-first, reference-isolated, CBC-compliant
 * 
 * @version 1.0.0
 * @author Opiyo Oscar — 23/U/1330 (2300701330)
 * @track Web Development
 */

return new class extends Migration
{
    /**
     * Run all migrations — deploy complete school management infrastructure.
     */
    public function up(): void
    {
        // ========================================================================
        // MODULE 1: CORE ACADEMIC STRUCTURE
        // ========================================================================
        // Reference data that defines the school calendar, classes, and subjects.
        // These entities rarely change once set per term/academic year.

        // ─── 1.1 ACADEMIC YEARS ─────────────────────────────────────────────
        // Defines the school calendar years for tracking learner progression.
        // Each year has exactly 3 terms (Term 1–3) under the Ugandan system.
        Schema::dropIfExists('academic_years');
        Schema::create('academic_years', function (Blueprint $table) {
            $table->id();
            $table->year('year')->unique()->comment('e.g., 2025, 2026');
            $table->string('label', 50)->comment('e.g., Academic Year 2025');
            $table->date('start_date')->comment('First day of Term 1');
            $table->date('end_date')->comment('Last day of Term 3');
            $table->boolean('is_active')->default(false)->comment('Current active year');
            $table->timestamps();
        });

        // ─── 1.2 TERMS ──────────────────────────────────────────────────────
        // Term divisions within an academic year (Term 1, Term 2, Term 3).
        // Each term has a start/end date and active status for fee billing.
        Schema::dropIfExists('terms');
        Schema::create('terms', function (Blueprint $table) {
            $table->id();
            $table->foreignId('academic_year_id')->constrained()->cascadeOnDelete();
            $table->string('term_name', 20)->comment('e.g., Term 1, Term 2, Term 3');
            $table->date('start_date');
            $table->date('end_date');
            $table->boolean('is_active')->default(false)->comment('Currently active term for fee billing');
            
            $table->unique(['academic_year_id', 'term_name']);
            $table->index('is_active');
            $table->timestamps();
        });

        // ─── 1.3 CLASSES ────────────────────────────────────────────────────
        // Class levels with streams. Under CBC: S1–S4 with streams.
        // level: Primary, Secondary, A-Level.
        Schema::dropIfExists('classes');
        Schema::create('classes', function (Blueprint $table) {
            $table->id();
            $table->string('class_name', 50)->comment('e.g., Senior 1, Senior 2');
            $table->string('stream', 20)->nullable()->comment('e.g., East, West, A, B');
            $table->string('level', 20)->comment('Primary, Secondary, A-Level');
            $table->integer('capacity')->default(45)->comment('Maximum learners per stream');
            $table->boolean('is_active')->default(true);
            
            $table->unique(['class_name', 'stream']);
            $table->index('level');
            $table->timestamps();
        });

        // ─── 1.4 SUBJECTS ──────────────────────────────────────────────────
        // Academic subjects catalog. Used across curriculum, timetables,
        // exam results, and reporting.
        Schema::dropIfExists('subjects');
        Schema::create('subjects', function (Blueprint $table) {
            $table->id();
            $table->string('subject_code', 10)->unique()->comment('e.g., MATH, ENG, BIO, PHY');
            $table->string('subject_name', 100)->comment('e.g., Mathematics, English Language');
            $table->string('department', 50)->nullable()->comment('Sciences, Humanities, Languages');
            $table->boolean('is_compulsory')->default(true)->comment('CBC compulsory subject');
            
            $table->index('department');
            $table->timestamps();
        });

        // ─── 1.5 LEARNING OUTCOMES ─────────────────────────────────────────
        // CBC themes/topics per subject with specific competencies and
        // assessment criteria. Each subject has multiple learning outcomes.
        // This satisfies the CBC requirement of tracking competencies (not
        // just grades) per the Competency-Based Curriculum.
        Schema::dropIfExists('learning_outcomes');
        Schema::create('learning_outcomes', function (Blueprint $table) {
            $table->id();
            $table->foreignId('subject_id')->constrained()->cascadeOnDelete();
            $table->string('theme', 200)->comment('CBC theme/topic name, e.g., Algebra, Cell Biology');
            $table->text('competency')->comment('Specific competency description per CBC');
            $table->text('assessment_criteria')->nullable()->comment('How this outcome is assessed');
            $table->string('class_level', 20)->comment('S1, S2, S3, S4');
            $table->integer('sort_order')->default(0)->comment('Display order within subject');
            
            $table->index('theme');
            $table->index('class_level');
            $table->timestamps();
        });

        // ========================================================================
        // MODULE 2: PEOPLE MANAGEMENT
        // ========================================================================
        // All human entities: learners, guardians, staff, and their roles.

        // ─── 2.1 STAFF ROLES ────────────────────────────────────────────────
        // Reference lookup for staff roles. Keeps the staff table clean.
        Schema::dropIfExists('staff_roles');
        Schema::create('staff_roles', function (Blueprint $table) {
            $table->id();
            $table->string('code', 20)->unique()->comment('TEACHER, BURSAR, ADMIN, HEAD_TEACHER');
            $table->string('display_name', 50)->comment('e.g., Teacher, Bursar, Admin, Head Teacher');
            $table->text('description')->nullable();
            $table->timestamps();
        });

        // ─── 2.2 STAFF ──────────────────────────────────────────────────────
        // Teaching and non-teaching staff. Uses EER specialization:
        // Staff → { Teacher | Bursar | Admin | Head Teacher } via role_id.
        Schema::dropIfExists('staff');
        Schema::create('staff', function (Blueprint $table) {
            $table->id();
            $table->string('staff_number', 20)->unique()->comment('e.g., STF001, STF002');
            $table->string('full_name', 100);
            $table->foreignId('role_id')->constrained('staff_roles')->comment('Teacher, Bursar, Admin, Head Teacher');
            $table->string('phone', 20)->nullable();
            $table->string('email', 100)->nullable()->unique();
            $table->date('hire_date');
            $table->boolean('is_active')->default(true);
            
            $table->index('role_id');
            $table->index('is_active');
            $table->timestamps();
            $table->softDeletes();
        });

        // ─── 2.3 GUARDIANS ────────────────────────────────────────────────
        // Independent guardian entity (shared across siblings).
        // Enables M:N relationship between students and guardians.
        Schema::dropIfExists('guardians');
        Schema::create('guardians', function (Blueprint $table) {
            $table->id();
            $table->string('full_name', 100);
            $table->string('phone_number', 20);
            $table->string('email', 100)->nullable();
            $table->string('relationship', 50)->nullable()->comment('Father, Mother, Uncle, etc.');
            $table->boolean('is_emergency_contact')->default(false);
            $table->text('address')->nullable();
            
            $table->index('phone_number');
            $table->timestamps();
        });

        // ─── 2.4 STUDENTS ─────────────────────────────────────────────────
        // Core learner enrollment records. Each student belongs to one
        // class per academic year (tracked via enrollments).
        Schema::dropIfExists('students');
        Schema::create('students', function (Blueprint $table) {
            $table->id();
            $table->string('student_number', 20)->unique()->comment('e.g., STU001, STU2026001');
            $table->string('full_name', 100);
            $table->enum('gender', ['Male', 'Female', 'Other'])->nullable();
            $table->date('date_of_birth');
            $table->foreignId('current_class_id')->nullable()->constrained('classes')->nullOnDelete();
            $table->date('enrollment_date');
            $table->enum('status', ['Active', 'Graduated', 'Transferred', 'Suspended', 'Expelled'])->default('Active');
            
            $table->index('status');
            $table->index('current_class_id');
            $table->index('full_name');
            $table->timestamps();
            $table->softDeletes();
        });

        // ─── 2.5 STUDENT-GUARDIAN (M:N PIVOT) ──────────────────────────────
        // Pivot table for the many-to-many relationship between students
        // and guardians. A guardian can have multiple children enrolled.
        Schema::dropIfExists('guardian_student');
        Schema::create('guardian_student', function (Blueprint $table) {
            $table->id();
            $table->foreignId('guardian_id')->constrained()->cascadeOnDelete();
            $table->foreignId('student_id')->constrained()->cascadeOnDelete();
            $table->boolean('is_primary_guardian')->default(false)->comment('Primary contact for school communications');
            
            $table->unique(['guardian_id', 'student_id']);
            $table->index('student_id');
            $table->index('guardian_id');
            $table->timestamps();
        });

        // ─── 2.6 STUDENT CONTACTS ──────────────────────────────────────────
        // Direct emergency contacts per student (legacy support, coexists
        // with the guardian relationship above for backward compatibility).
        Schema::dropIfExists('student_contacts');
        Schema::create('student_contacts', function (Blueprint $table) {
            $table->id();
            $table->foreignId('student_id')->constrained()->cascadeOnDelete();
            $table->string('guardian_name', 100);
            $table->string('phone_number', 20);
            $table->string('relationship', 50)->nullable();
            $table->boolean('is_emergency_contact')->default(false);
            
            $table->index('student_id');
            $table->timestamps();
        });

        // ========================================================================
        // MODULE 3: STAFF ASSIGNMENTS
        // ========================================================================
        // Junction tables linking staff to classes and subjects per term.

        // ─── 3.1 CLASS TEACHER ─────────────────────────────────────────────
        // Assigns a teacher as class teacher for a specific class and term.
        // One class has exactly one class teacher per term.
        Schema::dropIfExists('class_teacher');
        Schema::create('class_teacher', function (Blueprint $table) {
            $table->id();
            $table->foreignId('staff_id')->constrained()->cascadeOnDelete();
            $table->foreignId('class_id')->constrained()->cascadeOnDelete();
            $table->foreignId('term_id')->constrained()->cascadeOnDelete();
            $table->boolean('is_primary')->default(true)->comment('Support for co-class teachers');
            
            $table->unique(['class_id', 'term_id']);
            $table->index('staff_id');
            $table->index('term_id');
            $table->timestamps();
        });

        // ─── 3.2 SUBJECT TEACHER ───────────────────────────────────────────
        // Assigns teachers to subjects in specific classes per term.
        // Core M:N relationship for timetable construction.
        Schema::dropIfExists('subject_teacher');
        Schema::create('subject_teacher', function (Blueprint $table) {
            $table->id();
            $table->foreignId('staff_id')->constrained()->cascadeOnDelete();
            $table->foreignId('subject_id')->constrained()->cascadeOnDelete();
            $table->foreignId('class_id')->constrained()->cascadeOnDelete();
            $table->foreignId('term_id')->constrained()->cascadeOnDelete();
            $table->integer('periods_per_week')->default(8)->comment('CBC recommended hours');
            
            $table->unique(['staff_id', 'subject_id', 'class_id', 'term_id'], 'subject_teacher_unique');
            $table->index('class_id');
            $table->index('term_id');
            $table->timestamps();
        });

        // ========================================================================
        // MODULE 4: FINANCE
        // ========================================================================
        // Fee structure definitions and payment tracking.

        // ─── 4.1 FEE TYPES ──────────────────────────────────────────────────
        // Reference lookup for fee categories. 8 standard types defined
        // per the Ugandan secondary school context.
        Schema::dropIfExists('fee_types');
        Schema::create('fee_types', function (Blueprint $table) {
            $table->id();
            $table->string('fee_name', 50)->unique()->comment('Tuition, Development Fee, PTA, Sports, Computer Lab, Lunch, Transport, Uniform');
            $table->text('description')->nullable();
            $table->boolean('is_mandatory')->default(true)->comment('Must this fee be paid?');
            $table->timestamps();
        });

        // ─── 4.2 FEE STRUCTURE ─────────────────────────────────────────────
        // Defines how much each class pays per fee type per term.
        // This is the pricing matrix for fee billing.
        Schema::dropIfExists('fee_structure');
        Schema::create('fee_structure', function (Blueprint $table) {
            $table->id();
            $table->foreignId('class_id')->constrained()->cascadeOnDelete();
            $table->foreignId('fee_type_id')->constrained()->cascadeOnDelete();
            $table->foreignId('term_id')->constrained()->cascadeOnDelete();
            $table->decimal('amount', 10, 2)->comment('Fee amount in UGX');
            $table->text('notes')->nullable();
            
            $table->unique(['class_id', 'fee_type_id', 'term_id'], 'fee_structure_unique');
            $table->index('term_id');
            $table->index('fee_type_id');
            $table->timestamps();
        });

        // ─── 4.3 PAYMENTS ──────────────────────────────────────────────────
        // Payment transactions made by students. Each payment is linked
        // to a student and optionally to a specific fee structure item.
        Schema::dropIfExists('payments');
        Schema::create('payments', function (Blueprint $table) {
            $table->id();
            $table->string('payment_code', 30)->unique()->comment('e.g., PAY-2026-001');
            $table->foreignId('student_id')->constrained()->cascadeOnDelete();
            $table->foreignId('fee_structure_id')->nullable()->constrained()->nullOnDelete();
            $table->decimal('amount_paid', 10, 2);
            $table->date('payment_date');
            $table->enum('payment_method', ['Cash', 'Mobile Money', 'Bank', 'Cheque'])->default('Cash');
            $table->string('reference_number', 100)->nullable()->comment('Bank ref, MM txn ID, cheque no.');
            $table->text('notes')->nullable();
            
            $table->index('student_id');
            $table->index('payment_date');
            $table->index('payment_method');
            $table->timestamps();
        });

        // ─── 4.4 PAYMENT RECEIPTS ─────────────────────────────────────────
        // Receipts generated automatically per payment. 1:1 relationship.
        Schema::dropIfExists('payment_receipts');
        Schema::create('payment_receipts', function (Blueprint $table) {
            $table->id();
            $table->string('receipt_number', 30)->unique()->comment('e.g., REC-2026-001');
            $table->foreignId('payment_id')->unique()->constrained()->cascadeOnDelete();
            $table->foreignId('issued_by_id')->constrained('staff')->nullOnDelete();
            $table->date('issue_date');
            
            $table->index('issued_by_id');
            $table->timestamps();
        });

        // ========================================================================
        // MODULE 5: ACADEMICS & ASSESSMENT
        // ========================================================================
        // Exam definitions, results, generic skills, and skill assessments
        // per the CBC (Competency-Based Curriculum) framework.

        // ─── 5.1 EXAMS ──────────────────────────────────────────────────────
        // Exam event definitions per term. Supports CBC types:
        // End of Term, Continuous Assessment, Mock, UNEB.
        Schema::dropIfExists('exams');
        Schema::create('exams', function (Blueprint $table) {
            $table->id();
            $table->string('exam_name', 100)->comment('e.g., Term 1 Mathematics Exam');
            $table->enum('exam_type', [
                'End of Term',
                'Continuous Assessment',
                'Mock',
                'UNEB'
            ])->default('End of Term');
            $table->foreignId('term_id')->constrained()->cascadeOnDelete();
            $table->date('exam_date')->nullable();
            $table->text('notes')->nullable();
            
            $table->index('term_id');
            $table->index('exam_type');
            $table->timestamps();
        });

        // ─── 5.2 EXAM RESULTS ──────────────────────────────────────────────
        // Per-student, per-subject marks and grades. Final score =
        // CA score + End of Term score per the CBC grading system.
        Schema::dropIfExists('exam_results');
        Schema::create('exam_results', function (Blueprint $table) {
            $table->id();
            $table->foreignId('student_id')->constrained()->cascadeOnDelete();
            $table->foreignId('subject_id')->constrained()->cascadeOnDelete();
            $table->foreignId('exam_id')->constrained()->cascadeOnDelete();
            $table->decimal('marks_obtained', 5, 2);
            $table->decimal('total_marks', 5, 2)->default(100.00);
            $table->string('grade', 2)->nullable()->comment('A=Exceptional, B=Outstanding, C=Satisfactory, D=Basic, E=Elementary');
            $table->text('teacher_comments')->nullable();
            
            $table->unique(['student_id', 'subject_id', 'exam_id'], 'exam_result_unique');
            $table->index('exam_id');
            $table->index('subject_id');
            $table->index('grade');
            $table->timestamps();
        });

        // ─── 5.3 GENERIC SKILLS ─────────────────────────────────────────────
        // CBC generic skills reference catalog. These are the soft skills
        // assessed every term per the Competency-Based Curriculum.
        Schema::dropIfExists('generic_skills');
        Schema::create('generic_skills', function (Blueprint $table) {
            $table->id();
            $table->string('skill_code', 20)->unique()->comment('e.g., COMM, TEAM, CRIT');
            $table->string('skill_name', 100)->comment('Communication, Teamwork, Critical Thinking, etc.');
            $table->text('description')->nullable();
            $table->timestamps();
        });

        // ─── 5.4 SKILL ASSESSMENTS ──────────────────────────────────────────
        // Per-student, per-term generic skill ratings.
        // Rating scale: Beginning → Developing → Proficient → Mastery
        Schema::dropIfExists('skill_assessments');
        Schema::create('skill_assessments', function (Blueprint $table) {
            $table->id();
            $table->foreignId('student_id')->constrained()->cascadeOnDelete();
            $table->foreignId('skill_id')->constrained('generic_skills')->cascadeOnDelete();
            $table->foreignId('term_id')->constrained()->cascadeOnDelete();
            $table->enum('rating', ['Beginning', 'Developing', 'Proficient', 'Mastery'])->default('Beginning');
            $table->text('teacher_remarks')->nullable();
            
            $table->unique(['student_id', 'skill_id', 'term_id'], 'skill_assessment_unique');
            $table->index('term_id');
            $table->index('rating');
            $table->timestamps();
        });

        // ========================================================================
        // MODULE 6: DAILY OPERATIONS
        // ========================================================================
        // Attendance tracking, library management, and communications.

        // ─── 6.1 ATTENDANCE ────────────────────────────────────────────────
        // Daily attendance records per student. Supports standard
        // statuses: Present, Absent, Late, Excused.
        Schema::dropIfExists('attendance');
        Schema::create('attendance', function (Blueprint $table) {
            $table->id();
            $table->foreignId('student_id')->constrained()->cascadeOnDelete();
            $table->date('attendance_date');
            $table->enum('status', ['Present', 'Absent', 'Late', 'Excused'])->default('Present');
            $table->foreignId('recorded_by_id')->constrained('staff')->nullOnDelete();
            $table->text('notes')->nullable()->comment('Reason for absence/late if provided');
            
            $table->unique(['student_id', 'attendance_date'], 'attendance_unique');
            $table->index('attendance_date');
            $table->index('status');
            $table->timestamps();
        });

        // ─── 6.2 BOOKS ──────────────────────────────────────────────────────
        // Library book inventory. Each book has a subject association
        // for curriculum-aligned cataloging.
        Schema::dropIfExists('books');
        Schema::create('books', function (Blueprint $table) {
            $table->id();
            $table->string('isbn', 20)->unique()->comment('ISBN-10 or ISBN-13');
            $table->string('title', 200);
            $table->string('author', 100)->nullable();
            $table->foreignId('subject_id')->nullable()->constrained()->nullOnDelete();
            $table->string('publisher', 100)->nullable();
            $table->year('publication_year')->nullable();
            $table->integer('copies_available')->default(1);
            $table->string('shelf_location', 50)->nullable();
            
            $table->index('title');
            $table->index('author');
            $table->timestamps();
        });

        // ─── 6.3 BOOK LOANS ─────────────────────────────────────────────────
        // Book borrowing records. A loan is borrowed by either a student
        // or a staff member (EER union type: BookLoan Borrower).
        Schema::dropIfExists('book_loans');
        Schema::create('book_loans', function (Blueprint $table) {
            $table->id();
            $table->foreignId('book_id')->constrained()->cascadeOnDelete();
            $table->foreignId('student_id')->nullable()->constrained()->cascadeOnDelete();
            $table->foreignId('staff_id')->nullable()->constrained()->cascadeOnDelete();
            $table->date('loan_date');
            $table->date('due_date');
            $table->date('return_date')->nullable();
            $table->decimal('fine_amount', 10, 2)->default(0.00)->comment('Accrued late fines');
            $table->text('notes')->nullable();
            
            $table->index('book_id');
            $table->index('student_id');
            $table->index('staff_id');
            $table->index('due_date');
            $table->index('return_date');
            $table->timestamps();
        });

        // ─── 6.4 NOTICES ────────────────────────────────────────────────────
        // System-wide announcements targeting specific audiences.
        Schema::dropIfExists('notices');
        Schema::create('notices', function (Blueprint $table) {
            $table->id();
            $table->string('title', 200);
            $table->text('content');
            $table->enum('audience', ['Students', 'Parents', 'Staff', 'All'])->default('All');
            $table->foreignId('posted_by_id')->constrained('staff')->nullOnDelete();
            $table->date('posted_date');
            $table->date('expiry_date')->nullable();
            $table->boolean('is_pinned')->default(false)->comment('Show at top of feed');
            
            $table->index('audience');
            $table->index('posted_date');
            $table->index('expiry_date');
            $table->timestamps();
        });

        // ========================================================================
        // MODULE 7: STUDENT LIFECYCLE
        // ========================================================================
        // Tracks promotion, repetition, transfer, discipline, and
        // enrollment history for each learner.

        // ─── 7.1 ENROLLMENTS ────────────────────────────────────────────────
        // Year-by-year enrollment records. One student has exactly one
        // enrollment per academic year, tracking their class assignment.
        Schema::dropIfExists('enrollments');
        Schema::create('enrollments', function (Blueprint $table) {
            $table->id();
            $table->foreignId('student_id')->constrained()->cascadeOnDelete();
            $table->foreignId('academic_year_id')->constrained()->cascadeOnDelete();
            $table->foreignId('class_id')->constrained()->cascadeOnDelete();
            $table->date('enrollment_date');
            $table->text('notes')->nullable();
            
            $table->unique(['student_id', 'academic_year_id'], 'enrollment_unique');
            $table->index('class_id');
            $table->index('academic_year_id');
            $table->timestamps();
        });

        // ─── 7.2 PROMOTION RECORDS ──────────────────────────────────────────
        // Tracks learner promotion from one class to the next.
        // E.g., John promoted from S1 East to S2 West in 2025.
        Schema::dropIfExists('promotion_records');
        Schema::create('promotion_records', function (Blueprint $table) {
            $table->id();
            $table->foreignId('student_id')->constrained()->cascadeOnDelete();
            $table->foreignId('from_class_id')->constrained('classes');
            $table->foreignId('to_class_id')->constrained('classes');
            $table->foreignId('academic_year_id')->constrained();
            $table->date('promotion_date');
            $table->text('reason')->nullable();
            
            $table->index('student_id');
            $table->index('academic_year_id');
            $table->timestamps();
        });

        // ─── 7.3 REPETITION RECORDS ─────────────────────────────────────────
        // Tracks when a learner repeats a class.
        // E.g., Mary repeated S1 in 2025 academic year.
        Schema::dropIfExists('repetition_records');
        Schema::create('repetition_records', function (Blueprint $table) {
            $table->id();
            $table->foreignId('student_id')->constrained()->cascadeOnDelete();
            $table->foreignId('class_id')->constrained();
            $table->foreignId('academic_year_id')->constrained();
            $table->date('repetition_date');
            $table->text('reason')->nullable()->comment('Academic, health, personal, etc.');
            
            $table->index('student_id');
            $table->index('academic_year_id');
            $table->timestamps();
        });

        // ─── 7.4 TRANSFER RECORDS ───────────────────────────────────────────
        // Tracks learner transfers in/out of the school.
        Schema::dropIfExists('transfer_records');
        Schema::create('transfer_records', function (Blueprint $table) {
            $table->id();
            $table->foreignId('student_id')->constrained()->cascadeOnDelete();
            $table->enum('direction', ['Incoming', 'Outgoing'])->comment('Transfer into or out of the school');
            $table->string('from_school', 150)->nullable()->comment('Previous school for incoming');
            $table->string('to_school', 150)->nullable()->comment('Destination for outgoing');
            $table->date('transfer_date');
            $table->text('reason')->nullable();
            $table->string('reference_document', 100)->nullable();
            
            $table->index('student_id');
            $table->index('direction');
            $table->timestamps();
        });

        // ─── 7.5 DISCIPLINE RECORDS ─────────────────────────────────────────
        // Student discipline incident tracking.
        Schema::dropIfExists('discipline_records');
        Schema::create('discipline_records', function (Blueprint $table) {
            $table->id();
            $table->foreignId('student_id')->constrained()->cascadeOnDelete();
            $table->date('incident_date');
            $table->string('incident_type', 100)->comment('e.g., Tardiness, Misconduct, Bullying');
            $table->text('description');
            $table->string('action_taken', 200)->nullable()->comment('e.g., Warning, Suspension, Parent meeting');
            $table->foreignId('recorded_by_id')->constrained('staff');
            $table->boolean('is_resolved')->default(false);
            
            $table->index('student_id');
            $table->index('incident_date');
            $table->index('incident_type');
            $table->timestamps();
        });

        // ========================================================================
        // MODULE 8: TIMETABLE
        // ========================================================================
        // Class-teacher-subject-period scheduling.

        // ─── 8.1 TIMETABLE SLOTS ────────────────────────────────────────────
        // Defines weekly timetable: day, period, subject, teacher, location.
        Schema::dropIfExists('timetable_slots');
        Schema::create('timetable_slots', function (Blueprint $table) {
            $table->id();
            $table->foreignId('class_id')->constrained()->cascadeOnDelete();
            $table->foreignId('subject_teacher_id')->constrained()->cascadeOnDelete();
            $table->enum('day_of_week', ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday']);
            $table->time('start_time');
            $table->time('end_time');
            $table->string('room', 50)->nullable()->comment('Classroom or lab location');
            $table->string('period_label', 20)->nullable()->comment('e.g., Period 1, Period 2');
            
            $table->index('class_id');
            $table->index('day_of_week');
            $table->index('start_time');
            $table->unique(['class_id', 'day_of_week', 'start_time'], 'timetable_slot_unique');
            $table->timestamps();
        });
    }

    /**
     * Reverse all migrations — drop every table in reverse dependency order.
     */
    public function down(): void
    {
        // Module 8: Timetable
        Schema::dropIfExists('timetable_slots');

        // Module 7: Student Lifecycle
        Schema::dropIfExists('discipline_records');
        Schema::dropIfExists('transfer_records');
        Schema::dropIfExists('repetition_records');
        Schema::dropIfExists('promotion_records');
        Schema::dropIfExists('enrollments');

        // Module 6: Daily Operations
        Schema::dropIfExists('notices');
        Schema::dropIfExists('book_loans');
        Schema::dropIfExists('books');
        Schema::dropIfExists('attendance');

        // Module 5: Academics & Assessment
        Schema::dropIfExists('skill_assessments');
        Schema::dropIfExists('generic_skills');
        Schema::dropIfExists('exam_results');
        Schema::dropIfExists('exams');

        // Module 4: Finance
        Schema::dropIfExists('payment_receipts');
        Schema::dropIfExists('payments');
        Schema::dropIfExists('fee_structure');
        Schema::dropIfExists('fee_types');

        // Module 3: Staff Assignments
        Schema::dropIfExists('subject_teacher');
        Schema::dropIfExists('class_teacher');

        // Module 2: People Management
        Schema::dropIfExists('student_contacts');
        Schema::dropIfExists('guardian_student');
        Schema::dropIfExists('students');
        Schema::dropIfExists('guardians');
        Schema::dropIfExists('staff');
        Schema::dropIfExists('staff_roles');

        // Module 1: Core Academic Structure
        Schema::dropIfExists('learning_outcomes');
        Schema::dropIfExists('subjects');
        Schema::dropIfExists('classes');
        Schema::dropIfExists('terms');
        Schema::dropIfExists('academic_years');
    }
};

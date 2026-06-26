# Internship Log Book — Week 3

**Intern:** Opiyo Oscar  
**Reg No:** 23/U/1330  
**Student No:** 2300701330  
**Track:** Web Development  
**Week:** 22nd – 26th June 2026  
**Project:** SchoolPay — School Management System (Issue #13)  

---

## Monday — 22nd June 2026

### Task Completed
- Cloned the school database repository from GitHub and explored the existing codebase structure
- Read through all existing SQL files (`schema.sql`, `01_database_setup.sql`, `school_management.sql`, etc.) to understand what tables and relationships are already implemented
- Studied the DBML relationship model in `docx/relationship.dbml` and the existing ERD images in `docx/`
- Read the project requirements specification in `docs/requirements.txt` to understand what the system must cover (13 modules, CBC curriculum, grading system)
- Visited Custosell Frontend project to study Jupyter notebook patterns for architecture documentation
- Visited Custocare Backend project to study database migration blueprint patterns (`database_setup1.php`, `database_setup2.php`)
- Mapped out the initial gap analysis — compared requirements against existing SQL tables to identify missing entities

### Tasks in Progress
- Cataloging all entities the system needs (aiming for 20+)
- Laying out the structure for the EER diagram documentation

### Next Day's Tasks
- Draft the full entity catalog with descriptions and status
- Start building the Entity-Relationship diagram
- Define relationships and cardinalities between entity pairs

### Problems/Challenges
- The existing SQL files are spread across multiple versions with slightly different schemas — had to consolidate which one is the canonical version
- The `docs` directory was a file (2 bytes), not a directory — needed to remove and recreate it as a folder
- Custosell references had to be stripped since it's a separate project, not part of this work

---

## Tuesday — 23rd June 2026

### Task Completed
- Created the full entity catalog — 30 entities identified (18 existing in SQL, 12 planned)
- Categorized all entities into Reference/Lookup vs Transactional with update cadence
- Built the EER specializations section:
  - Staff by role (Teacher, Bursar, Admin, Head Teacher)
  - TeachingStaff vs NonTeachingStaff
  - Exam by type (End of Term, Continuous Assessment, Mock, UNEB)
  - BookLoan borrower as a union type (Student or Staff)
- Designed the main Entity-Relationship diagram with all relationships and cardinalities
- Created the relationship matrix with concrete examples for each pair
- Developed the initial Jupyter notebook (`eerd-diagram.ipynb`) with 7 sections following the Custosell documentation style
- Created the markdown mirror (`erd-draft.md`) for quick reference
- Rendered the full ER diagram to PNG (`erd-draft.png`) via mermaid.ink API

### Tasks in Progress
- Reviewing the notebook for completeness against Issue #13 requirements
- Needs to add the `learning_outcomes` entity (CBC themes/competencies)

### Next Day's Tasks
- Review work completed so far and identify gaps
- Add `learning_outcomes` entity to match the requirements spec
- Break the EER diagram into smaller module-level sub-diagrams for readability

### Problems/Challenges
- Mermaid CLI (`mmdc`) wouldn't work in this environment due to Chromium/Puppeteer dependency — had to use the mermaid.ink online API instead
- The notebook structure needed careful JSON formatting to remain valid
- Had to keep section numbering aligned when inserting new content

---

## Wednesday — 24th June 2026

### Task Completed
- Reviewed all work done on Monday and Tuesday for completeness and accuracy
- Identified and fixed gaps:
  - Added `learning_outcomes` entity (CBC themes/topics per subject with competencies and assessment criteria) — bringing total to 30 entities
  - Updated entity count from 29 to 30 in both notebook and markdown
  - Updated entity status map with the new entity
  - Added `learning_outcomes` relationship to the ER diagram (`subjects 1--N learning_outcomes`)
- Cross-checked against the requirements specification — confirmed all 13 modules are covered
- Removed all Custosell references from documentation (notebook, markdown, references section)
- Renumbered all sections after structural changes
- Broke the monolithic EER diagram into 8 focused module-level sub-diagrams:
  1. Core Academic Structure (5 entities)
  2. People Management (5 entities)
  3. Staff Assignments (4 entities)
  4. Finance (8 entities)
  5. Academics & Assessment (8 entities)
  6. Daily Operations (7 entities)
  7. Student Lifecycle (6 entities)
  8. Timetable (3 entities)
- Rendered each module as a separate PNG image for clear, focused viewing
- Restructured the notebook so module breakdown appears as the primary EER view (Section 3) with the full diagram as reference (Section 4)

### Tasks in Progress
- Validating that all 30 entities are consistently referenced across all documentation sections
- Preparing to build the database migration blueprint

### Next Day's Tasks
- Create the Laravel-style database migration blueprint (`database_setup.php`) following Custocare patterns
- Write a comprehensive guide documenting the PR workflow for future reference

### Problems/Challenges
- The mermaid.ink API returned 503 errors when too many requests were sent simultaneously — had to add 3-second delays between each module image render
- During restructuring, the module breakdown section was accidentally lost when removing a duplicate cell — had to reinsert it
- Notebook section numbering got out of sync multiple times during edits — needed a Python script to fix them programmatically

---

## Thursday — 25th June 2026

### Task Completed
- Built the Laravel-style database migration blueprint (`database/database_setup.php`):
  - 678 lines covering all 30 entities + 1 pivot table = 31 tables
  - 8 modules with clear section dividers (`// ===== MODULE N =====`)
  - Each table has PHPDoc explaining business purpose
  - UI-friendly ENUMs with exhaustive, human-readable values
  - Proper foreign key constraints via `$table->foreignId()...->constrained()`
  - Audit fields: `timestamps()`, `softDeletes()` on relevant tables
  - Database indexes on frequently queried columns
  - Explicitly marked as a BLUEPRINT for splitting into modular migrations
  - `down()` method drops tables in reverse dependency order
- Created `HOWTO_PR.md` — a comprehensive 483-line guide documenting every step of the PR workflow:
  - 12 main sections covering the full lifecycle
  - FAQ section answering common questions
  - Command reference appendix
  - Written to guide future interns through the same process
- Added `.gitignore` file for the project (Node, OS, IDE, environment exclusions)

### Tasks in Progress
- Final review of all files before committing and submitting

### Next Day's Tasks
- Presentation day — demonstrate completed work to supervisor
- Submit final PR for review
- Complete end-of-week report

### Problems/Challenges
- Had to ensure the PHP blueprint follows the exact same style as Custocare's `database_setup2.php` (enum patterns, comment conventions, module divider format)
- The `.gitignore` needed careful scoping — exclude temp render scripts but keep all documentation and source files

---

## Friday — 26th June 2026

### Task Completed
- **Presentation Day** — demonstrated the completed EER diagram and database blueprint to the supervisor
- Presented the key deliverables:
  - `docs/eerd-diagram.ipynb` — Jupyter notebook with full EER documentation
  - 8 module-level PNG diagrams for focused viewing
  - `docs/erd-draft.md` + `erd-draft.png` — full reference
  - `database/database_setup.php` — Laravel migration blueprint
- Created the Pull Request from `feature/eer-diagram` → `main` on GitHub
- Notified supervisor (Brian) via WhatsApp for review
- Responded to feedback and made final adjustments:
  - Fixed ER diagram not being broken down into consumable sub-diagrams
  - Ensured module images render properly
  - Verified section numbering is sequential and correct
- Pushed final commits with all corrections
- Documented the entire week's process in the internship log book

### Tasks in Progress
- Awaiting supervisor feedback on the PR
- No pending tasks — week 3 deliverables are complete

### Next Day's Tasks (Week 4)
- Address any review comments from the PR
- Begin work on the next issue assigned
- Continue with database implementation if directed

### Problems/Challenges
- Initially pushed commits directly to `main` instead of a feature branch — had to rename the branch and force-reset remote main to its previous state
- GitHub's "compare & pull request" wouldn't work when `main` and `feature` had identical commits — had to properly separate them before the PR would show a valid diff

---

# End of Week Report — Week 3

**Period:** 22nd – 26th June 2026  
**Project:** SchoolPay — School Management System  
**Issue:** #13 — Requirements Gathering & System-Wide ER Diagram  

---

## Summary of Work Completed

This week focused on completing the requirements gathering and EER diagram deliverable for Issue #13. The work spanned analysis of existing code, design of the entity model, creation of comprehensive documentation, and submission via pull request.

### Key Deliverables

| Deliverable | File(s) | Description |
|-------------|---------|-------------|
| EER Notebook | `docs/eerd-diagram.ipynb` | Jupyter notebook with 8 sections covering entity catalog, specializations, module breakdown, relationship matrix, and entity status map |
| Module Diagrams | `docs/module-*.png` (×8) | Focused sub-diagrams for each domain module |
| Full Reference | `docs/erd-draft.md` + `.png` | Complete ER diagram with all 30 entities and relationships |
| Database Blueprint | `database/database_setup.php` | Laravel-style migration blueprint (31 tables, 678 lines) |
| PR Guide | `HOWTO_PR.md` | Step-by-step workflow documentation for future interns |
| Configuration | `.gitignore` | Project-level ignore rules |

### Entities Covered

**30 entities total** — 18 existing in SQL, 12 planned:

- **Core Academic** (5): academic_years, terms, classes, subjects, learning_outcomes
- **People Management** (6): staff_roles, staff, guardians, students, guardian_student (pivot), student_contacts
- **Staff Assignments** (2): class_teacher, subject_teacher
- **Finance** (4): fee_types, fee_structure, payments, payment_receipts
- **Academics** (4): exams, exam_results, generic_skills, skill_assessments
- **Daily Operations** (4): attendance, books, book_loans, notices
- **Student Lifecycle** (5): enrollments, promotion_records, repetition_records, transfer_records, discipline_records
- **Timetable** (1): timetable_slots

### EER Features
- Staff specialization by role (Teacher, Bursar, Admin, Head Teacher)
- Exam specialization by type (End of Term, CA, Mock, UNEB)
- BookLoan borrower union type (Student or Staff)
- CBC-compliant: generic skills with Beginning→Developing→Proficient→Mastery scale
- Reference vs Transactional entity classification

### Files Changed

```
docs/eerd-diagram.ipynb          # Main documentation notebook
docs/erd-draft.md                 # Markdown reference
docs/erd-draft.png                # Full ER diagram image
docs/module-01-core.png           # Module sub-diagrams (×8)
docs/module-02-people.png
docs/module-03-staff-assignments.png
docs/module-04-finance.png
docs/module-05-academics.png
docs/module-06-daily-ops.png
docs/module-07-lifecycle.png
docs/module-08-timetable.png
docs/requirements.txt             # Requirements specification
database/database_setup.php       # Database migration blueprint
HOWTO_PR.md                       # PR workflow guide
.gitignore                        # Project ignore rules
```

### Challenges Encountered
1. **Schema consolidation** — Multiple SQL file versions with slightly different schemas; had to identify which was canonical
2. **Mermaid rendering** — CLI tools required Chromium which wasn't available; used online API with rate-limit handling
3. **Branch management** — Initial commits went to main instead of a feature branch; had to rename and force-reset remote main
4. **Notebook structure** — Multiple restructuring passes caused section numbering drift; fixed programmatically
5. **Reference cleanup** — Had to remove all cross-project references (Custosell) to keep documentation self-contained

### Lessons Learned
- Always create a feature branch before starting work, never commit to main directly
- Use online API fallbacks when CLI tools have environment dependencies
- Keep a running entity count to catch gaps between documentation and requirements
- Break large diagrams into module-level views for readability
- Validate notebook JSON after every edit to prevent corruption

### Status
- [x] Issue #13 requirements met
- [x] PR submitted (`feature/eer-diagram` → `main`)
- [x] Supervisor notified for review
- [ ] Awaiting feedback and merge

---

*Report prepared by Opiyo Oscar — 23/U/1330 (2300701330)*

# HOWTO: Create a Pull Request for the School Database Project

This guide documents the step-by-step process we followed to create the EER
diagram deliverable and submit it for review. Use this as a reference when
working on future issues.

---

## 1. Understand the Issue

Before writing any code, read the issue carefully on GitHub.

**Example:** Issue #13 asked for:
- A list of 15-20 entities the system needs
- Cardinalities for each relationship pair
- Classification of reference vs transactional entities
- An ER diagram (boxes + lines, no columns yet)
- Committed to the repo at `docs/erd-draft.png` + source file

**Key questions to answer before starting:**
- What is the deliverable? (diagram, documentation, code?)
- What format is expected? (PNG, markdown, notebook?)
- Where should it be saved? (which directory?)
- Who is the audience? (team members, supervisors?)

---

## 2. Clone the Repository

```bash
git clone https://github.com/Powellpay-LTD/schooldatabase.git
cd schooldatabase
```

If the repo already exists locally, pull the latest:

```bash
git checkout main
git pull origin main
```

---

## 3. Explore the Existing Codebase

Before building anything new, understand what already exists.

**What to look for:**
- Existing SQL files — what tables are already defined?
- Existing documentation — any ERDs, DBML files, requirements?
- Naming conventions — how are tables/files named?
- Comments — is there author info, reg numbers, tracks?

**Commands used:**

```bash
# List all files
ls -la

# Read key SQL files
cat schema.sql
cat 01_database_setup.sql

# Look for existing documentation
ls -la docx/
cat docx/relationship.dbml

# Check for a requirements document
ls -la docs/
```

---

## 4. Research Reference Projects

Look at existing projects for patterns and conventions.

**We referenced:**
- **Custosell Frontend** (`C:\Dev\Custosell\Frontend\docs\offline\`)
  - Jupyter notebook format for architecture docs
  - Mermaid diagrams for ER and flow charts
  - Section structure: header, diagrams, tables, decision matrices

- **Custocare Backend** (`C:\Dev\Custocare\Backend\database\`)
  - `database_setup1.php` — comprehensive single-file blueprint
  - `database_setup2.php` — focused per-table migration
  - Modular migration files in `migrations/` directory
  - Factory and seeder patterns

**Key patterns adopted:**
- Use Jupyter notebooks (`.ipynb`) for rich documentation with embedded diagrams
- Use Mermaid for ER diagrams and flow charts (renders natively on GitHub)
- Use Laravel-style PHP migrations for database blueprints
- Mark blueprint files explicitly as BLUEPRINTS

---

## 5. Analyze Requirements

Cross-reference existing code with the requirements specification.

**We compared:**
- Requirements in `docs/requirements.txt`
- DBML model in `docx/relationship.dbml`
- Existing SQL tables in `schema.sql` and `01_database_setup.sql`

**Gap analysis template:**

| Requirement | Current Status | Gap? |
|-------------|---------------|------|
| Feature A | ✅ Existing | — |
| Feature B | 📋 Planned | Missing SQL |
| Feature C | ❌ Missing | Not in DBML or SQL |

**Categorize entities:**
- **Reference / Lookup** — rarely changes (e.g., terms, subjects, fee_types)
- **Transactional** — constantly changes (e.g., payments, attendance, exam_results)

---

## 6. Design the EER Diagram

Identify all entities, their relationships, and EER specializations.

### Entity identification checklist:
- [ ] List every noun the system needs to remember (aim for 15-20+)
- [ ] For each entity, note if it exists in SQL, is planned, or is missing
- [ ] Track the total count

### Relationship mapping:
- [ ] For each entity pair, decide: 1:1, 1:N, or M:N
- [ ] Write a concrete example for each M:N relationship
- [ ] Document in a relationship matrix table

### EER specializations:
- [ ] Identify IS-A hierarchies (e.g., Staff → Teacher/Bursar/Admin)
- [ ] Identify union types (e.g., BookLoan borrower = Student or Staff)
- [ ] Draw each specialization as a separate focused diagram

---

## 7. Create the Documentation

### Step 7.1: Set up the docs directory

```bash
# Remove old docs file if it exists
git rm docs
mkdir docs
```

### Step 7.2: Create the Jupyter notebook

The notebook should contain:
1. **Entity catalog** — all entities with descriptions and status
2. **EER specializations** — separate diagrams for each IS-A hierarchy
3. **ER diagram** — full Mermaid ER diagram (all entities + relationships)
4. **Module breakdown** — 8 sub-diagrams organized by domain module
5. **Relationship matrix** — table with cardinalities and examples
6. **Reference vs transactional** — classification with cadence
7. **Entity status map** — which entities exist vs planned

**Notebook structure (from Custosell pattern):**
```
{
 "cells": [
  {"cell_type": "markdown", "source": ["# Title\n\n**Version:** ..."]},
  {"cell_type": "markdown", "source": ["## 1. Entity catalog\n\n..."]},
  ...
 ],
 "metadata": {"kernelspec": {...}},
 "nbformat": 4,
 "nbformat_minor": 5
}
```

### Step 7.3: Create the Markdown version

Create a `.md` mirror of the notebook for quick reading without opening a notebook.

### Step 7.4: Render the ER diagram to PNG

Use an online renderer or CLI tool:

```bash
# Option A: mermaid.ink API (recommended for quick results)
node -e "
const https = require('https');
const fs = require('fs');
const mmd = fs.readFileSync('docs/erd-draft.md', 'utf8');
const match = mmd.match(/'''mermaid\\nerDiagram\\n([\\s\\S]*?)'''/);
const erd = 'erDiagram\\n' + match[1];
const encoded = Buffer.from(erd).toString('base64url');
const url = 'https://mermaid.ink/img/' + encoded + '?bgColor=white&width=3200';
https.get(url, (res) => {
  const file = fs.createWriteStream('docs/erd-draft.png');
  res.pipe(file);
});
"

# Option B: mermaid-cli (requires headless Chrome)
npx @mermaid-js/mermaid-cli mmdc -i input.mmd -o output.png -w 3200
```

### Step 7.5: Render module sub-diagrams

Generate separate PNGs for each module to keep diagrams focused and readable:

```bash
node render-modules.js
```

Each module PNG should be ~40-112KB and show only entities in that domain.

---

## 8. Create the Database Blueprint

Following the Custocare pattern, create a Laravel-style migration blueprint.

### Blueprint structure:
```
database/
  database_setup.php    # Comprehensive single-file blueprint
  migrations/           # (future) Individual migration files
  factories/            # (future) Model factories
  seeders/              # (future) Database seeders
```

### Blueprint conventions:
- **Header**: Clearly mark as BLUEPRINT with explanation
- **Module dividers**: `// ===== MODULE N =====`
- **Table dividers**: `// --- N.M TABLE NAME ---`
- **Each table**: PHPDoc explaining business purpose
- **Column comments**: `->comment('e.g., Tuition, PTA')`
- **UI-friendly ENUMs**: Exhaustive, human-readable values
- **Foreign keys**: `$table->foreignId('x_id')->constrained()...`
- **Indexes**: Add indexes for frequently queried columns
- **Audit fields**: `$table->timestamps(); $table->softDeletes();`
- **Reverse order**: `down()` drops tables in reverse dependency order

### Full file example:
```php
<?php
declare(strict_types=1);

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

/**
 * BLUEPRINT — break this into modular migrations
 */
return new class extends Migration
{
    public function up(): void
    {
        Schema::dropIfExists('table_name');
        Schema::create('table_name', function (Blueprint $table) {
            $table->id();
            $table->string('field', 100)->comment('Business meaning');
            $table->foreignId('related_id')->constrained()->cascadeOnDelete();
            $table->unique(['field_a', 'field_b']);
            $table->index('field');
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('table_name');
    }
};
```

---

## 9. Add Author Details

Every file should include the author's information matching the pattern
in existing SQL files:

```
-- Author: Opiyo Oscar
-- Reg No: 23/U/1330
-- Student No: 2300701330
-- Track: Web Development
```

Place this in:
- Notebook header section
- Markdown file frontmatter
- PHP blueprint file header PHPDoc

---

## 10. Version Control Workflow

### Step 10.1: Create a feature branch

```bash
# ALWAYS create a feature branch — never work on main directly
git checkout -b feature/your-feature-name
```

### Step 10.2: Stage and commit

```bash
# Check what changed
git status
git diff

# Stage files
git add docs/ database/  # or git add -A for everything

# Commit with descriptive message
git commit -m "Concise title of what was done

- Bullet point 1 explaining specific change
- Bullet point 2 explaining specific change
- Bullet point 3 explaining specific change"
```

### Commit message conventions:
- **First line**: 50 chars max, imperative mood ("Add...", "Fix...", "Update...")
- **Blank line** after first line
- **Body**: bullet points explaining what and why, not how

### Step 10.3: Handle mistakes

If you accidentally committed to main:

```bash
# 1. Create a branch at current position
git branch feature/your-work

# 2. Reset main to before your commits
git push origin <old-commit-hash>:main --force

# 3. Reset local main to match remote
git branch -f main origin/main

# 4. Push your feature branch
git push -u origin feature/your-work
```

### Step 10.4: Push to GitHub

```bash
git push -u origin feature/your-feature-name
```

### Step 10.5: Create a Pull Request

1. Open the URL GitHub provides after push:
   `https://github.com/Powellpay-LTD/schooldatabase/pull/new/feature/your-feature-name`

2. Fill in the PR template:
   - **Title**: Clear summary of what was done
   - **Body**: Markdown with:
     - Reference to the issue (`Completes Issue #N`)
     - List of deliverables with file paths
     - Brief description of what's covered
     - Author info

3. **PR Title format**: `[Type] Brief description`
   - `EER diagram & database migration blueprint for school management system`
   - `Add student grade calculation view and procedure`

4. **PR Body template**:
   ```markdown
   Completes **Issue #N** -- Short description.

   ## Deliverables

   ### Category (path/)
   | File | Description |
   |------|-------------|
   | file1.ext | What it does |
   | file2.ext | What it does |

   ## What's Covered
   - Bullet point 1
   - Bullet point 2

   **Author:** Your Name -- Reg/Student No
   ```

5. Assign reviewers and submit.

---

## 11. Notify the Reviewer

After the PR is created, notify the supervisor/team lead:

```
Hi [Name], I've completed the work for Issue #[N]. The PR is on the
[feature/branch-name] branch. Kindly review when you're free. Thanks!
```

---

## 12. Frequently Asked Questions

### Q: Why use Jupyter notebooks instead of just markdown?
Notebooks support embedded rendered diagrams, can include executable
code cells, and follow the pattern used in reference projects.

### Q: Why keep both a notebook and markdown file?
The notebook is for rich viewing with diagrams. The markdown is a
quick-reference version that renders well on GitHub for fast scanning.

### Q: Why break the ER diagram into 8 modules?
A single diagram with 30+ entities is too dense to read. Module-level
diagrams (~3-8 entities each) are focused and easily consumable.

### Q: What's the difference between ER and EER?
EER (Enhanced Entity-Relationship) adds specializations (IS-A
hierarchies), generalizations, and categories (union types) on top
of basic ER. Our diagram includes both.

### Q: Why create a Laravel PHP blueprint when the project uses raw SQL?
The blueprint bridges the existing SQL to a backend framework. It
documents the intended schema in a framework-standard way that can
be split into modular migrations later.

### Q: What if the remote main already has my commits?
Create a feature branch from current main, then force-push main back
to its previous state (see Step 10.3).

---

## Appendix: Command Reference

| Action | Command |
|--------|---------|
| Clone repo | `git clone <url>` |
| Create branch | `git checkout -b feature/name` |
| Check status | `git status` |
| Stage all | `git add -A` |
| Commit | `git commit -m "message"` |
| Push branch | `git push -u origin feature/name` |
| Force push | `git push origin <hash>:branch --force` |
| Reset main | `git branch -f main origin/main` |
| View log | `git log --oneline --graph --all` |

---

*Documented: June 2026 | Author: Opiyo Oscar -- 23/U/1330 (2300701330)*

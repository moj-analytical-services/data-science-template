# 3. Use SQLFluff for SQL linting and formatting

Date: 2025-11-18

## Status

Accepted

## Context

Data science projects frequently involve SQL queries for data extraction, transformation, and analysis. Without standardized SQL formatting and linting:

- SQL code style varies between contributors
- Common SQL anti-patterns and errors go undetected
- Code reviews spend time on formatting rather than logic
- Queries can be difficult to read and maintain
- Performance issues from poorly written SQL may not be caught early

Different SQL dialects (PostgreSQL, MySQL, BigQuery, etc.) have different syntax and best practices, making manual review even more challenging.

## Decision

We will use SQLFluff for SQL linting and formatting, integrated into our pre-commit hooks.

Configuration (`.sqlfluff`):

- **Dialect**: PostgreSQL (default, can be changed per project)
- **Templater**: Jinja (supports dbt and templated SQL)
- **Max line length**: 120 characters
- **Indentation**: 4 spaces
- **Excluded rules**: L003 (indentation), L031 (table aliases in joins)

SQLFluff will run in two modes via pre-commit:

- `sqlfluff-lint`: Check for issues
- `sqlfluff-fix`: Auto-fix formatting where possible

## Consequences

**Positive:**

- Consistent SQL formatting across the project
- Catches common SQL errors and anti-patterns early
- Dialect-aware linting (supports 20+ SQL dialects)
- Integrates with dbt and Jinja templating
- Auto-fixes many formatting issues
- Improves SQL readability and maintainability
- Educates developers on SQL best practices

**Negative:**

- Learning curve for SQLFluff-specific rules
- May require rule configuration for project-specific needs
- Can be slower on large SQL files
- Some fixes may need manual intervention
- Initial setup requires choosing correct dialect

**Neutral:**

- Configuration can be customized per project in `.sqlfluff`
- Rules can be disabled if too strict for project needs
- Runs automatically via pre-commit on changed files only

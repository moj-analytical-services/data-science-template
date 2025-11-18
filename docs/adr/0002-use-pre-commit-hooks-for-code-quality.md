# 2. Use pre-commit hooks for code quality

Date: 2025-11-18

## Status

Proposed

## Context

Data science projects often involve multiple languages (Python, R, SQL), notebooks, and configuration files. Maintaining code quality across these diverse file types is challenging, especially when multiple contributors are involved. Without automated checks, issues like:

- Inconsistent code formatting
- Security vulnerabilities (hardcoded secrets, unsafe patterns)
- Syntax errors in configuration files
- Large data files accidentally committed
- Trailing whitespace and line ending inconsistencies
- Jupyter notebooks with outputs committed

...can slip into the repository, causing technical debt and potential security issues.

Manual code reviews catch some of these, but they're time-consuming and error-prone. We need automated, pre-commit validation to maintain quality standards consistently.

## Decision

We will use pre-commit hooks with a comprehensive set of linters and formatters to automatically check code quality before commits.

The pre-commit configuration includes:

**General hooks:**

- Trailing whitespace removal
- End-of-file fixer
- Large file detection (max 5MB)
- Line ending normalization (LF)
- Merge conflict detection
- YAML/JSON syntax validation

**Python:**

- Black (code formatting, line length 100)
- Flake8 (linting, max line length 110)
- Bandit (security linting)

**Secrets detection:**

- detect-secrets (with baseline file)

**Notebooks:**

- nbstripout (remove outputs before commit)

**R:**

- styler (code formatting)
- lintr (linting)
- Note: R projects should install styler and lintr: `install.packages(c("styler", "lintr"))`

**SQL:**

- SQLFluff (linting and auto-fixing)

Developers must run `pre-commit install` after cloning to activate the hooks.

## Consequences

**Positive:**

- Consistent code formatting across all languages
- Early detection of security issues and secrets
- Prevents large data files from being committed
- Notebooks are cleaned automatically (no outputs in git)
- Reduces code review time by catching trivial issues
- Enforces quality standards before code reaches CI/CD
- Configuration is version-controlled and shared across team

**Negative:**

- Initial setup required for each developer (`pre-commit install`)
- Commits may be rejected requiring fixes before pushing
- First-time hook installation downloads dependencies (can be slow)
- Some hooks may have false positives requiring configuration
- Learning curve for developers unfamiliar with the tools

**Neutral:**

- Pre-commit runs automatically on changed files only
- Can be bypassed with `--no-verify` flag (discouraged)
- Hooks can be run manually on all files: `pre-commit run --all-files`

# 5. Use testthat for R testing with GitHub Actions

Date: 2025-11-18

## Status

Proposed

## Context

Data science projects often include R code for statistical analysis, modeling, and data visualization. R code needs testing just like Python code to ensure:

- Statistical functions produce correct results
- Data transformations work as expected
- Models are reproducible
- Edge cases are handled properly

R has its own testing ecosystem and dependency management that differs from Python. We need:

- A testing framework appropriate for R
- Dependency management for R packages
- CI/CD integration for automated testing
- Compatibility with our existing test structure

## Decision

We will use `testthat` as the R testing framework with `renv` for dependency management, integrated into GitHub Actions.

**Testing Framework:**

- Use `testthat` - the standard R testing framework
- Organize R tests in the same `tests/unit/`, `tests/integration/`, `tests/e2e/` structure
- Follow testthat conventions: `test-*.R` file naming

**Dependency Management:**

- Projects can optionally use `renv` for reproducible R package dependencies
- For simple projects, install packages directly in CI/CD
- If using renv: include `renv.lock` in version control and initialize with `renv::init()`

**CI/CD:**

- GitHub Actions workflow using `r-lib/actions/setup-r@v2`
- Install testthat in CI/CD
- Run tests with `testthat::test_dir("tests/unit/")`
- Optional: Add renv caching when project uses renv

**Workflow:**

```yaml
- Setup R 4.5.1
- Install testthat
- Run testthat tests
```

## Consequences

**Positive:**

- Standard R testing approach using testthat
- Optional renv for reproducible R environments when needed
- Automated R testing in CI/CD
- Consistent test structure across Python and R
- Simple setup without mandatory renv overhead

**Negative:**

- Need to maintain separate dependency management for Python and R
- R tests may run slower than Python unit tests
- Team needs familiarity with both testthat and pytest
- Without renv, package versions not locked (can use renv when needed)

**Neutral:**

- Tests can be run locally: `Rscript -e 'testthat::test_dir("tests/unit/")'`
- Projects can add renv later if reproducibility becomes critical
- Can use same test organization as Python (unit/integration/e2e)

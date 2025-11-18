# 5. Use testthat for R testing with GitHub Actions

Date: 2025-11-18

## Status

Accepted

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

- Use `renv` for reproducible R package dependencies
- Include `renv.lock` in version control
- Initialize with `renv::init()` and snapshot with `renv::snapshot()`

**CI/CD:**

- GitHub Actions workflow using `r-lib/actions/setup-r@v2`
- Cache R packages to speed up workflow
- Run tests with `testthat::test_dir("tests/unit/")`

**Workflow:**

```yaml
- Setup R 4.5.1
- Cache R packages (keyed on renv.lock)
- Install renv
- Restore packages from renv.lock
- Run testthat tests
```

## Consequences

**Positive:**

- Standard R testing approach using testthat
- Reproducible R environment via renv
- Automated R testing in CI/CD
- Consistent test structure across Python and R
- Package caching speeds up CI/CD runs
- renv ensures package version consistency

**Negative:**

- Need to maintain separate dependency files (requirements.txt and renv.lock)
- R tests may run slower than Python unit tests
- Team needs familiarity with both testthat and pytest
- renv adds initial setup overhead

**Neutral:**

- Tests can be run locally: `Rscript -e 'testthat::test_dir("tests/unit/")'`
- renv.lock must be updated when adding R packages: `renv::snapshot()`
- Can use same test organization as Python (unit/integration/e2e)

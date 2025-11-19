# 6. Use pytest for all test types without Docker requirement

Date: 2025-11-19

## Status

Accepted

## Context

When establishing the testing structure for this template, we initially considered using Docker containers (#10) for end-to-end (e2e) tests to provide isolated, reproducible test environments with bundled test data. This approach is common in production systems where:

- Test environments need strict isolation
- Dependencies and data can be packaged together
- CI/CD pipelines have full Docker access

However, the Analytical Platform's data science users face a critical constraint: **the DS community develop on APs VSC or Rstudio hosted on AWS which do not have access to a local docker installation**.
While Docker can run successfully in GitHub Actions workflows, relying solely on GHA for e2e testing creates a tedious development experience.

## Decision

We will use **pytest for all test types** (unit, integration, and e2e) without requiring Docker.

**Alternatives considered:**

- **Docker for e2e tests**: Rejected due to lack of local Docker for most DS users. Would create poor developer experience.
- **No e2e tests at all**: Rejected because some level of workflow testing is valuable, even if not in a perfectly isolated environment.

## Consequences

**Positive:**

- All tests can run in AP VSCode without additional credentials or setup
- Fast feedback loop for developers testing locally
- Lower barrier to entry for contributors
- Consistent tooling (pytest) across all test types
- Test data is versioned alongside code

**Negative:**

- E2E tests run in whatever environment the developer has configured, reducing reproducibility
- Distinction between integration and e2e tests becomes less clear without environment isolation
- Cannot guarantee test environment consistency across different machines
- Risk of "works on my machine" issues with e2e tests
- Less realistic simulation of production environments

**Neutral:**

- Pytest markers provide organizational structure even without Docker
- Test data must be small and synthetic (already a best practice)
- GHA workflows still provide a standardized test environment for CI/CD

## Notes

# 4. Establish test structure with unit, integration, and E2E tests

Date: 2025-11-18

## Status

Accepted

## Context

Data science projects need comprehensive testing to ensure code quality, reliability, and maintainability. However, different types of code require different testing approaches:

- Individual functions and algorithms need fast, isolated testing
- Data pipelines need testing of component interactions
- Complete workflows need end-to-end validation

Without a clear test structure:

- Tests become disorganized and hard to maintain
- It's unclear what level of testing is needed
- Test execution times can become problematic
- Risk of accidentally testing against production data
- Developers may not know where to place new tests

The testing pyramid suggests more unit tests than integration tests, and more integration tests than E2E tests, balancing coverage with execution speed.

## Decision

We will establish a three-tier test structure:

**Directory Structure:**

```
tests/
├── README.md           # Overview and guidelines
├── unit/               # Unit tests
│   └── README.md
├── integration/        # Integration tests
│   └── README.md
└── e2e/                # End-to-end tests
    └── README.md
```

**Test Types:**

1. **Unit Tests** (`tests/unit/`)
   - Test individual functions/methods in isolation
   - Fast execution (milliseconds)
   - No external dependencies
   - Use mocks/stubs for dependencies

2. **Integration Tests** (`tests/integration/`)
   - Test component interactions
   - May use test databases or local services
   - Moderate execution speed (seconds)
   - Verify data flows between modules

3. **End-to-End Tests** (`tests/e2e/`)
   - Test complete workflows
   - Use synthetic test data only
   - Slower execution (minutes)
   - **Must never touch production or real data**

**Critical Safety Rule:**

All E2E tests must include prominent warnings that they can only use test environments and synthetic data. This prevents accidental data exposure or corruption.

## Consequences

**Positive:**

- Clear organization for different test types
- Developers know where to add new tests
- Can run fast unit tests frequently during development
- Slower E2E tests can run in CI/CD only
- Explicit documentation prevents production data access
- Follows industry best practices (testing pyramid)
- Easier to maintain test coverage across different scenarios

**Negative:**

- Requires developers to understand test type distinctions
- More directory structure to navigate
- Need to maintain separate test fixtures for each level
- May have some duplication across test types

**Neutral:**

- Test execution can be targeted by type: `pytest tests/unit/`
- Each directory has README explaining its purpose
- Can adjust test distribution based on project needs

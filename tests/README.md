# Tests

This directory contains the test suite for the project, organized by test type.

## Test Structure

```
tests/
├── unit/          # Unit tests
├── integration/   # Integration tests
└── e2e/           # End-to-end tests
```

## Test Types

### Unit Tests (`tests/unit/`)

Unit tests verify individual functions, methods, or classes in isolation. They should:

- Test a single unit of code
- Run quickly (milliseconds)
- Have no external dependencies (databases, APIs, files)
- Use mocks/stubs for dependencies
- Be deterministic and repeatable

**Example**: Testing a data transformation function with sample input data.

### Integration Tests (`tests/integration/`)

Integration tests verify that multiple components work together correctly. They may:

- Test interactions between modules
- Use test databases or local services
- Run slower than unit tests (seconds)
- Verify data flows between components

**Example**: Testing that a data pipeline correctly reads from a mock database, transforms data, and writes to a test output.

### End-to-End Tests (`tests/e2e/`)

End-to-end tests verify complete workflows from start to finish. They should:

- Test full user scenarios or business processes
- Use realistic test data
- Run slowest of all test types (minutes)
- Verify the entire system works as expected

> [!WARNING]
> **E2E tests must NEVER touch real data or production systems.**
> - Always use dedicated test environments
> - Use synthetic or anonymized test data only
> - Ensure tests can be safely run multiple times
> - Clean up test data after execution

**Example**: Testing a complete data science workflow from data ingestion to model prediction, using test datasets and mock endpoints.

## Running Tests

```bash
# Run all tests
pytest

# Run specific test type
pytest tests/unit/
pytest tests/integration/
pytest tests/e2e/

# Run with coverage
pytest --cov=src tests/
```

## Best Practices

- Write tests alongside your code
- Aim for high coverage of critical paths
- Keep tests independent and isolated
- Use descriptive test names
- Follow the Arrange-Act-Assert pattern
- Don't test implementation details

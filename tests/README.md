# Tests

This directory contains the test suite for the project, organized by test type.

## Test Structure

```
tests/
├── unit/          # Unit tests
├── integration/   # Integration tests
└── e2e/           # End-to-end tests
```

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

- Write tests alongside your code, ideally in a [TDD approach](https://en.wikipedia.org/wiki/Test-driven_development)
- Aim for [high coverage](https://www.atlassian.com/continuous-delivery/software-testing/code-coverage) of critical paths (An arbitrary 80% coverage target is common)
- Keep tests independent and isolated

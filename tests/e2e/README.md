# End-to-End (E2E) Tests

End-to-end tests verify complete workflows from start to finish.

## Characteristics

This is checking that the entire process functions as expected chaining together as many components as necessary for a real use case.

> [!WARNING]
> **CRITICAL: E2E tests must NEVER touch real data or production systems**
> - ❌ **Never** use real data or production systems in E2E tests
> - ✅ **Always** use dedicated test environments with synthetic or anonymized test data
> - ✅ **Always** clean up test data and resources after execution

## Running E2E Tests Locally

> [!NOTE]
> E2E tests are marked with `@pytest.mark.e2e` and **excluded from default pytest runs**.
> This prevents them from running alongside unit/integration tests since they may require special setup (Docker, external services, etc.).

### Using Docker (Recommended)

E2E tests are designed to run in a Docker container with all test data included:

```bash
# Build the test container
docker build -f Dockerfile.test -t test-image .

# Run the e2e tests
docker run --rm test-image
```

### Using pytest directly

To run e2e tests with pytest, explicitly include the e2e marker:

```bash
# Activate your virtual environment first
source venv/bin/activate

# Run ONLY e2e tests
pytest -m e2e -v

# Or run specific e2e test file
pytest tests/e2e/ -m e2e -v
```

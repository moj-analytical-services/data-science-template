# End-to-End (E2E) Tests

End-to-end tests verify complete workflows from start to finish.

## Characteristics

This is checking that the entire process functions as expected chaining together as many components as necessary for a real use case.

> [!WARNING]
> **CRITICAL: E2E tests must NEVER touch real data or production systems**
>
> - ❌ **Never** use real data or production systems in E2E tests
> - ✅ **Always** use dedicated test environments with synthetic or anonymized test data
> - ✅ **Always** clean up test data and resources after execution

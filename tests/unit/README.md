# Unit Tests

Unit tests verify individual functions, methods, or classes in isolation.

## Characteristics

- **Isolated**: No external dependencies (databases, APIs, file systems)
- **Focused**: Test one thing at a time
- **Deterministic**: Same input always produces same output

## Guidelines

- Use mocks and stubs for external dependencies
- Test edge cases and error conditions
- Test both success and failure paths
- Keep test data minimal and clear
- Use fixtures for common test setup

## Example Structure

```python
def test_transform_data_removes_nulls():
    # Arrange
    input_data = [1, 2, None, 3, None, 4]
    expected = [1, 2, 3, 4]

    # Act
    result = transform_data(input_data)

    # Assert
    assert result == expected
```

"""Example e2e test demonstrating full workflow."""

import pytest


@pytest.mark.e2e
def test_end_to_end_workflow():
    """Example e2e test demonstrating complete process."""
    # Simulate loading data
    data = [1, 2, 3, 4, 5]

    # Simulate processing
    result = sum(data)

    # Verify output
    assert result == 15

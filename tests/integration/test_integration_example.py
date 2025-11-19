"""Example integration test demonstrating pytest fixtures and setup."""

import pytest


@pytest.fixture
def sample_data():
    """Fixture providing sample test data."""
    return {"users": ["alice", "bob"], "count": 2}


@pytest.mark.integration
def test_data_processing(sample_data):
    """Example integration test using fixtures."""
    assert len(sample_data["users"]) == sample_data["count"]
    assert "alice" in sample_data["users"]

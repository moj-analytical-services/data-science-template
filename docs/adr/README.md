# Architecture Decision Records (ADRs)

This directory contains Architecture Decision Records (ADRs) for this project. ADRs document significant architectural and design decisions made during the development of this data science template.

## What is an ADR?

An Architecture Decision Record (ADR) is a document that captures an important architectural decision made along with its context and consequences. ADRs help:

- Preserve the reasoning behind design decisions
- Onboard new team members by explaining why things are the way they are
- Avoid revisiting already-settled decisions
- Create accountability for architectural choices

> [!WARNING]
> If your decision making reasoning is more sensitive than the privacy level of the codebase itself allows for, consider other documentation methods.

## ADR Format

Each ADR follows this structure:

- **Title**: A short phrase describing the decision
- **Date**: When the decision was made
- **Status**: The current state of the decision (see below)
- **Context**: The issue or problem being addressed
- **Decision**: What we decided to do
- **Consequences**: The positive, negative, and neutral impacts of the decision

### ADR Status Values

The status field indicates the current state of the decision:

- **Proposed**: The decision is under consideration but not yet finalized. Use this for decisions that need review or discussion before acceptance.

- **Accepted**: The decision has been agreed upon and is currently in effect. Most ADRs will have this status once approved.

- **Deprecated**: The decision is no longer recommended but may still be in use. Use this when a better approach is available but migration hasn't been completed yet.

- **Superseded**: The decision has been replaced by a newer decision. When creating a new ADR that replaces an old one, update the old ADR's status to "Superseded by ADR-XXXX" and link to the new ADR.

> [!IMPORTANT]
> ADRs are supposed to be immutable records. Once an ADR is Accepted, never edit its content. Instead, create a new ADR that supersedes it to document why the decision changed.

## Working with ADRs

This project uses `adr-tools-python` to manage ADRs. Make sure you have installed the development dependencies:

```bash
pip install -r requirements-dev.txt
```

This is a lightweight cli tool to create and manage ADRs.

### Common Commands

#### List all ADRs

```bash
adr-list
```

#### Create a new ADR

```bash
adr-new "Use pre-commit hooks for code quality"
```

This will create a new numbered ADR file (e.g., `0002-use-pre-commit-hooks-for-code-quality.md`) with the standard template.

#### View ADR configuration

```bash
adr-config
```

### Workflow

1. **When making a significant decision**: Create a new ADR to document it
2. **Fill in the template**: Provide context, explain the decision, and list consequences
3. **Commit with your code**: ADRs should be version controlled alongside the code they describe
4. **Never edit accepted ADRs**: If a decision changes, create a new ADR that supersedes the old one

### What decisions should have an ADR?



Document decisions that:

- Affect the project structure or architecture
- Choose between multiple viable alternatives
- Have significant consequences or trade-offs
- Are difficult or costly to reverse
- Future maintainers will need to understand

Examples for this template:

- Choice of development tools (linters, formatters, etc.)
- Project structure and organization
- Coding standards and conventions
- Infrastructure or deployment choices
- Security practices

### What doesn't need an ADR?

- Minor implementation details
- Decisions with obvious single solutions
- Temporary workarounds
- Bug fixes (unless they reveal architectural issues)

## Examples

> [!NOTE]
> ADRs are not commits.
> If it is big picture and architectural, it needs an ADR.
> Routine code maintenance or feature additions do not need ADRs.
> Commit messages and ADR titles should sound different.

### Good ADR titles

- "Use Black for Python code formatting"
- "Adopt virtual environments for dependency isolation"
- "Implement pre-commit hooks for code quality"
- "Use SQLFluff for SQL linting"

### Poor ADR titles


- "Fix bug in data processing" (too specific, not architectural)
- "Update dependencies" (routine maintenance)
- "Add comments to code" (implementation detail)

## Further Reading

- [Documenting Architecture Decisions by Michael Nygard](https://cognitect.com/blog/2011/11/15/documenting-architecture-decisions)
- [ADR GitHub Organization](https://adr.github.io/)
- [Sustainable Architectural Decisions](https://www.infoq.com/articles/sustainable-architectural-design-decisions)

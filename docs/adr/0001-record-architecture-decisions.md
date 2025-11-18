# 1. Record architecture decisions

Date: 2025-11-18

## Status

Proposed

## Context

We need a systematic way to document significant architectural and design decisions made for this data science template repository. As this is a template that will be used across multiple projects, it's crucial that users understand:

- Why certain tools and practices were chosen
- What alternatives were considered
- What trade-offs were made
- What consequences each decision has

Without documentation, institutional knowledge is lost when team members change, and decisions may be revisited unnecessarily.

## Decision

We will use Architecture Decision Records (ADRs) to document all significant architectural decisions in this template.

ADRs will be:

- Stored in `docs/adr/` directory
- Created using `adr-tools-python` for consistency
- Numbered sequentially (0001, 0002, etc.)
- Written in Markdown format
- Immutable once accepted (new ADRs supersede old ones rather than editing)

Each ADR will follow the standard format with:

- Title and number
- Date
- Status (Proposed, Accepted, Deprecated, Superseded)
- Context
- Decision
- Consequences

**Alternatives considered:**

- `adr-viewer`: Generates a static website from ADRs with a web UI. Rejected because GitHub's native Markdown rendering provides sufficient readability without the overhead of generating and maintaining a separate website.
- Original shell-based `adr-tools`: More features (TOC generation, graphing) but adds shell script dependency. Python-based tool is more consistent with data science workflows.
- Manual Markdown files: No tooling dependency but lacks consistency and sequential numbering automation.

## Consequences

**Positive:**

- Design decisions are explicitly documented with rationale
- Historical context is preserved for future maintainers
- Template users can understand why things are set up a certain way
- Decisions can be reviewed and challenged with proper context
- Creates a knowledge base for the template

**Negative:**

- Requires discipline to create ADRs for significant decisions
- Adds overhead to the decision-making process
- ADRs need to be kept up-to-date when decisions are superseded

**Neutral:**

- ADRs are kept in version control alongside code
- `adr-tools-python` is added as a development dependency

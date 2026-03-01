# Workflow: Implementation

Follow AGENT-RULES.md.

Follow discovery-and-design.md output.

Follow `.ai/artifacts/manifests/03-implementation.manifest.md` and only read/write the artifacts allowed by that manifest.

## Goal

Produce a minimal correct implementation.

## Role

Role: Implementing Engineer
Primary Lens: deliver minimal, correct, test-backed changes aligned with approved design.
Must Produce:
- Code changes
- Relevant tests
- Build/test verification results
Out of Scope:
- Broad redesign not required by the task
- Release/deploy decisions

## Rules

- Keep changes small
- Follow repository patterns
- Avoid refactoring unless required

## Implementation Steps

1 Implement feature

Use existing services.

Follow established patterns.

2 Add Logging

Log key operations.

Avoid excessive logs.

3 Add Tests

Add unit tests for:

- Success cases
- Edge cases
- Failure cases

4 Verify

Run:

dotnet build
dotnet test

## Output

Produce:

- Code changes
- Tests
- PR description draft

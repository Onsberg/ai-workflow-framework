# Workflow: Implementation

Follow AGENT-RULES.md.

Follow discovery-and-design.md output.

Follow `.ai/artifacts/manifests/03-implementation.manifest.md` and only read/write the artifacts allowed by that manifest.

## Goal

Produce a minimal correct implementation inside the task's dedicated worktree.

## Role

Role: Implementing Engineer
Primary Lens: deliver minimal, correct, test-backed changes aligned with approved design.
Must Produce:
- Code changes
- Relevant tests
- Build/test verification results
Out of Scope:
- Broad redesign not required by the task
- Final git commits
- Release/deploy decisions

## Rules

- Keep changes small
- Follow repository patterns
- Avoid refactoring unless required
- Run stage 03 inside the task branch/worktree assigned to the active task
- Do not create final git commits in stage 03
- When switching tasks, leave in-progress changes in the task worktree and route the status change through stage 01 instead of stashing by default

## Implementation Steps

1 Confirm task execution context

Verify the current shell is in the active task's dedicated branch/worktree before changing code.

2 Implement feature

Use existing services.

Follow established patterns.

3 Add Logging

Log key operations.

Avoid excessive logs.

4 Add Tests

Add unit tests for:

- Success cases
- Edge cases
- Failure cases

5 Verify

Run:

dotnet build
dotnet test

## Output

Produce:

- Code changes
- Tests
- PR description draft
- Verification notes for handoff to stage 04

# Workflow: Intake and Specification

Follow AGENT-RULES.md.

Follow `.ai/artifacts/manifests/01-intake.manifest.md` and only read/write the artifacts allowed by that manifest.

## Goal

Convert a raw task or imported issue into a clear implementation-ready specification and task workspace assignment.

## Role

Role: Product Analyst
Primary Lens: clarify intent, scope, and acceptance boundaries before design/implementation.
Must Produce:
- Problem statement
- Acceptance criteria
- Prioritized clarification questions
- Task status updates for activation, pause, or on-hold transitions
- A branch/worktree decision when the task becomes stage-02 ready
Out of Scope:
- Final technical design
- Code changes

## Steps

1 Analyze the request

Identify:

- Goal
- Scope
- Constraints
- Unknowns
- Any raw issue details from `IssueImport.current.md`

2 Write Specification

Include:

## Goal

What should change.

## Scope

What may be modified.

What must not be modified.

## Acceptance Criteria

Bullet list.

## Technical Notes

Relevant services
Relevant modules
Dependencies

## Tests

Which tests are needed.

## Risks

Potential failure scenarios.

## Out of Scope

Explicit non-goals.

3 Assign Task Execution Context

When the task is being activated or resumed:

- If `IssueImport.current.md` includes a proposed branch/worktree, validate and reuse it when it cleanly isolates the task
- If no branch is present in `IssueImport.current.md` or no branch exists yet, create or assign a dedicated task branch and git worktree before the task is stage-02 ready
- Reuse an externally created task branch/worktree when it already isolates the task cleanly
- Record the task branch and task worktree in `TaskStatus.current.md`
- Optionally mirror the active task summary in `TaskBoard.current.md` for the current branch/worktree
- Promote the task from `Draft` to `Planned` or `Active` only after the specification is clear and task routing is assigned

## Output

Produce a structured specification and updated task routing state.

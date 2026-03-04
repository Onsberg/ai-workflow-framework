# Workflow: Intake and Specification

Follow AGENT-RULES.md.

Follow `.ai/artifacts/manifests/01-intake.manifest.md` and only read/write the artifacts allowed by that manifest.

## Goal

Convert a raw task request into a normalized intake record, then into a clear implementation-ready specification and task workspace assignment.

## Role

Role: Product Analyst
Primary Lens: clarify intent, scope, and acceptance boundaries before design/implementation.
Must Produce:
- A normalized intake record
- Problem statement
- Acceptance criteria
- Prioritized clarification questions
- Task status updates for activation, pause, or on-hold transitions
- A branch/worktree decision when the task becomes stage-02 ready
Out of Scope:
- Final technical design
- Code changes

## Steps

1 Create or validate the task workspace

For a new task:

- Create `.ai/artifacts/tasks/<task-id>/` if it does not already exist
- Create `current/` and `logs/` inside that task folder if they do not already exist
- Create `current/Intake.current.md` from `.ai/artifacts/templates/Intake.template.md` if it does not already exist
- Create `logs/RunHistory.log.md` from `.ai/artifacts/templates/RunHistory.template.md` if it does not already exist, then append a dated stage-01 intake entry

For an existing task:

- Verify the task folder still contains both `current/` and `logs/`
- Create any missing `Intake.current.md` or `RunHistory.log.md` artifacts before continuing

2 Normalize the intake source

- If `current/Intake.current.md` already exists, load it as the raw intake record
- If the task started from an external tracker or imported issue, populate `current/Intake.current.md` from that source without converting it into implementation-ready language
- If the task started in chat, populate `current/Intake.current.md` from the user's request and any follow-up answers already provided
- Mark unknown or ambiguous details explicitly in the intake record instead of inventing them

3 Verify intake completeness and ask questions

Apply these intake completeness rules:

### Required To Create `Intake.current.md`

- A provisional task title
- The raw request text or a faithful summary
- The source channel
- The capture date

### Required To Complete Stage 01

- A stable task summary suitable for task id creation
- A clear goal
- Scope boundaries or explicitly documented scope uncertainty
- Acceptance criteria that are materially sufficient for planning, or explicitly documented acceptance gaps
- Known constraints and dependencies, or an explicit `None known`
- Enough routing information to either assign branch/worktree now or justify keeping the task in `Draft`

### Optional But Useful

- Priority
- Labels
- Initial task breakdown
- External ID and source URL
- Proposed branch and worktree
- User-supplied implementation hints

Rule:

- Fields may be unknown, but they must not be silently omitted; record unknown values as `TBD`, `Unknown`, `None`, or in `Known Unknowns`

Before writing the final specification, verify that the intake record is complete enough to support:

- A stable task summary and task id
- A clear goal
- Scope boundaries
- Acceptance criteria or clearly identified acceptance gaps
- Known constraints and dependencies
- A branch/worktree decision or an explicit reason to remain `Draft`

If blocking information is missing or ambiguous:

- Ask the user a short set of prioritized clarification questions
- Create `current/TaskStatus.current.md` from `.ai/artifacts/templates/TaskStatus.template.md` if it does not already exist, then record those open questions in `current/Intake.current.md` and `current/TaskStatus.current.md`
- Keep the task in `Draft` until the blocking questions are resolved
- Update `current/Intake.current.md` with the user's answers before continuing

Promotion rule:

- Do not promote the task to `Planned` or `Active` until the "Required To Complete Stage 01" information is materially satisfied

4 Create or refresh stage-01 snapshots

- Create `current/TaskStatus.current.md` from `.ai/artifacts/templates/TaskStatus.template.md` if it does not already exist
- Create `current/Spec.current.md` from `.ai/artifacts/templates/Spec.template.md` if it does not already exist
- Update both files from the verified intake record

5 Analyze the request

Identify:

- Goal
- Scope
- Constraints
- Unknowns
- Any raw intake details from `Intake.current.md`

6 Write Specification

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

7 Assign Task Execution Context

When the task is being activated or resumed:

- If `Intake.current.md` includes a proposed branch/worktree, validate and reuse it when it cleanly isolates the task
- If no branch is present in `Intake.current.md` or no branch exists yet, create or assign a dedicated task branch and git worktree before the task is stage-02 ready
- Reuse an externally created task branch/worktree when it already isolates the task cleanly
- Record the task branch and task worktree in `TaskStatus.current.md`
- Promote the task from `Draft` to `Planned` or `Active` only after the specification is clear and task routing is assigned

## Output

Produce:

- A task workspace with the required stage-01 folders and files in place
- A normalized `Intake.current.md` record
- A structured specification
- Updated task routing state
- A `RunHistory.log.md` entry for the intake run

# Stage Manifest: Intake and Specification

## Stage

- Stage ID: `01`
- Owner: `Product Analyst`
- Workflow: `.ai/workflows/01-intake-and-spec.md`

## Required Inputs

- `.ai/AGENT-RULES.md`
- `.ai/artifacts/current/TaskBoard.current.md`

## Optional Inputs

- User request
- Relevant existing task folder if the task is being resumed

## Allowed Snapshot Outputs

- `tasks/<task-id>/current/TaskStatus.current.md`
- `tasks/<task-id>/current/Spec.current.md`
- `.ai/artifacts/current/TaskBoard.current.md`

## Allowed Log Outputs

- `tasks/<task-id>/logs/RunHistory.log.md`

## Forbidden Writes

- `Architecture.current.md`
- `Plan.current.md`
- `QualityGate.current.md`
- `ReleasePlan.current.md`
- `Operations.current.md`

## Entry Criteria

- A new request exists, or an existing task needs scope clarification.

## Exit Criteria

- The task is listed on the task board.
- The task has a `TaskStatus.current.md`.
- The task has a clear `Spec.current.md`.
- Open questions are explicit.

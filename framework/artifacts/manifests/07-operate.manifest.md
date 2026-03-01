# Stage Manifest: Operate and Improve

## Stage

- Stage ID: `07`
- Owner: `SRE / Operations Engineer`
- Workflow: `.ai/workflows/07-operate-and-improve.md`

## Required Inputs

- `.ai/AGENT-RULES.md`
- `.ai/artifacts/current/TaskBoard.current.md`
- `tasks/<task-id>/current/TaskStatus.current.md`
- `tasks/<task-id>/current/Spec.current.md`

## Optional Inputs

- `tasks/<task-id>/current/ReleasePlan.current.md`
- `tasks/<task-id>/logs/RunHistory.log.md`
- `tasks/<task-id>/logs/Failures.log.md`
- `tasks/<task-id>/logs/ReviewResults.log.md`

## Allowed Snapshot Outputs

- `tasks/<task-id>/current/Operations.current.md`
- `tasks/<task-id>/current/TaskStatus.current.md`

## Allowed Log Outputs

- `tasks/<task-id>/logs/Failures.log.md`
- `tasks/<task-id>/logs/RunHistory.log.md`

## Forbidden Writes

- `Spec.current.md`
- `Architecture.current.md`
- `Plan.current.md`
- `QualityGate.current.md`
- `ReleasePlan.current.md`
- `.ai/artifacts/current/TaskBoard.current.md`

## Entry Criteria

- The task has been released, deployed, or otherwise observed in operation.

## Exit Criteria

- Operational learnings are captured.
- Improvement actions are explicit.
- Task status reflects the operational state.

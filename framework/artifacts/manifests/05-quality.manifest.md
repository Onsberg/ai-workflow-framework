# Stage Manifest: Quality and Pull Request

## Stage

- Stage ID: `05`
- Owner: `Code Reviewer`
- Workflow: `.ai/workflows/05-quality-and-pr.md`

## Required Inputs

- `.ai/AGENT-RULES.md`
- `tasks/<task-id>/current/TaskStatus.current.md`
- `tasks/<task-id>/current/Spec.current.md`
- `tasks/<task-id>/current/Architecture.current.md`
- `tasks/<task-id>/current/Plan.current.md`

## Optional Inputs

- `tasks/<task-id>/logs/RunHistory.log.md`
- `tasks/<task-id>/logs/Failures.log.md`

## Allowed Snapshot Outputs

- `tasks/<task-id>/current/QualityGate.current.md`
- `tasks/<task-id>/current/TaskStatus.current.md`

## Allowed Log Outputs

- `tasks/<task-id>/logs/ReviewResults.log.md`
- `tasks/<task-id>/logs/RunHistory.log.md`

## Forbidden Writes

- `Spec.current.md`
- `Architecture.current.md`
- `Plan.current.md`
- `ReleasePlan.current.md`
- `Operations.current.md`

## Entry Criteria

- Implementation is complete enough for review.

## Exit Criteria

- Findings are recorded in `ReviewResults.log.md`.
- Quality gate status is explicit.
- `ReviewResults.log.md` exists for the task.
- `RunHistory.log.md` includes a stage-05 entry for the current run.
- Task status reflects the review outcome.

# Stage Manifest: Branch and Commit

## Stage

- Stage ID: `04`
- Owner: `Version Control Steward`
- Workflow: `.ai/workflows/04-branch-and-commit.md`

## Required Inputs

- `.ai/AGENT-RULES.md`
- `.ai/artifacts/current/TaskBoard.current.md`
- `tasks/<task-id>/current/TaskStatus.current.md`
- `tasks/<task-id>/current/Spec.current.md`
- `tasks/<task-id>/current/Plan.current.md`

## Optional Inputs

- `tasks/<task-id>/logs/RunHistory.log.md`

## Allowed Snapshot Outputs

- None

## Allowed Log Outputs

- `tasks/<task-id>/logs/RunHistory.log.md`

## Forbidden Writes

- Any `*.current.md` artifact

## Entry Criteria

- Implementation work is ready to be committed.

## Exit Criteria

- Commit metadata is recorded in the run history.
- The commit scope matches the approved plan.

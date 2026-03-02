# Stage Manifest: Commit

## Stage

- Stage ID: `04`
- Owner: `Version Control Steward`
- Workflow: `.ai/workflows/04-commit.md`

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
- The working branch and git worktree are dedicated to the active task, whether created by the framework or reused from an external system.
- The commit scope matches the approved plan.
- Completed plan subtasks are reflected as one focused commit each unless a documented split was required.

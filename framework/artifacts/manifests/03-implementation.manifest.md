# Stage Manifest: Implementation

## Stage

- Stage ID: `03`
- Owner: `Implementing Engineer`
- Workflow: `.ai/workflows/03-implementation.md`

## Required Inputs

- `.ai/AGENT-RULES.md`
- `tasks/<task-id>/current/TaskStatus.current.md`
- `tasks/<task-id>/current/Spec.current.md`
- `tasks/<task-id>/current/Architecture.current.md`
- `tasks/<task-id>/current/Plan.current.md`

## Optional Inputs

- Targeted excerpts from `Decisions.log.md`

## Allowed Snapshot Outputs

- None

## Allowed Log Outputs

- `tasks/<task-id>/logs/RunHistory.log.md`
- `tasks/<task-id>/logs/Failures.log.md`

## Forbidden Writes

- Any `*.current.md` artifact

## Entry Criteria

- The task is active.
- Design artifacts exist.
- The task has a dedicated branch and git worktree recorded in `TaskStatus.current.md`.
- The task is no longer in `Draft`.

## Exit Criteria

- Code changes are implemented.
- Tests are added or updated where relevant.
- Verification results are recorded in the run history.
- No final commit is required yet; the task remains ready for stage 04 on the same task branch/worktree.

## Notes

- Implementation changes code, not design snapshots.
- Implementation keeps uncommitted work in the task worktree until stage 04 commits it.
- If implementation reveals a design gap, record it and route back to stage 02.

# Stage Manifest: Discovery and Design

## Stage

- Stage ID: `02`
- Owner: `System Architect`
- Workflow: `.ai/workflows/02-discovery-and-design.md`

## Required Inputs

- `.ai/AGENT-RULES.md`
- `tasks/<task-id>/current/TaskStatus.current.md`
- `tasks/<task-id>/current/Spec.current.md`

## Optional Inputs

- Existing implementation patterns from the repository
- Targeted log excerpts from `Decisions.log.md` or `Failures.log.md` if needed

## Allowed Snapshot Outputs

- `tasks/<task-id>/current/Architecture.current.md`
- `tasks/<task-id>/current/Plan.current.md`

## Allowed Log Outputs

- `tasks/<task-id>/logs/Decisions.log.md`
- `tasks/<task-id>/logs/RunHistory.log.md`

## Forbidden Writes

- `Spec.current.md`
- `QualityGate.current.md`
- `ReleasePlan.current.md`
- `Operations.current.md`

## Entry Criteria

- The task is active.
- `Spec.current.md` exists and is usable.

## Exit Criteria

- A minimal architecture is documented.
- The implementation plan is explicit.
- Risks and open questions are recorded.

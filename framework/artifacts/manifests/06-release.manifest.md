# Stage Manifest: Release and Deploy

## Stage

- Stage ID: `06`
- Owner: `Release Engineer`
- Workflow: `.ai/workflows/06-release-and-deploy.md`
- Scope: `Optional downstream extension after the core task delivery lifecycle`

## Required Inputs

- `.ai/AGENT-RULES.md`
- `tasks/<task-id>/current/TaskStatus.current.md`
- `tasks/<task-id>/current/Spec.current.md`
- `tasks/<task-id>/current/QualityGate.current.md`

## Optional Inputs

- `tasks/<task-id>/logs/ReviewResults.log.md`
- `tasks/<task-id>/logs/RunHistory.log.md`

## Allowed Snapshot Outputs

- `tasks/<task-id>/current/ReleasePlan.current.md`
- `tasks/<task-id>/current/TaskStatus.current.md`

## Allowed Log Outputs

- `tasks/<task-id>/logs/RunHistory.log.md`

## Forbidden Writes

- `Spec.current.md`
- `Architecture.current.md`
- `Plan.current.md`
- `QualityGate.current.md`
- `Operations.current.md`

## Entry Criteria

- The quality gate is approved or explicitly accepted with risk.
- The consuming repository has chosen to keep release/deploy work inside this framework.

## Exit Criteria

- Release notes exist.
- Deployment and validation steps exist.
- Task status reflects release readiness or release completion.

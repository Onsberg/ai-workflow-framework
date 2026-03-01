# Task Workspaces

Create one folder per task:

- `.ai/artifacts/tasks/<task-id>/`

Each task folder should contain:

```text
<task-id>/
  current/
    TaskStatus.current.md
    Spec.current.md
    Architecture.current.md
    Plan.current.md
    QualityGate.current.md
    ReleasePlan.current.md
    Operations.current.md
  logs/
    Decisions.log.md
    RunHistory.log.md
    ReviewResults.log.md
    Failures.log.md
```

## Rules

- `current/` holds the latest authoritative state for that task.
- `logs/` is append-only history for that task.
- Create only the artifacts needed for the current lifecycle stage.
- Use the templates in `.ai/artifacts/templates/` when creating new snapshot artifacts.
- A starter scaffold is included at `.ai/artifacts/tasks/YYYYMMDD-your-first-task/`; rename it before use.

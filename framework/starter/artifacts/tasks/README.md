# Task Workspaces

Create one folder per task:

- `.ai/artifacts/tasks/<task-id>/`

Each task folder should contain:

```text
<task-id>/
  current/
    Intake.current.md
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
- `Intake.current.md` is the normalized raw intake record used for both chat-first and external-system intake before stage 01 completes.
- Use the templates in `.ai/artifacts/templates/` when creating new snapshot or log artifacts.
- Create the first real task folder during stage 01 intake; the framework does not pre-seed live task folders during install.

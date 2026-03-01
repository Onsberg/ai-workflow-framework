# Consuming Repo Layout

Use this layout in repositories that consume the framework.

```text
<solution-root>/
  .ai/
    AGENT-RULES.md
    workflows/
    artifacts/
      README.md
      current/
        TaskBoard.current.md
      manifests/
      tasks/
        README.md
        <task-id>/
          current/
          logs/
      templates/
```

## Ownership Split

Shared from framework repo:

- `workflows/`
- `artifacts/README.md`
- `artifacts/manifests/`
- `artifacts/templates/`
- starter examples and scaffolds

Owned by consuming repo:

- `AGENT-RULES.md`
- `artifacts/current/TaskBoard.current.md`
- `artifacts/tasks/`

This split keeps reusable process assets versioned centrally while preserving repository-specific state locally.

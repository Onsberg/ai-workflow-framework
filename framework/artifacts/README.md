# Artifact Workflow Contract

This folder defines the deterministic artifact contract for AI-assisted work in this repository.

## Design Goals

- Keep workflow stages mostly stateless.
- Reconstruct context from selected artifacts, not chat history.
- Separate active task state from historical evidence.
- Keep task artifacts isolated from one another.

## Layout

```text
.ai/artifacts/
  current/
    TaskBoard.current.md
  manifests/
    01-intake.manifest.md
    02-design.manifest.md
    03-implementation.manifest.md
    04-commit.manifest.md
    05-quality.manifest.md
    06-release.manifest.md
    07-operate.manifest.md
  tasks/
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
  templates/
    *.template.md
```

## Artifact Types

### Global Snapshot

- `current/TaskBoard.current.md`
- Purpose: list planned tasks, show the active task, and point to task folders.
- Scope: repository-wide queue and active-task pointer.
- Update style: replace in full.

### Task Snapshots

- `tasks/<task-id>/current/*.current.md`
- Purpose: authoritative current state for one task.
- Scope: one task only.
- Update style: replace in full.

### Task Logs

- `tasks/<task-id>/logs/*.log.md`
- Purpose: append-only evidence and traceability.
- Scope: one task only.
- Update style: append only.

## Ownership Model

Snapshot artifacts use single-writer ownership. Only the owning stage may replace a snapshot artifact.

- `TaskBoard.current.md`: Intake
- `TaskStatus.current.md`: Intake
- `Spec.current.md`: Intake
- `Architecture.current.md`: Discovery and Design
- `Plan.current.md`: Discovery and Design
- `QualityGate.current.md`: Quality and PR
- `ReleasePlan.current.md`: Release and Deploy
- `Operations.current.md`: Operate and Improve

Stages that do not own a snapshot may reference it, but should not replace it.

## Context Loading Rules

Each stage must load:

- `.ai/AGENT-RULES.md`
- the matching workflow document in `.ai/workflows/`
- the matching manifest in `.ai/artifacts/manifests/`
- only the task artifacts listed by that manifest

Do not load task logs by default. Load logs only when the manifest explicitly allows it and only the minimum needed section.

## Task Lifecycle

Task workspaces are retained indefinitely.

States:

- `Planned`: listed in `TaskBoard.current.md`, task may exist with partial artifacts.
- `Active`: the current task pointer references this task.
- `Completed`: implementation and quality work is complete; task snapshots are final unless reopened.
- `Archived`: reserved for future use if compaction is introduced.

Completed tasks are not deleted automatically.

## Task IDs

Task IDs should be short, stable, and sortable.

Recommended format:

- `YYYYMMDD-<short-slug>`

Example:

- `20260301-artifact-workflow`

## Mutability Rules

- Replace snapshot artifacts atomically as complete documents.
- Append logs with dated entries; do not rewrite prior entries except to correct obvious formatting issues.
- If a later stage discovers an upstream issue, write the issue to the relevant log and route the task back to the owning stage instead of overwriting the upstream snapshot.

## Precedence Rules

When artifacts overlap, precedence is:

1. `.ai/AGENT-RULES.md`
2. Stage manifest
3. Task snapshot owned by the current stage's upstream dependency
4. Task logs

If two snapshots conflict, the upstream owner's snapshot wins until that owner updates it.

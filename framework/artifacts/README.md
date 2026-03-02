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
  templates/
    *.template.md
```

## Artifact Types

### Global Snapshot

- `current/TaskBoard.current.md`
- Purpose: provide a lightweight local summary of the current task context and an optional completion log.
- Scope: current branch/worktree summary, not a repository-wide queue.
- Update style: replace in full.

### Task Snapshots

- `tasks/<task-id>/current/*.current.md`
- Purpose: authoritative current state for one task.
- Scope: one task only.
- Update style: replace in full.

Typical examples:

- `Intake.current.md`: normalized raw intake record, created or updated during stage 01 for both chat-first and external-system intake.
- `Spec.current.md`: implementation-ready specification produced by stage 01.

### Task Logs

- `tasks/<task-id>/logs/*.log.md`
- Purpose: append-only evidence and traceability.
- Scope: one task only.
- Update style: append only.

## Ownership Model

Snapshot artifacts use single-writer ownership unless a specific artifact explicitly allows a later lifecycle append/update.

- `TaskBoard.current.md`: Intake (for the local active-task summary) and Operate (for completed-task log updates)
- `TaskStatus.current.md`: Intake (including task branch/worktree assignment and draft-to-planned promotion)
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

## Task Delivery Lifecycle

Task workspaces are retained indefinitely.

States:

- `Draft`: task shell exists and may include a raw intake record, but stage 01 has not produced an implementation-ready spec yet.
- `Planned`: stage 01 is complete, but the task is not currently being worked.
- `Active`: the task is currently being worked in its branch/worktree.
- `Paused`: work is intentionally deferred, but the task can be resumed immediately without waiting for an external blocker to clear. The task should retain its branch/worktree.
- `On Hold`: work is intentionally deferred because a named blocker, dependency, or decision must be resolved before the task can continue.
- `Completed`: implementation and quality work is complete; task snapshots are final unless reopened.
- `Archived`: reserved for future use if compaction is introduced.

Completed tasks are not deleted automatically.

By default, the task delivery lifecycle is considered complete at the end of stage 05 when the task is merged to `main` or is otherwise approved and ready to merge.

Stages 06 and 07 are optional downstream extensions for teams that intentionally track release, deployment, or operational follow-up inside the repository.

Status decision rule:

- Use `Paused` when the team could resume the task now but is choosing to work on something else.
- Use `On Hold` when the team cannot proceed responsibly until a blocker is resolved.

## Parallel Task Execution

The preferred task-switching model is one task branch plus one git worktree per in-progress task.

- Create or reuse a dedicated branch/worktree during stage 01 before the task becomes stage-02 ready.
- Switch tasks by moving to the other task's worktree and updating the task status for that task.
- Do not rely on anonymous `git stash` entries as the normal task-switch mechanism.

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

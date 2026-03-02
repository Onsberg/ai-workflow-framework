# Usage

This guide explains how to use `ai-workflow-framework` after it has been installed into a repository.

## Operating Model

The framework is stage-based. Each stage should:

- load `.ai/AGENT-RULES.md`
- load the matching workflow document
- load the matching manifest
- read only the artifacts allowed by that manifest
- write only the artifacts allowed by that manifest

The intent is to keep task progress explicit, deterministic, and file-driven across the task delivery lifecycle.

Branching and commits follow the same model:

- `Draft` tasks may be imported with raw issue data before stage 01
- one task that is ready for stage 02 should already have one task branch and one git worktree
- one completed plan subtask should normally map to one commit
- externally created task branches/worktrees may be reused when they already isolate the active task
- stage 03 keeps uncommitted work in the task worktree; stage 04 turns completed subtasks into commits

## Core Lifecycle

Use the core task delivery stages in this order:

1. `01-intake-and-spec.md`
2. `02-discovery-and-design.md`
3. `03-implementation.md`
4. `04-commit.md`
5. `05-quality-and-pr.md`

For most teams, the workflow ends here when the task is merged to `main` or is otherwise approved and ready to merge.

## Optional Extensions

If a consuming repository intentionally keeps release and operational follow-up in repo-local artifacts, continue with:

6. `06-release-and-deploy.md`
7. `07-operate-and-improve.md`

Each stage has a matching manifest that defines what context it may read and what artifacts it may write.

## Starting A New Task

1. Create a new folder at `.ai/artifacts/tasks/<task-id>/`
2. Add `current/` and `logs/` beneath that folder
3. If the task comes from an external issue tool, create `current/IssueImport.current.md` from `.ai/artifacts/templates/IssueImport.template.md`
4. Create the initial stage-01 snapshots from `.ai/artifacts/templates/`
5. Begin with stage 01
6. During stage 01, create or confirm the task branch and git worktree before the task advances to stage 02
7. Optionally update `.ai/artifacts/current/TaskBoard.current.md` to mirror the local branch/worktree summary
8. Move the task from `Draft` to `Planned` or `Active`

## Switching Tasks

The preferred task-switching model is `git worktree`, not `git stash`.

- Leave each in-progress task on its own branch/worktree.
- Switch tasks by moving to the other task's worktree and updating the relevant `TaskStatus.current.md`.
- Mark a task `Paused` when work is parked by choice and can be resumed immediately.
- Mark a task `On Hold` when an explicit blocker, dependency, or decision prevents further work.
- Avoid anonymous stashes except as a short-lived emergency fallback.
- A `Draft` task may already have a reserved branch, but it still cannot skip stage 01.

Use this quick test:

- If the task could resume right now, use `Paused`.
- If the task cannot proceed until something else changes, use `On Hold`.

## Artifact Ownership

The framework relies on snapshot ownership by stage.

In practice:

- only the owning stage should replace a `*.current.md` snapshot
- task logs should be append-only
- later stages should not overwrite upstream design artifacts unless the workflow explicitly routes back

This prevents stage drift and keeps state transitions auditable.

## Updating The Framework

When the shared framework repository changes:

1. Pull the latest framework changes
2. Re-run the install or sync script against the consuming repository
3. Review changes to:
   - `.ai/workflows/`
   - `.ai/artifacts/manifests/`
   - `.ai/artifacts/templates/`
4. Avoid overwriting active task state unless that is intentional

## What Stays Local

These files belong to each consuming repository and should not be treated as shared framework assets:

- `.ai/AGENT-RULES.md`
- `.ai/artifacts/current/TaskBoard.current.md`
- `.ai/artifacts/tasks/<task-id>/current/*`
- `.ai/artifacts/tasks/<task-id>/logs/*`

`TaskBoard.current.md` is now only a lightweight local summary and completion log; `TaskStatus.current.md` is the authoritative task-state source.

## Common Mistakes

- Treating task logs as reusable framework content
- Storing live task state in the shared framework repository
- Updating workflow docs without updating matching manifests
- Replacing a `*.current.md` artifact from the wrong stage
- Letting copied framework files drift without a documented update path
- Mixing multiple active tasks on one branch
- Switching tasks by stashing instead of using the task's dedicated worktree
- Creating commits that span multiple unrelated subtasks

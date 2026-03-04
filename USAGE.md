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

- `Draft` tasks may begin with a raw intake record before stage 01 is complete
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

Start with stage 01 and let the intake agent create the task workspace and normalize the raw request into `Intake.current.md`.

For chat-first intake:

1. Start on `main` and ask the agent to run stage 01 intake for a new task.
2. Provide the task goal, relevant constraints, and any known acceptance expectations.
3. Let the intake agent create the task folder, `Intake.current.md`, and `RunHistory.log.md` first.
4. Answer any blocking clarification questions the agent asks.
5. Let stage 01 finalize the remaining stage-01 artifacts, including `Spec.current.md`, `TaskStatus.current.md`, and task routing.

For existing raw intake:

1. Start with the existing task folder or existing raw intake details.
2. Ask the agent to run stage 01 intake and validate `Intake.current.md`.
3. Answer any blocking clarification questions the agent asks.
4. Let stage 01 finalize `Spec.current.md`, `TaskStatus.current.md`, and task routing.

The user should not manually scaffold task folders or stage-01 artifacts as a normal operating step.

### Intake Completeness Rules

Required to create `Intake.current.md`:

- A provisional task title
- The raw request text or a faithful summary
- The source channel
- The capture date

Required to complete stage 01:

- A stable task summary suitable for task id creation
- A clear goal
- Scope boundaries or explicit scope uncertainty
- Acceptance criteria that are materially sufficient for planning, or explicit acceptance gaps
- Known constraints and dependencies, or an explicit `None known`
- Enough routing information to assign branch/worktree now or keep the task in `Draft` for a named reason

Optional but useful:

- Priority
- Labels
- Initial task breakdown
- External ID and source URL
- Proposed branch and worktree
- Implementation hints from the user

Fields may be unknown, but they should not be silently omitted. Use `TBD`, `Unknown`, `None`, or `Known Unknowns` instead.

### Chat Intake Examples

Example 1:

```text
Run stage 01 intake for a new task.

Use `.ai/AGENT-RULES.md`, `.ai/workflows/01-intake-and-spec.md`, and `.ai/artifacts/manifests/01-intake.manifest.md`.

Create a task for: add CSV export to the customer list page.

Known constraints:
- Reuse the existing export service if possible.
- Do not change the API contract unless necessary.

Desired outcome:
- Users can export the currently filtered customer list to CSV from the UI.

If required information is missing, create `Intake.current.md`, record what is known, and ask me the blocking questions before finalizing the spec.
```

Example 2:

```text
Run stage 01 intake for a new task from chat.

Create a normalized `Intake.current.md` first, then verify it for missing or ambiguous information.

Task request:
- We need to reduce login failures after the recent auth changes.
- I suspect the issue is around token refresh timing.
- I do not yet know whether this will need frontend, backend, or both.

Ask me the minimum blocking questions needed before you finalize `Spec.current.md` or assign task routing.
```

Example 3:

```text
Run stage 01 intake for an externally sourced task.

Use the existing task folder and create or update `Intake.current.md` from the imported tracker details.
Validate the intake record, ask me any blocking questions, then finish the normal stage-01 intake flow.
```

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
- `.ai/artifacts/tasks/<task-id>/current/*`
- `.ai/artifacts/tasks/<task-id>/logs/*`

## Common Mistakes

- Treating task logs as reusable framework content
- Storing live task state in the shared framework repository
- Updating workflow docs without updating matching manifests
- Replacing a `*.current.md` artifact from the wrong stage
- Letting copied framework files drift without a documented update path
- Mixing multiple active tasks on one branch
- Switching tasks by stashing instead of using the task's dedicated worktree
- Creating commits that span multiple unrelated subtasks

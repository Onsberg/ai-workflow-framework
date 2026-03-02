# Task Board

## Active Task

- Task ID: `None`
- Status: `Idle`
- Task Folder: `None`
- Task Branch: `None`
- Task Worktree: `None`
- Summary: `No active task. Create a task during stage 01 intake when ready.`

## Completed Tasks

Use this section as the lightweight completion log for this branch/worktree context.

| Task ID | Completed On | Summary | Task Folder |
| --- | --- | --- | --- |

## Starter Notes

- Create the first real task folder during stage 01 intake.
- When the task is ready, replace this file in full and point the active task to that task folder.

## Rules

- This file is a lightweight local summary, not a repository-wide queue.
- It may mirror the active task for the current branch/worktree and record completed tasks.
- It does not authoritatively track draft, planned, paused, or on-hold tasks across branches.
- The active task must have a matching folder under `.ai/artifacts/tasks/`.
- Task-local `TaskStatus.current.md` remains the source of truth for task state.

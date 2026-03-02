# Intake Record

Use this file as the normalized raw intake artifact for every new task.

## Source

- Channel: `Chat` (`Chat`, `Jira`, `GitHub`, `Azure DevOps`, `Other`)
- External ID: `None` (`Optional`)
- URL: `None` (`Optional`)
- Captured On: `YYYY-MM-DD`

## Intake Summary

- Title: `Short task title`
- Status: `New`
- Priority: `TBD`
- Labels: `None`

## Raw Request

Paste or summarize the raw request here without converting it into implementation-ready language.

If the source is chat, capture the user's original request and any direct follow-up answers.

## Acceptance Notes

- Add any acceptance notes provided by the user or copied from an external system.

## Initial Task Breakdown

| Item ID | Summary | Description | Expected Commit |
| --- | --- | --- | --- |
| IT-01 |  |  | `One focused commit for this item` |

Use this section for imported subtasks or an initial decomposition captured during intake.

## Task Routing

- Proposed Branch: `feature/YYYYMMDD-short-slug` (`Optional`)
- Proposed Worktree: `%LOCALAPPDATA%\\ai-worktrees\\repo-task` (`Optional`)

## Clarifications

- Known Unknowns: `List missing or ambiguous facts that still need confirmation.`
- Blocking Questions: `List questions that must be answered before stage 01 can finish.`

## Notes

- This file is the raw intake record for the task.
- It does not replace `Spec.current.md`.
- For chat-first intake, populate this file from the conversation before drafting the final specification.
- For external-system intake, copy or summarize source details here before validating completeness.
- If routing fields are empty, stage 01 must decide whether to assign branch/worktree now or leave the task in `Draft`.
- Minimum fields to create this file: provisional title, raw request, source channel, and capture date.
- Stage 01 may keep the task in `Draft` if required planning information is still missing after normalization.

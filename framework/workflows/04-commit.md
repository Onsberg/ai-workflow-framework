# Workflow: Commit

Follow AGENT-RULES.md.

Follow `.ai/artifacts/manifests/04-commit.manifest.md` and only read/write the artifacts allowed by that manifest.

Use this workflow after implementation and before quality/PR.

## Goal

Create safe, task-scoped, review-ready git history.

## Role

Role: Version Control Steward
Primary Lens: maintain safe branching and clean, reviewable history with narrow commits.
Must Produce:
- Branch/worktree verification for the active task (including reason when repairing the task context)
- Focused commit set with quality messages
- Explicit mapping from plan subtask to commit
- Final git verification output
Out of Scope:
- Functional redesign
- Deploy/release execution

## Hard Rules

- Never commit directly to `main` or `master`.
- Never push forcefully.
- Never commit secrets, tokens, or credentials.
- Never include unrelated changes in the same commit.
- Each active task must resolve to one dedicated branch and git worktree before commits are created.
- Default commit strategy is one focused commit per completed plan subtask.

## Steps

1 Check task execution context

Run:

`git rev-parse --abbrev-ref HEAD`

Confirm the active task id, recorded task branch, and recorded task worktree from `TaskStatus.current.md`.

If the current shell is not in the recorded task worktree, switch into that worktree before proceeding.

2 Reuse or repair the task branch/worktree

Branch/worktree creation should normally already be complete from imported task routing or stage 01.

If an external system already created a branch/worktree for this task, reuse that context when it is already dedicated to the active task.

If the recorded task branch/worktree is missing, create or repair it before committing and record that as an exception to the normal intake-owned setup.

If the current branch is already a non-main branch clearly dedicated to the active task, stay on it.

If the current branch is `main` or `master`, or is not clearly dedicated to the active task, create a task branch or sub-branch before committing.
Example: `feature/war-sim` -> `bugfix/war-sim-table-auth`.
When doing this, the agent must state a short reason.

Branch type should match the change intent:

- `feature/<task-id>-<short-description>` for new functionality
- `bugfix/<task-id>-<short-description>` for defects
- `hotfix/<task-id>-<short-description>` for urgent production fixes
- `refactor/<task-id>-<short-description>` for internal code improvements
- `chore/<task-id>-<short-description>` for maintenance/tooling/config
- `docs/<task-id>-<short-description>` for documentation only
- `test/<task-id>-<short-description>` for test-only updates

If type is unclear, choose the safest minimal option and state the assumption.

3 Review staged content

Run:

`git status`
`git diff --staged`

Ensure commit scope is focused and coherent.

Compare the staged changes to `Plan.current.md` and identify which planned subtask or subtasks are complete.

3.1 Decide commit strategy (single vs multiple commits)

Actively evaluate whether changes should be split into multiple narrow commits.

Default rule: one completed subtask should produce one commit.

Create multiple commits when the plan contains multiple completed subtasks with separable concerns.

Create multiple commits when concerns are separable, for example:

- infrastructure vs application code
- behavior change vs refactor
- production code vs tests
- formatting/noise vs functional change

Prefer one commit only when all changes are tightly coupled and cannot be reviewed independently.

If one planned subtask became too large, split it into multiple commits only when each commit is still coherent and the split is recorded in the run history.

4 Commit with high-quality message

Use Conventional Commit style:

`<type>(<scope>): <short summary>`

Optional body should explain:

- what changed
- why it changed
- any migration or risk notes

Examples:

- `feat(war): add configurable deck dimensions`
- `fix(infra): add test-only local service bus queues`
- `chore(workflows): add environment-aware catalog generation`

For multiple commits, each commit message must describe only that commit's concern.

The commit summary should match the completed subtask summary as closely as possible.

5 Final verification

Run:

`git log -1 --stat`

Confirm commit contains only intended files.
Confirm the branch/worktree is task-scoped and the commit set matches the completed subtasks.

## Output

Produce:

- Branch name used
- Worktree path used
- Branch/worktree verification or repair reason
- Commit hash or hashes
- Commit message or messages
- Subtask-to-commit mapping
- Short summary of committed files

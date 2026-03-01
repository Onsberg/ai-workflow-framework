# Workflow: Branch and Commit

Follow AGENT-RULES.md.

Follow `.ai/artifacts/manifests/04-commit.manifest.md` and only read/write the artifacts allowed by that manifest.

Use this workflow after implementation and before quality/PR.

## Goal

Create safe, review-ready git commits.

## Role

Role: Version Control Steward
Primary Lens: maintain safe branching and clean, reviewable history with narrow commits.
Must Produce:
- Branch decision (including reason when creating sub-branch)
- Focused commit set with quality messages
- Final git verification output
Out of Scope:
- Functional redesign
- Deploy/release execution

## Hard Rules

- Never commit directly to `main` or `master`.
- Never push forcefully.
- Never commit secrets, tokens, or credentials.
- Never include unrelated changes in the same commit.

## Steps

1 Check current branch

Run:

`git rev-parse --abbrev-ref HEAD`

2 Create or select working branch

If current branch is `main` or `master`, create a new branch first.

Agent may also create a sub-branch from an existing non-main branch when it improves isolation/reviewability.
Example: `feature/war-sim` -> `bugfix/war-sim-table-auth`.
When doing this, the agent must state a short reason.

Branch type should match the change intent:

- `feature/<short-description>` for new functionality
- `bugfix/<short-description>` for defects
- `hotfix/<short-description>` for urgent production fixes
- `refactor/<short-description>` for internal code improvements
- `chore/<short-description>` for maintenance/tooling/config
- `docs/<short-description>` for documentation only
- `test/<short-description>` for test-only updates

If type is unclear, choose the safest minimal option and state the assumption.

3 Review staged content

Run:

`git status`
`git diff --staged`

Ensure commit scope is focused and coherent.

3.1 Decide commit strategy (single vs multiple commits)

Actively evaluate whether changes should be split into multiple narrow commits.

Create multiple commits when concerns are separable, for example:

- infrastructure vs application code
- behavior change vs refactor
- production code vs tests
- formatting/noise vs functional change

Prefer one commit only when all changes are tightly coupled and cannot be reviewed independently.

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

5 Final verification

Run:

`git log -1 --stat`

Confirm commit contains only intended files.

## Output

Produce:

- Branch name used/created
- Commit hash
- Commit message
- Short summary of committed files

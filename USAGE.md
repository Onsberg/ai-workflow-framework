# Usage

This guide explains how to use `ai-workflow-framework` after it has been installed into a repository.

## Operating Model

The framework is stage-based. Each stage should:

- load `.ai/AGENT-RULES.md`
- load the matching workflow document
- load the matching manifest
- read only the artifacts allowed by that manifest
- write only the artifacts allowed by that manifest

The intent is to keep task progress explicit, deterministic, and file-driven.

## Workflow Stages

Use the workflow stages in this order:

1. `01-intake-and-spec.md`
2. `02-discovery-and-design.md`
3. `03-implementation.md`
4. `04-branch-and-commit.md`
5. `05-quality-and-pr.md`
6. `06-release-and-deploy.md`
7. `07-operate-and-improve.md`

Each stage has a matching manifest that defines what context it may read and what artifacts it may write.

## Starting A New Task

1. Create a new folder at `.ai/artifacts/tasks/<task-id>/`
2. Add `current/` and `logs/` beneath that folder
3. Create the initial stage-01 snapshots from `.ai/artifacts/templates/`
4. Update `.ai/artifacts/current/TaskBoard.current.md`
5. Mark the task `Active`
6. Begin with stage 01

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

## Common Mistakes

- Treating task logs as reusable framework content
- Storing live task state in the shared framework repository
- Updating workflow docs without updating matching manifests
- Replacing a `*.current.md` artifact from the wrong stage
- Letting copied framework files drift without a documented update path

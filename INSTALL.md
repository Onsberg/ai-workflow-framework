# Install

This guide explains how to install `ai-workflow-framework` into a consuming repository.

## Recommended Model

Use this repository as the shared source of workflow assets, then copy those assets into each consuming repository.

This keeps the framework centralized and versioned while avoiding the operational friction of Git submodules.

## Target Layout

After installation, the consuming repository should contain:

```text
.ai/
  AGENT-RULES.md
  workflows/
  artifacts/
    README.md
    current/
      TaskBoard.current.md
    manifests/
    tasks/
    templates/
```

## Install With The Script

Run the installer from this repository:

```powershell
.\scripts\install-framework.ps1 -TargetRepoPath C:\src\MySolution
```

The installer will:

- copy shared workflow files into the target repository
- copy artifact manifests and templates
- create a clean starter `TaskBoard.current.md` only if one does not already exist
- create a placeholder `.ai/AGENT-RULES.md` only if the target repository does not have one
- leave existing task folders under `.ai/artifacts/tasks/` unchanged
- preserve existing local state files instead of resetting them during updates

## Manual Install

If you do not want to use the script, copy these paths into the target repository:

1. `framework/workflows/` to `.ai/workflows/`
2. `framework/artifacts/README.md` to `.ai/artifacts/README.md`
3. `framework/artifacts/manifests/` to `.ai/artifacts/manifests/`
4. `framework/artifacts/templates/` to `.ai/artifacts/templates/`
5. `framework/starter/artifacts/current/TaskBoard.current.md` to `.ai/artifacts/current/TaskBoard.current.md`
6. `framework/starter/artifacts/tasks/README.md` to `.ai/artifacts/tasks/README.md`

Then create or adapt `.ai/AGENT-RULES.md` for the consuming repository.

When updating an existing consuming repository, do not overwrite:

1. `.ai/AGENT-RULES.md`
2. `.ai/artifacts/current/TaskBoard.current.md`
3. `.ai/artifacts/tasks/<task-id>/`

These are local state and should be preserved.

## First-Time Setup In The Target Repository

After installation:

1. Update `.ai/AGENT-RULES.md` with repository-specific stack, build, test, and coding rules.
2. Start with `01-intake-and-spec.md`.

Example prompt to begin the core task delivery lifecycle:

```text
Run stage 01 intake for a new task.

Use `.ai/AGENT-RULES.md`, `.ai/workflows/01-intake-and-spec.md`, and `.ai/artifacts/manifests/01-intake.manifest.md`.

Create a new task for: <short task summary>

Create or update a normalized `Intake.current.md` first.
If information is missing, ask the blocking clarification questions before finalizing the spec.
Then complete the normal stage-01 intake flow, including task routing.
Do not start design yet.
```

## Submodule Option

If your team prefers a submodule model, add this repository as a submodule at `.ai/framework/`.

If you do that, keep these files local to the consuming repository:

- `.ai/AGENT-RULES.md`
- `.ai/artifacts/current/TaskBoard.current.md`
- `.ai/artifacts/tasks/`

Only the shared framework assets should come from the submodule.

## Install Checklist

- Workflow docs and manifests are copied together
- `.ai/AGENT-RULES.md` is repository-specific
- The first real task is created during stage 01, not pre-seeded by the framework
- Live task state stays in the consuming repository
- The shared framework repo is not used to store active task logs

# ai-workflow-framework

Reusable artifact-driven AI workflow framework for repositories with staged workflows, manifests, templates, and install tooling.

## What It Is

`ai-workflow-framework` provides a structured, reusable process for an AI-assisted task delivery lifecycle inside source repositories.

It standardizes how work moves through defined task-delivery stages such as intake, design, implementation, commit, and review, with optional downstream release/operations extensions, by using:

- stage-based workflow documents
- deterministic artifact manifests
- task and snapshot templates
- normalized intake scaffolding for chat-first and external-system requests
- starter scaffolding
- install and sync tooling

The goal is to make AI-assisted task delivery more consistent, reviewable, and portable across projects.

## Core Ideas

This framework is built around a few core principles:

- Artifacts over chat history: task state should be reconstructed from files, not conversation memory.
- Stage ownership: each workflow stage owns specific artifacts and should only update its allowed outputs.
- Deterministic context loading: each stage reads only the files declared by its manifest.
- Portable process: the same workflow structure can be reused across multiple repositories.
- Local task ownership: live task state stays in the consuming repository, not in the shared framework.
- Parallel task isolation: in-progress tasks should use dedicated git branches and worktrees.

## Repository Structure

```text
  framework/
    workflows/
    artifacts/
      README.md
      manifests/
      templates/
    starter/
      artifacts/
        tasks/
          README.md

scripts/
  install-framework.ps1

docs/
  consuming-repo-layout.md
```

## What This Repository Contains

- Shared workflow stage documents
- Artifact contract documentation
- Stage manifests
- Reusable task templates
- Starter task scaffolding
- Installation and update tooling
- Usage guidance for consuming repositories

## What This Repository Does Not Contain

This repository should not contain live task state for consuming projects.

Keep these in each consuming repository:

- `.ai/AGENT-RULES.md`
- `.ai/artifacts/tasks/<task-id>/current/*`
- `.ai/artifacts/tasks/<task-id>/logs/*`

## Recommended Usage Model

The preferred model is to use this repository as a shared framework source and copy or sync its reusable assets into each consuming repository.

This avoids Git submodule friction while preserving a versioned source of truth.

A submodule-based setup is possible, but it is usually best to keep only shared framework assets in the submodule and keep all live task state local to the consuming repository.

## Installation

Use the install script to copy the framework into a target repository:

```powershell
.\scripts\install-framework.ps1 -TargetRepoPath C:\src\MySolution
```

After installation:

1. Update `.ai/AGENT-RULES.md` for the target repository.
2. Start stage 01 intake from chat or from an existing raw intake record.
3. Let stage 01 create the task workspace and normalize the intake details.
4. Continue through the intake workflow.

See [INSTALL.md](./INSTALL.md) for setup details.

## Task Delivery Lifecycle

The framework defines a core task delivery lifecycle:

1. Intake and specification
2. Discovery and design
3. Implementation
4. Commit
5. Quality and pull request

For most teams, the framework's normal scope ends here when the task is merged to `main` or is otherwise approved and ready to merge.

## Optional Downstream Extensions

For repositories that intentionally keep release and operational follow-up inside repo-local artifacts, the framework also includes:

6. Release and deploy
7. Operate and improve

Each stage has:

- a workflow document
- a manifest describing required inputs
- explicit rules for allowed outputs

## Why Use It

This framework helps teams:

- reduce ambiguity in AI-assisted work
- keep task state explicit and auditable
- improve handoff quality between stages
- reuse a consistent workflow across repositories
- avoid over-reliance on transient chat context

## Documentation

- [INSTALL.md](./INSTALL.md)
- [USAGE.md](./USAGE.md)
- [consuming-repo-layout.md](./docs/consuming-repo-layout.md)

## License

This template is set up for the `MIT` license.

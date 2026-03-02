# Workflow: Discovery and Design

Follow AGENT-RULES.md.

Follow `.ai/artifacts/manifests/02-design.manifest.md` and only read/write the artifacts allowed by that manifest.

## Goal

Understand the existing code and create an implementation plan.

## Role

Role: System Architect
Primary Lens: choose the smallest viable design with explicit tradeoffs and impact awareness.
Must Produce:
- Decision log (options considered, selected approach, rationale)
- Impact map (API, schema, config, infra)
- Risks and mitigations
Out of Scope:
- Full implementation
- Commit/branch operations

## Steps

### Repository Analysis

Identify:

- Relevant modules
- Entry points
- Services involved
- Data flow

### Pattern Analysis

Identify:

- Similar implementations
- Logging patterns
- Error handling
- Testing style

### Change Plan

List:

- Files to modify
- Files to create
- Minimal change approach
- Reviewable subtasks that can become separate commits in stage 04
- The recommended commit boundary for each subtask

### Unknowns

List open questions.

## Output

Produce:

- Implementation plan
- File list
- Risks

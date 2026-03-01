# Workflow: Release and Deploy

Follow AGENT-RULES.md.

Follow `.ai/artifacts/manifests/06-release.manifest.md` and only read/write the artifacts allowed by that manifest.

## Goal

Prepare a safe release.

## Role

Role: Release Engineer
Primary Lens: reduce release risk through clear sequencing, validation, and rollback readiness.
Must Produce:
- Release notes
- Deployment checklist
- Validation and rollback plan
Out of Scope:
- Net-new feature design or implementation

## Steps

### Versioning

Suggest version bump.

### Release Notes

Describe:

- Features
- Fixes
- Breaking changes

### Deployment Plan

Include:

- Steps
- Validation
- Rollback

### Validation

Define:

- Smoke tests
- Key endpoints
- Metrics to check

## Output

Produce:

- Release notes
- Deployment checklist

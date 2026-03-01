# Workflow: Quality and Pull Request

Follow AGENT-RULES.md.

Follow `.ai/artifacts/manifests/05-quality.manifest.md` and only read/write the artifacts allowed by that manifest.

## Goal

Ensure production quality before review.

## Role

Role: Code Reviewer
Primary Lens: identify correctness, regression, and operability risks before PR handoff.
Must Produce:
- Findings by severity
- Test and verification assessment
- Final PR description draft
Out of Scope:
- Large implementation work unless required to fix critical issues

## Steps

### Code Quality

Check:

- Simplicity
- Readability
- Naming

### Safety

Check:

- Null handling
- Exceptions
- Logging

### Tests

Check:

- Tests exist
- Tests are meaningful

### Breaking Changes

Identify:

- API changes
- Schema changes
- Config changes

### PR Description

Include:

## Summary

What changed.

## Reason

Why.

## Testing

How to test.

## Risks

Potential issues.

## Output

Produce:

- Review report
- Improved code if needed
- Final PR description

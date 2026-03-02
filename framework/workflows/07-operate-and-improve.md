# Workflow: Operate and Improve

Follow AGENT-RULES.md.

Follow `.ai/artifacts/manifests/07-operate.manifest.md` and only read/write the artifacts allowed by that manifest.

This is an optional downstream extension. Use it only when the consuming repository intentionally keeps operational follow-up inside repo-local task artifacts.

## Goal

Improve system stability after deployment.

## Role

Role: SRE / Operations Engineer
Primary Lens: improve stability via monitoring quality, incident learning, and targeted improvements.
Must Produce:
- Stability report
- Prioritized improvement tasks
- Monitoring/alerting adjustments
- Completion-log update when the task is being closed
Out of Scope:
- Unscoped feature development

## Steps

### Monitoring

Identify:

- Important logs
- Metrics
- Alerts

### Issues

Analyze:

- Errors
- Failures
- Performance

### Improvements

Suggest:

- Refactors
- Tests
- Monitoring improvements

## Output

Produce:

- Stability report
- Improvement tasks
- Completed-task log update when applicable

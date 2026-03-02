param(
    [Parameter(Mandatory = $true)]
    [string]$TargetRepoPath
)

$ErrorActionPreference = "Stop"

function Copy-IfMissing {
    param(
        [Parameter(Mandatory = $true)]
        [string]$Source,
        [Parameter(Mandatory = $true)]
        [string]$Destination
    )

    if (-not (Test-Path $Destination)) {
        Copy-Item $Source $Destination
    }
}

$frameworkRoot = Split-Path -Parent $PSScriptRoot
$sourceRoot = Join-Path $frameworkRoot "framework"
$targetAiRoot = Join-Path $TargetRepoPath ".ai"

if (-not (Test-Path $TargetRepoPath)) {
    throw "Target repo path does not exist: $TargetRepoPath"
}

if (-not (Test-Path $targetAiRoot)) {
    New-Item -ItemType Directory -Path $targetAiRoot | Out-Null
}

$targetArtifactsRoot = Join-Path $targetAiRoot "artifacts"
$targetCurrentRoot = Join-Path $targetArtifactsRoot "current"
$targetManifestsRoot = Join-Path $targetArtifactsRoot "manifests"
$targetTasksRoot = Join-Path $targetArtifactsRoot "tasks"
$targetTemplatesRoot = Join-Path $targetArtifactsRoot "templates"
$targetWorkflowsRoot = Join-Path $targetAiRoot "workflows"

New-Item -ItemType Directory -Force -Path $targetArtifactsRoot, $targetCurrentRoot, $targetManifestsRoot, $targetTasksRoot, $targetTemplatesRoot, $targetWorkflowsRoot | Out-Null

Copy-Item (Join-Path $sourceRoot "workflows\\*") $targetWorkflowsRoot -Recurse -Force
Copy-Item (Join-Path $sourceRoot "artifacts\\README.md") (Join-Path $targetArtifactsRoot "README.md") -Force
Copy-Item (Join-Path $sourceRoot "artifacts\\manifests\\*") $targetManifestsRoot -Recurse -Force
Copy-Item (Join-Path $sourceRoot "artifacts\\templates\\*") $targetTemplatesRoot -Recurse -Force
Copy-IfMissing (Join-Path $sourceRoot "starter\\artifacts\\current\\TaskBoard.current.md") (Join-Path $targetCurrentRoot "TaskBoard.current.md")
Copy-IfMissing (Join-Path $sourceRoot "starter\\artifacts\\tasks\\README.md") (Join-Path $targetTasksRoot "README.md")

$agentRulesPath = Join-Path $targetAiRoot "AGENT-RULES.md"
if (-not (Test-Path $agentRulesPath)) {
    @'
# Agent Rules

Adapt this file for the consuming repository.

Include:

- build and test commands
- coding standards
- stack-specific guidance
- operational constraints
'@ | Set-Content $agentRulesPath
}

Write-Host "AI workflow framework installed into $targetAiRoot"
Write-Host "Shared workflows, manifests, templates, and framework docs were synced."
Write-Host "Existing AGENT-RULES.md, TaskBoard.current.md, tasks/README.md, and task folders under .ai/artifacts/tasks/ were preserved."

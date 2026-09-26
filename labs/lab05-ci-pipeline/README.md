# Lab 05: Automated CI/CD Quality Gate & Linting (GitHub Actions)

## Overview & The "Why"
In production infrastructure-as-code (IaC) environments, deploying unverified configurations directly to production clusters introduces severe risks. A single missing space in YAML or a syntax flaw in an Ansible task can crash containers or disrupt automation workflows.

This module establishes an automated Continuous Integration (CI) Quality Gate using GitHub Actions:
* Every commit and pull request targeted at `main` triggers a serverless verification runner.
* Static analysis is enforced on all project files via `yamllint`.
* Ansible automation definitions undergo syntax validation (`--syntax-check`) before execution.
* Direct human error is prevented at the repository entry gate.

---

## Architectural Layout

```text
[Developer Workstation]
  └── git push origin main
            │
            ▼
[GitHub Actions Cloud Runner (Ubuntu 22.04)]
  ├── Step 1: actions/checkout@v4 (Pull Monorepo)
  ├── Step 2: actions/setup-python@v5 (Python 3.11 Environment)
  ├── Step 3: Install Tooling (yamllint, ansible-lint, ansible-core)
  ├── Step 4: yamllint . (Scan YAML structure & indentation)
  └── Step 5: ansible-playbook --syntax-check (Validate playbooks)
            │
      ┌─────┴────────────────┐
      ▼                      ▼
  [Pass: Exit 0]        [Fail: Exit 1]
  Merged to Main        Merge Blocked & Alerts Sent
Key Configurations
1. Workflow Pipeline (.github/workflows/ci.yml)
on: push: branches: [ main ]: Automated trigger hook for immediate feedback loop on code submission.

yamllint -d "{extends: relaxed, rules: {line-length: {max: 160}}}" .: Structural syntax audit preventing silent YAML parsing breaks while allowing clean configuration comments.

ansible-playbook --syntax-check: Pre-flight task tree inspection verifying valid Ansible schema and variable mappings without executing real state changes.

Verification & Artifacts
1. Controlled Lint Failure Detection
Automated pipeline catching a deliberately broken YAML definition (broken-test.yml), failing the build, and pinning the exact syntax discrepancy:

2. Successful Pipeline Execution
Verified build status confirming that all repository files passed static checks and syntax validation:

3. Workflow Step Details
Detailed execution log demonstrating clean passes across all static analysis stages:


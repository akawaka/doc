---
title: "Command Reference"
layout: page
description: "Reference for Opencode CLI and agent commands, including usage, prerequisites, and workflow integration."
---

# 🛠️ Command Reference

This page documents key Opencode commands, their usage, and how they fit into the agentic workflow. For a full list of available agents and commands, see the [Documentation Hub](./index.md).

---

## /create-pr

Creates a GitHub pull request using the GitHub CLI (`gh`). Ensures PRs follow semantic versioning and commit standards.

**Usage:**
```
/create-pr [branch] [options]
```

**Prerequisites:**
- GitHub CLI (`gh`) installed and authenticated
- Clean working directory

**Behavior:**
- Creates a pull request from the current or specified branch
- Applies project commit and PR standards
- Integrates with GitHub MCP configuration

---

## /review

Reviews the latest changes and suggests improvements.

**Usage:**
```
/review [options]
```

**Behavior:**
- Analyzes recent commits or changes
- Proposes refactoring, renaming, and architecture improvements
- Leverages agentic review standards

---

## Related Topics
- [GitHub MCP](./github-mcp.md)
- [Workflow](./workflow.md)

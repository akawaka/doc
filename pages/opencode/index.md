---
title: "📚 Opencode Configuration"
description: "Documentation abour Opencode configuration and how to use it."
---

The current documentation explains how our Opencode configuration works and how to use it.

### 🆕 Recent Features
- **GitHub MCP integration:** Streamlined configuration and safe updates
- **New commands:** `/create-pr` and `/review` for PR management and code review
- **Improved workflow:** Standardized PR/review process leveraging GitHub MCP

See [command-reference.md](./command-reference.md) for details on new commands.

---

## 🧭 Start Here

> **New to Opencode?**  
> 👉 Begin with [spec-drive-agentic-dev.md](./spec-drive-agentic-dev.md) for the big picture, then check [glossary.md](./glossary.md) for terminology.

> **Setting up a project?**  
> 👉 See [project-configuration.md](./project-configuration.md) for configuration and customization.

> **Curious about agent routing and workflows?**  
> 👉 Explore [routing-rules.md](./routing-rules.md) and [workflow.md](./workflow.md).

> **Want to enhance your workflow with LSPs?**  
> 👉 Read [lsp.md](./lsp.md) for integration details.



## 📑 Document Summaries

<details markdown="1">
<summary markdown="span"><strong>1. <a href="./glossary.md">glossary.md</a> — Key Terms & Concepts</strong></summary>

A concise glossary defining essential Opencode terms:  
- **Agent** & **Subagent** roles  
- **EARS** (Easy Approach to Requirements Syntax)  
- **TDD** (Test-Driven Development)  
- **Approval Gate** and more

_Recommended for all users to ensure a shared understanding of Opencode's language._
</details>

<details markdown="1">
<summary markdown="span"><strong>2. <a href="./routing-rules.md">routing-rules.md</a> — Agent Routing & Best Practices</strong></summary>

Comprehensive guide to the `@router` agent:  
- Central request coordination  
- Agent selection logic  
- Routing tables  
- Best practices for scalable, maintainable workflows

_See also: [workflow.md](./workflow.md) for agent lifecycle diagrams._
</details>

<details markdown="1">
<summary markdown="span"><strong>3. <a href="./workflow.md">workflow.md</a> — Agent Workflow Overview</strong></summary>

Step-by-step and visual overview of:  
- Agent and subagent communication  
- Development phase sequence  
- User request processing  
- Diagrams for clarity

_Use this to understand how Opencode orchestrates complex development tasks._
</details>

<details markdown="1">
<summary markdown="span"><strong>4. <a href="./lsp.md">lsp.md</a> — Language Server Protocol Integration</strong></summary>

Explains how LSPs empower Opencode with:  
- Structured code analysis  
- Real-time code intelligence  
- Multi-language and framework support

_Enhance your development experience with LSP-powered features._
</details>

<details markdown="1">
<summary markdown="span"><strong>5. <a href="./project-configuration.md">project-configuration.md</a> — Project Configuration Guide</strong></summary>

How to tailor Opencode for your project:  
- Overriding global settings  
- Local configuration files  
- Managing workflows, formatters, linters, and permissions

_Ensure your project is set up for success and consistency._
</details>

<details markdown="1">
<summary markdown="span"><strong>6. <a href="./spec-drive-agentic-dev.md">spec-drive-agentic-dev.md</a> — Spec-Driven Agentic Development</strong></summary>

The definitive guide to Opencode's methodology:  
- **5-phase workflow:** Plan → Requirements → Design → Tasks → Execute  
- **EARS** requirements format  
- **TDD** practices  
- **Quality gates** for each phase

_Adopt this process for high-quality, testable, and maintainable software._
</details>



## 🧩 Cross-References & Tips

- **Plugin Development:** See [plugins/README.md](./plugins/README.md) for a complete (AI-generated, unoffical) guide to building, extending, and distributing OpenCode plugins. ⚠️ Always check the source code for authoritative details.

- **See [glossary.md](./glossary.md)** for definitions referenced in all other docs.
- **Workflow diagrams** in [workflow.md](./workflow.md) complement the routing logic in [routing-rules.md](./routing-rules.md).
- **Methodology in [spec-drive-agentic-dev.md](./spec-drive-agentic-dev.md)** underpins all agent and workflow documentation.
- **Configuration tips** in [project-configuration.md](./project-configuration.md) apply to all phases and agent behaviors.
- **Usage tips:** See [tips.md](./tips.md) for practical Opencode tricks and shortcuts.



## 🚦 Need More Help?

- For **troubleshooting** or advanced usage, check the relevant document's "See Also" or cross-links.
- For **contributing** or extending Opencode, start with the methodology and workflow docs.

---

> ℹ️ _For the latest and most detailed information, always refer to the individual documentation files above. This README is updated regularly to reflect new docs and improvements._

---
title: "Agent Workflow"
layout: page
description: "How Opencode agents and subagents communicate and work together throughout the development lifecycle."
---

# 🔄 Opencode Agent Workflow

This document illustrates how Opencode agents and subagents communicate and work together throughout the development lifecycle.

---

## 🗺️ Workflow Overview

```mermaid
flowchart TB
    User(("User"))

    General["@general (General Assistance)"]
    Build["@build"]
    Router["@router (Request Router)"]

    CodeReviw["@code/review (Code Review)"]

    SpecPlan["@spec (Project Planner)"]
    SpecList["@spec/list (Feature Listing)"]
    SpecReq["@spec/requirements (Requirements)"]
    SpecDesign["@spec/design (Design)"]
    SpecTasks["@spec/tasks (Task Breakdown)"]
    SpecImpl["@spec/execute (Standard/Automated Implementation)"]
    SpecStatus["@spec/status (Status Reporting)"]
    SpecHelp["@spec/help (Guidance & Agent List)"]
    SpecAdv["@spec/advanced (Advanced Analysis)"]

    ToolsAgent["@tools/agent (Agent creation)"]
    ToolsDoc["@tools/doc (Documentation)"]
    ToolsQa["@tools/qa (Quality Assurance)"]
    ToolsUnderstand["@tools/understand (Codebase Understanding)"]


    User -->|Interacts| Router
    User -->|Interacts| General
    User -->|Interacts| Build
    User -->|Interacts| CodeReviw
    User -->|Interacts| SpecPlan
    User -->|Interacts| SpecHelp
    User -->|Interacts| SpecAdv
    User -->|Interacts| SpecList
    User -->|Interacts| SpecStatus
    User -->|Interacts| ToolsAgent
    User -->|Interacts| ToolsDoc
    User -->|Interacts| ToolsUnderstand

    Router --> Routing{Routing}
    Routing -->|Invokes| General
    Routing -->|Invokes| Build

    SpecHelp -->|Guides| User
    SpecStatus -->|Reports status| User
    SpecAdv -->|Reports analysis| User
    SpecList -->|Lists features| User
    ToolsUnderstand -->|Provides insights| User
    ToolsQa -->|Initiates| ToolsDoc

    subgraph Route
        Routing
        Router
    end

    subgraph Tools
        Routing -->|Invokes| ToolsAgent
        Routing -->|Invokes| ToolsDoc
        Routing -->|Invokes| ToolsQa
        Routing -->|Invokes| ToolsUnderstand
    end

    subgraph Code
        Routing -->|Invokes| CodeReviw
    end

    subgraph SpecDriven
        SpecPlan -->|Initiates| SpecReq
        SpecReq -->|Initiates| SpecDesign
        SpecDesign -->|Initiates| SpecTasks
        SpecTasks -->|Initiates| SpecImpl
        SpecImpl -->|Initiates| ToolsQa

        Routing -->|Invokes| SpecAdv
        Routing -->|Invokes| SpecPlan
        Routing -->|Invokes| SpecHelp
        Routing -->|Invokes| SpecList
        Routing -->|Invokes| SpecStatus

        ToolsDoc -->|Initiates| SpecStatus
    end
```

### 🆕 Command Integration
- Use `/create-pr` to open a pull request directly from your branch, leveraging GitHub MCP.
- Use `/review` to analyze and improve code before or after PR creation.
- These commands standardize and automate PR/review steps in the workflow.

## 📝 Diagram Explanation

- **User Interactions:** Users can start with any agent, but typically use `@router` to route their request, `@general` for open-ended help, or `@build` for disciplined TDD.
- **Request Routing:** The `@router` agent analyzes each request and dispatches it to the most suitable specialized agent, ensuring efficient handling and expert support.
- **Spec-Driven Pipeline:**
  1. **@spec**: Project planning and feature breakdown.
  2. **@spec/list**: Listing all features.
  3. **@spec/requirements**: Detailing requirements in EARS format.
  4. **@spec/design**: Creating technical design.
  5. **@spec/tasks**: Breaking design into TDD tasks.
  6. **@spec/execute**: Implementing features.
  7. **@tools/qa**: Running quality checks.
  8. **@tools/doc**: Updating documentation.
  9. **@spec/status**: Reporting status.
- **Parallel and On-Demand Tools:** Documentation and codebase understanding tools can be invoked at any time, supporting parallelism and deeper analysis.
- **Status and Guidance:** Agents like `@spec/status`, `@spec/help`, and `@spec/advanced` provide ongoing feedback, guidance, and advanced analysis.
- **Explicit Approval Gates:** Each phase requires user approval before proceeding, ensuring quality and user control.

This workflow ensures that every request is handled by the most capable agent, with clear transitions, quality checks, and opportunities for user feedback at every stage.

---

## 🔗 See Also

- [Routing Rules & Best Practices](./routing-rules.md)
- [Spec-Driven Agentic Development](./spec-drive-agentic-dev.md)
- [Glossary](./glossary.md)


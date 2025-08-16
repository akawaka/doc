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
    SpecPlan["@spec:plan (Project Planner)"]
    SpecList["@spec:list (Feature Listing)"]
    SpecReq["@spec:requirements (Requirements)"]
    SpecDesign["@spec:design (Design)"]
    SpecTasks["@spec:tasks (Task Breakdown)"]
    SpecImpl["@spec:execute (Standard/Automated Implementation)"]
    SpecStatus["@spec:status (Status Reporting)"]
    SpecHelp["@spec:help (Guidance & Agent List)"]
    SpecAdv["@spec:advanced (Advanced Analysis)"]
    ToolsQa["@tools:qa (Quality Assurance)"]
    ToolsDoc["@tools:doc (Documentation)"]
    ToolsUnderstand["@tools:understand (Codebase Understanding)"]
    User -->|Interacts| Router
    User -->|Interacts| General
    User -->|Interacts| Build
    User -->|Interacts| SpecPlan
    User -->|Interacts| SpecHelp
    User -->|Interacts| SpecAdv
    User -->|Interacts| SpecStatus
    User -->|Interacts| ToolsDoc
    User -->|Interacts| ToolsUnderstand
    Router --> Routing{Routing}
    Routing -->|Invokes| General
    Routing -->|Invokes| Build
    Routing -->|Invokes| SpecPlan
    Routing -->|Invokes| SpecHelp
    Routing -->|Invokes| SpecAdv
    Routing -->|Invokes| SpecStatus
    Routing -->|Invokes| ToolsDoc
    Routing -->|Invokes| ToolsUnderstand
    SpecHelp -->|Guides| User
    SpecStatus -->|Reports status| User
    SpecAdv -->|Reports analysis| User
    ToolsUnderstand -->|Provides insights| User
    ToolsQa -->|Initiates| ToolsDoc
    ToolsDoc -->|Initiates| SpecStatus
    subgraph Tools
        ToolsUnderstand
        ToolsDoc
    end
    subgraph SpecDriven
        SpecPlan -->|Initiates| SpecList
        SpecList -->|Initiates| SpecReq
        SpecReq -->|Initiates| SpecDesign
        SpecDesign -->|Initiates| SpecTasks
        SpecTasks -->|Initiates| SpecImpl
        SpecImpl -->|Initiates| ToolsQa
    end
```



## 📝 Diagram Explanation

- **User Interactions:** Users can start with any agent, but typically use `@router` to route their request, `@general` for open-ended help, or `@build` for disciplined TDD.
- **Request Routing:** The `@router` agent analyzes each request and dispatches it to the most suitable specialized agent, ensuring efficient handling and expert support.
- **Spec-Driven Pipeline:**
  1. **@spec:plan**: Project planning and feature breakdown.
  2. **@spec:list**: Listing all features.
  3. **@spec:requirements**: Detailing requirements in EARS format.
  4. **@spec:design**: Creating technical design.
  5. **@spec:tasks**: Breaking design into TDD tasks.
  6. **@spec:execute**: Implementing features.
  7. **@tools:qa**: Running quality checks.
  8. **@tools:doc**: Updating documentation.
- **Parallel and On-Demand Tools:** Documentation and codebase understanding tools can be invoked at any time, supporting parallelism and deeper analysis.
- **Status and Guidance:** Agents like @spec:status, @spec:help, and @spec:advanced provide ongoing feedback, guidance, and advanced analysis.
- **Explicit Approval Gates:** Each phase requires user approval before proceeding, ensuring quality and user control.

This workflow ensures that every request is handled by the most capable agent, with clear transitions, quality checks, and opportunities for user feedback at every stage.

---

## 🔗 See Also

- [Routing Rules & Best Practices](./routing-rules.md)
- [Spec-Driven Agentic Development](./spec-drive-agentic-dev.md)
- [Glossary](./glossary.md)


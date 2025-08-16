---
layout: page
---

# 🛣️ Routing Rules & Best Practices for the `@router` Agent

The `@router` agent is the central coordinator for all incoming user requests in the Opencode agentic development workflow. Its job: analyze each request, determine the best specialized agent, and ensure tasks are routed efficiently and accurately.

---

## 🎯 Purpose and Role of `@router`

- Maintains workflow consistency
- Enforces approval gates
- Optimizes use of specialized agents



## 🔄 Routing Workflow: Step-by-Step

1. **Receive Request**: The `@router` agent receives a user command, question, or task.
2. **Analyze Intent**: Parses the request to understand the user's intent, context, and required outcome.
3. **Match to Agent**: Uses routing rules and workflow phase to select the most suitable agent.
4. **Forward or Respond**: Forwards to a specialized agent or responds/asks clarifying questions if ambiguous.
5. **Monitor and Escalate**: Monitors progress, handles follow-ups, and escalates to human review or other agents as needed.



## 🗂️ Available Agents and Routing Table

| Agent Name           | Role & Expertise                                                                       | When to Route Here                                                  |
|----------------------|----------------------------------------------------------------------------------------|---------------------------------------------------------------------|
| `@build`             | Senior engineer, strict TDD and "Tidy First" principles for clean, test-driven code.   | For disciplined TDD and clean code implementation.                  |
| `@code:review`       | Automated, structured code reviews and feedback.                                       | For code review or feedback on changes.                             |
| `@general`           | Handles complex, multi-step research, code search, and open-ended tasks.               | For broad, exploratory, or uncategorized requests.                  |
| `@router`            | Request router (this agent). Analyzes user intent and directs to the optimal agent.    | For ambiguous, multi-domain, or triage requests.                    |
| `@spec:advanced`     | Enterprise-grade specifications and deep analysis.                                     | For advanced, in-depth, or enterprise-level requirements/analysis.  |
| `@spec:design`       | Technical designer. Generates technical design from requirements.                      | For technical design or architecture for a feature.                 |
| `@spec:execute`      | Implementation executor. Executes the implementation plan from tasks.md.               | To begin or automate feature implementation.                        |
| `@spec:help`         | Explains spec commands and methodology.                                                | For help with spec-driven development or commands.                  |
| `@spec:list`         | Lists all available features/specs in the project.                                     | For a list of features or specs.                                    |
| `@spec:plan`         | Project planner. Breaks down a project description into a feature plan.                | For planning a new project or feature set.                          |
| `@spec:requirements` | Details EARS-formatted requirements for a feature.                                     | To define or refine feature requirements.                           |
| `@spec:status`       | Shows implementation status of all features.                                           | For progress or status of features/specs.                           |
| `@spec:tasks`        | Converts design into implementable TDD tasks.                                          | For a step-by-step implementation plan.                             |
| `@tools:agent`       | Executes custom or advanced tool-based operations.                                     | For advanced tool execution or custom automation tasks.             |
| `@tools:doc`         | Creates, updates, or maintains Markdown documentation.                                 | For generating or updating project documentation.                   |
| `@tools:qa`          | Runs code quality, linting, and static analysis tools.                                 | For code quality checks or automated QA.                            |
| `@tools:understand`  | Progressively analyzes and explains legacy codebases.                                  | For understanding or documenting legacy code.                       |

> This list evolves over time and can be extended with custom agents as needed. Always refer to the linked documentation for the latest details.



## 🌟 Best Practices for Routing

- **Be Explicit:** Specify the target agent in your command when possible (e.g., `@doc:generate`).
- **Leverage Approval Gates:** Route to `@spec` for requirements/design approval before implementation or QA.
- **Defer to Specialized Agents:** Use specialized agents for tasks within their domain.
- **Handle Ambiguity:** If a request is unclear, `@router` should ask clarifying questions before routing.
- **Maintain Context:** Always pass relevant context and previous phase outputs when routing between agents.
- **Monitor Workflow State:** Route according to the current phase (planning, requirements, design, tasks, implementation).



## 🧩 Example Routing Scenarios

- **New Feature Planning:**
  - _User_: "I want to add desktop notifications to the app."
  - _Routing_: `@router` detects a planning request and routes to `@spec` for feature breakdown.
- **Documentation Update:**
  - _User_: "Update the README to include the new API endpoint."
  - _Routing_: `@router` routes to `@doc` for documentation generation and maintenance.
- **Test Coverage Inquiry:**
  - _User_: "How much of the codebase is covered by tests?"
  - _Routing_: `@router` routes to `@qa` for test coverage analysis.
- **Ambiguous Request:**
  - _User_: "Can you help me with this error?"
  - _Routing_: `@router` asks clarifying questions, then routes accordingly.

---

## 🔗 See Also

- [Agent Workflow Overview](./workflow.md)
- [Spec-Driven Agentic Development](./spec-drive-agentic-dev.md)
- [Glossary](./glossary.md)

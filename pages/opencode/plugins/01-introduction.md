---
title: "Introduction to OpenCode Plugins"
layout: page
---

[🔝 Summary](./README.md) | [➡️ Next: Getting Started](./02-getting-started.md)

# 1. Introduction to OpenCode Plugins

Welcome to the OpenCode plugin development guide!  
This documentation is your comprehensive resource for building powerful extensions that integrate seamlessly with the OpenCode agent.

---

## What is an OpenCode Plugin?

An OpenCode plugin is a TypeScript or JavaScript module that extends the core functionality of the OpenCode agent. By "hooking" into specific events in the agent's lifecycle, you can observe, modify, or even block certain actions.

> **Why use plugins?**  
> Plugins let you customize OpenCode to fit your needs, automate workflows, and integrate with other tools and services.

---

## What Can You Build with Plugins?

The possibilities are vast! Here are some common use cases:

- **Workflow Automation:**  
  Automatically approve tool commands, inject default arguments, or chain commands together.

- **Content Modification:**  
  Censor sensitive data from prompts or outputs, or automatically add context and signatures to messages.

- **Custom Security Layers:**  
  Implement fine-grained permission controls, such as restricting file system access to a specific directory.

- **LLM Parameter Control:**  
  Dynamically adjust model parameters (like `temperature`) based on context.

- **Third-Party Integrations:**  
  Log events to external services, send notifications to Slack/Discord, or connect to custom APIs.

- **New Authentication Methods:**  
  Add support for new OAuth providers or custom API key authentication schemes.

---

## Core Concepts

Before you start building, get familiar with these key ideas:

- **Hooks:**  
  Named events in the OpenCode lifecycle that your plugin can subscribe to (e.g., `chat.message`, `tool.execute.before`).

- **Plugin Initializer:**  
  The main entry point of your plugin—a function that receives the `PluginInput` object and returns a `Hooks` object.

- **`PluginInput` Object:**  
  The context object passed to your plugin on initialization. It provides access to OpenCode utilities, including an API client (`client`), the application instance (`app`), and a shell executor (`$`).

- **`Hooks` Object:**  
  The object returned by your initializer. Its keys are the names of the hooks you want to listen to, and its values are the functions that will be executed when those hooks fire.

---

Ready to start building?  
Continue to [2. Getting Started](./02-getting-started.md) to set up your development environment.

---
[🔝 Summary](./README.md) | [➡️ Next: Getting Started](./02-getting-started.md)

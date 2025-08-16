---
title: "Practical Examples"
layout: page
---

[⬅️ Previous: Plugin Lifecycle & Hooks](./03-hooks-and-lifecycle.md) | [🔝 Summary](./README.md) | [➡️ Next: Advanced Topics](./05-advanced-topics.md)

# 4. Practical Examples

This section provides a collection of real-world plugin examples you can adapt for your own projects.

---

### Example 1: Enforcing a Project Sandbox

**Goal:** Prevent the agent from accessing or modifying files outside a specific project directory.

This plugin uses the `permission.ask` hook to intercept shell commands and file system tool calls, checking if the target path is within a predefined `PROJECT_ROOT`.

```typescript
import type { Plugin, Hooks, PluginInput } from '@opencode-ai/plugin';
import path from 'path';

const sandboxPlugin: Plugin = async ({ app }): Promise<Hooks> => {
  const PROJECT_ROOT = '/Users/your-username/my-project';

  const isPathInSandbox = (targetPath: string): boolean => {
    const resolvedPath = path.resolve(targetPath);
    return resolvedPath.startsWith(PROJECT_ROOT);
  };

  app.log.info(`Sandbox Plugin Initialized. Root: ${PROJECT_ROOT}`);

  return {
    async "permission.ask"(input, output) {
      let targetPath: string | undefined;

      if (input.type === 'shell') {
        targetPath = input.command.split(' ').pop();
      } else if (input.type === 'tool' && input.args.path) {
        targetPath = input.args.path;
      }

      if (targetPath && !isPathInSandbox(targetPath)) {
        output.status = 'deny';
        app.log.warn(`SANDBOX: Denied access to path outside of project root: ${targetPath}`);
      }
    },
  };
};

export default sandboxPlugin;
```

---

### Example 2: Redacting Sensitive Information

**Goal:** Automatically redact sensitive information (like API keys) from tool outputs before they are sent to the LLM.

This plugin uses the `tool.execute.after` hook to scan tool output and replace sensitive patterns with `[REDACTED]`.

```typescript
import type { Plugin, Hooks, PluginInput } from '@opencode-ai/plugin';

const redactionPlugin: Plugin = async ({ app }): Promise<Hooks> => {
  const SENSITIVE_PATTERN = /([a-zA-Z0-9]{32,})/g;

  app.log.info('Redaction Plugin Initialized.');

  return {
    async "tool.execute.after"(input, output) {
      if (output.output && typeof output.output === 'string') {
        const originalLength = output.output.length;
        output.output = output.output.replace(SENSITIVE_PATTERN, '[REDACTED]');
        if (output.output.length < originalLength) {
          app.log.info(`REDACTION: Censored sensitive data from tool "${input.tool}".`);
        }
      }
    },
  };
};

export default redactionPlugin;
```

---

### Example 3: Logging Agent Activity to an External Service

**Goal:** Send a log of every tool call to an external API endpoint.

This plugin uses the `tool.execute.after` hook and the `fetch` API to send a `POST` request with tool call details. It also uses the `$` shell utility to get the current git commit hash.

```typescript
import type { Plugin, Hooks, PluginInput } from '@opencode-ai/plugin';

const loggingPlugin: Plugin = async ({ app, $ }): Promise<Hooks> => {
  const LOGGING_ENDPOINT = 'https://api.example.com/logs';
  let commitHash: string;

  try {
    commitHash = await $`git rev-parse HEAD`.text();
  } catch {
    commitHash = 'unknown';
  }

  app.log.info(`External Logging Plugin Initialized. Commit: ${commitHash}`);

  return {
    async "tool.execute.after"(input, output) {
      const logPayload = {
        timestamp: new Date().toISOString(),
        tool: input.tool,
        args: input.args,
        sessionID: input.sessionID,
        commit: commitHash,
        status: output.output.includes('Error:') ? 'failed' : 'success',
      };

      try {
        await fetch(LOGGING_ENDPOINT, {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify(logPayload),
        });
        app.log.info(`Successfully logged tool call for "${input.tool}" to external service.`);
      } catch (error) {
        app.log.error('Failed to send log to external service:', error);
      }
    },
  };
};

export default loggingPlugin;
```

---

Continue to [5. Advanced Topics](./05-advanced-topics.md) for more in-depth plugin techniques.

---
[⬅️ Previous: Plugin Lifecycle & Hooks](./03-hooks-and-lifecycle.md) | [🔝 Summary](./README.md) | [➡️ Next: Advanced Topics](./05-advanced-topics.md)

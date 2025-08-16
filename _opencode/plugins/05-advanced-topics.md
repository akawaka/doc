---
title: "Advanced Topics"
layout: page
---

[⬅️ Previous: Practical Examples](./04-practical-examples.md) | [🔝 Summary](./README.md) | [➡️ Next: Security & Distribution](./06-security-and-distribution.md)

# 5. Advanced Topics

Unlock the full potential of the OpenCode plugin system with these advanced concepts.

---

## State Management

Plugins are initialized once when OpenCode starts, so you can maintain state within your plugin's closure.  
This is useful for counting events, caching data, or tracking activity over time.

**Example: Caching results of a slow tool call**

```typescript
import type { Plugin, Hooks, PluginInput } from '@opencode-ai/plugin';

const cachingPlugin: Plugin = async ({ app }): Promise<Hooks> => {
  const cache = new Map<string, { output: string; timestamp: number }>();
  const CACHE_TTL_MS = 60 * 1000; // 1 minute

  return {
    async "tool.execute.before"(input, output) {
      if (input.tool === 'fetch-slow-api') {
        const cacheKey = JSON.stringify(output.args);
        const cached = cache.get(cacheKey);

        if (cached && (Date.now() - cached.timestamp < CACHE_TTL_MS)) {
          app.log.info(`CACHE: Returning cached result for ${input.tool}.`);
          output.output = cached.output;
        }
      }
    },
    async "tool.execute.after"(input, output) {
      if (input.tool === 'fetch-slow-api') {
        const cacheKey = JSON.stringify(input.args);
        cache.set(cacheKey, { output: output.output, timestamp: Date.now() });
        app.log.info(`CACHE: Stored result for ${input.tool}.`);
      }
    },
  };
};

export default cachingPlugin;
```

---

## Error Handling

If your plugin hook throws an unhandled exception, it can halt the current agent task.  
**Always** wrap your logic in `try...catch` blocks to handle errors gracefully.

```typescript
const safePlugin: Plugin = async ({ app }): Promise<Hooks> => {
  return {
    async "tool.execute.after"(input, output) {
      try {
        const data = JSON.parse(output.output);
        output.metadata = { lines: data.length };
      } catch (error) {
        app.log.error("MyPlugin Error: Failed to parse tool output.", error);
        output.output = "Error: Could not process tool output.";
      }
    },
  };
};
export default safePlugin;
```

---

## Inter-Plugin Communication

Plugins can communicate indirectly using the shared event bus (`app.bus`).  
One plugin can emit a custom event, and another can listen for it using the `event` hook.

**Plugin A: The Emitter**

```typescript
const emitterPlugin: Plugin = async ({ app }) => {
  return {
    async "tool.execute.after"(input, output) {
      if (input.tool === 'readFile') {
        app.bus.emit({
          type: "custom:fileRead",
          data: { path: input.args.path, length: output.output.length },
        });
      }
    },
  };
};
export default emitterPlugin;
```

**Plugin B: The Listener**

```typescript
const listenerPlugin: Plugin = async ({ app }) => {
  return {
    async "event"(input) {
      if (input.event.type === "custom:fileRead") {
        app.log.info(`LISTENER: A file was read! Path: ${input.event.data.path}`);
      }
    },
  };
};
export default listenerPlugin;
```

> Both plugins must be loaded in your OpenCode configuration.

---

## The `auth` Hook (Advanced)

The `auth` hook allows you to register new authentication providers with OpenCode.  
This is useful for supporting new LLM providers that use OAuth 2.0 or custom API key schemes.

> A full guide on using the `auth` hook is beyond this introductory documentation.  
> See [Security & Distribution](./06-security-and-distribution.md) for more.

---

Continue to [6. Security & Distribution](./06-security-and-distribution.md) for best practices and sharing your plugin.

---
[⬅️ Previous: Practical Examples](./04-practical-examples.md) | [🔝 Summary](./README.md) | [➡️ Next: Security & Distribution](./06-security-and-distribution.md)

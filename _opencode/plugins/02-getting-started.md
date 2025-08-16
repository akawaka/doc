---
title: "Getting Started"
layout: page
---

[⬅️ Previous: Introduction](./01-introduction.md) | [🔝 Summary](./README.md) | [➡️ Next: Plugin Lifecycle & Hooks](./03-hooks-and-lifecycle.md)

# 2. Getting Started

This section guides you through setting up your development environment and creating your first "Hello, World!" plugin.

---

## Prerequisites

Make sure you have the following installed:

- **Node.js:** Version 18 or higher recommended.
- **OpenCode:** A working installation.
- **TypeScript (Recommended):** For type safety and a better developer experience.

---

## Step 1: Initialize Your Project

Create a new directory for your plugin and initialize a Node.js project:

```bash
# Create the project directory
mkdir my-opencode-plugin
cd my-opencode-plugin

# Initialize a package.json file
npm init -y

# Install TypeScript and OpenCode plugin types
npm install typescript --save-dev
npm install @opencode-ai/plugin --save-dev

# Generate a tsconfig.json file
npx tsc --init
```

> The `@opencode-ai/plugin` package provides all the type definitions you'll need.

---

## Step 2: Configure TypeScript

Edit your `tsconfig.json` to match this configuration:

```json
{
  "compilerOptions": {
    "target": "es2022",
    "module": "commonjs",
    "outDir": "./dist",
    "rootDir": "./src",
    "strict": true,
    "esModuleInterop": true,
    "skipLibCheck": true
  },
  "include": ["src/**/*"]
}
```

---

## Step 3: Create Your First Plugin File

1. Create a `src` directory: `mkdir src`
2. Create a new file named `index.ts` inside `src`:

```typescript
import type { Plugin, Hooks, PluginInput } from '@opencode-ai/plugin';

// This is your plugin's main initializer function.
const helloWorldPlugin: Plugin = async (input: PluginInput): Promise<Hooks> => {
  // The `input` object gives you access to core utilities.
  const { app } = input;

  // Use the built-in logger to print a message when the plugin loads.
  app.log.info('Hello, World! My first OpenCode plugin has loaded!');

  // Return an empty Hooks object since this plugin doesn't need to
  // listen to any specific events after initialization.
  return {};
};

// You must export your initializer as the default export.
export default helloWorldPlugin;
```

---

## Step 4: Compile Your Plugin

Compile your TypeScript code to JavaScript:

```bash
npx tsc
```

Or use `npx tsc -w` to watch for changes and recompile automatically.

---

## Step 5: Load Your Plugin in OpenCode

1. Find your OpenCode configuration file (e.g., `~/.config/opencode/opencode.json`).
2. Add a `plugin` array if it doesn't exist.
3. Add the **absolute path** to your compiled `dist/index.js` file, prefixed with `file://`.

**Example `opencode.json`:**

```json
{
  "plugin": [
    "file:///Users/your-username/path/to/my-opencode-plugin/dist/index.js"
  ]
}
```

> **Note:** Replace the path with the correct absolute path on your system.

---

## Step 6: Run OpenCode

Start OpenCode. If everything is configured correctly, you should see your "Hello, World!" message in the logs.

---

Congratulations!  
You've successfully created and loaded your first OpenCode plugin.

Continue to [3. Plugin Lifecycle & Hooks](./03-hooks-and-lifecycle.md) to learn how plugins interact with OpenCode.

---
[⬅️ Previous: Introduction](./01-introduction.md) | [🔝 Summary](./README.md) | [➡️ Next: Plugin Lifecycle & Hooks](./03-hooks-and-lifecycle.md)

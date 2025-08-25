---
title: "Security & Distribution"
layout: page
---

[⬅️ Previous: Advanced Topics](./05-advanced-topics.md) | [🔝 Summary](./README.md)

# 6. Security & Distribution

This section covers best practices for writing secure plugins and how to distribute your work to other OpenCode users.

---

## Security Best Practices

> ⚠️ **Security is critical!**  
> Plugins run with significant privileges. Always follow these guidelines to protect users and their systems.

### 1. Shell Command Injection

- **Never** directly interpolate user or model input into shell commands.
- **INSECURE:**  
  ```typescript
  await $`echo ${userInput}`
  ```
- **SECURE:**  
  ```typescript
  await $`echo $VAR`.env({ VAR: userInput })
  ```

### 2. Data Handling & Redaction

- Never log sensitive data (API keys, personal info) to the console.
- Use the `tool.execute.after` hook to redact sensitive information before it is stored or sent to an LLM.

### 3. Dependency Management

- Keep your `npm` dependencies up to date.
- Run `npm audit` regularly.
- Use tools like Dependabot if you host your code on GitHub.

### 4. Principle of Least Privilege

- Only request the access or perform the actions absolutely necessary for your plugin’s function.
- For example, if your plugin only needs to read files, do not give it write or delete permissions.

### 5. Input Validation

- Treat all inputs (from users, LLM, or tool outputs) as untrusted.
- Validate and sanitize inputs before using them in sensitive operations like file paths or API calls.

---

## Distributing Your Plugin

Once your plugin is built and tested, you can share it with the community.

### Option 1: Distribute via npm (Recommended)

1. **Finalize `package.json`:**  
   Ensure your package has a unique name (e.g., `opencode-my-cool-plugin`), a version, description, and author info.
2. **Login to npm:**  
   ```bash
   npm login
   ```
3. **Publish:**  
   ```bash
   npm publish
   ```

**How users install your plugin:**

Add the package name to their OpenCode config:

```json
{
  "plugin": [
    "opencode-my-cool-plugin"
  ]
}
```

OpenCode will automatically download and install it.

---

### Option 2: Distribute as a Git Repository

You can also share your plugin via a public Git repository (e.g., GitHub).

**Instructions for users:**

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/my-opencode-plugin.git
   cd my-opencode-plugin
   npm install
   npm run build
   ```
2. Add the built plugin to their OpenCode config:
   ```json
   {
     "plugin": [
       "file:///path/to/my-opencode-plugin/dist/index.js"
     ]
   }
   ```

> This method is best for private plugins or collaborative development.

---

## Thank You!

Thank you for reading the OpenCode Plugin Development Guide.  
We’re excited to see what you build! If you have questions or feedback, please join our community channels.

---

[⬅️ Previous: Advanced Topics](./05-advanced-topics.md) | [🔝 Summary](./README.md)

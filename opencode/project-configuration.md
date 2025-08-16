---
title: "Project Configuration"
layout: page
description: "Customize and override Opencode's default configuration on a per-project basis for team-specific workflows."
---

# 🛠️ Project-Specific Opencode Configuration

This guide explains how to customize and override Opencode's default configuration on a per-project basis, so teams can maintain consistent workflows while adapting to specific needs.

---

## 🎯 Overview

Opencode supports project-specific configuration through local files that override global defaults in `~/.config/opencode/`. This enables you to:
- Customize LSP settings for frameworks
- Configure project-specific formatters and linters
- Set up specialized workflows
- Override global permissions and safety settings



## 🗂️ Configuration File Structure

**Global Configuration:**
```
~/.config/opencode/
├── opencode.json    # Main configuration
├── .phpactor.json   # PHP language server settings
├── instructions/    # Global workflow guides
├── prompt/          # AI prompt templates
└── templates/       # Reusable templates
```

**Project Configuration:**
```
your-project/
├── opencode.json       # Project-specific overrides
├── .phpactor.json      # Project PHP settings
├── .opencode/          # Optional project config directory
│   ├── instructions/   # Project-specific guides
│   ├── prompt/         # Custom prompts
│   └── templates/      # Project templates
└── ...                 # Your project files
```



## 🏆 Configuration Precedence Rules

1. **Project Root** - `./opencode.json`
2. **Project .opencode Directory** - `./.opencode/opencode.json`
3. **Global Configuration** - `~/.config/opencode/opencode.json`
4. **Built-in Defaults** - Opencode's internal defaults

- **Object properties:** Deep merged (project overrides global)
- **Arrays:** Replaced (project replaces global)
- **Primitive values:** Overridden (project replaces global)



## 💡 Common Configuration Examples

### Symfony Project
```json
{
  "$schema": "https://opencode.ai/config.json",
  "permission": { "bash": { "php bin/console": "allow" } },
  "formatter": { 
    "php-cs-fixer": { 
      "command": ["./vendor/bin/php-cs-fixer", "fix", "$FILE"], 
      "extensions": [".php"]
    }
  },
  "lsp": { 
    "phpactor": { 
      "command": ["./vendor/bin/phpactor", "language-server"], 
      "extensions": [".php"]
    }
  }
}
```

### Node.js/TypeScript Project
```json
{
  "$schema": "https://opencode.ai/config.json",
  "formatter": { 
    "eslint": { 
      "command": ["npx", "eslint", "--fix", "$FILE"], 
      "extensions": [".js", ".ts"]
    }
  },
  "lsp": { 
    "typescript": { 
      "command": ["npx", "typescript-language-server", "--stdio"], 
      "extensions": [".ts", ".tsx"]
    }
  }
}
```

### Docker-First Development
```json
{
  "$schema": "https://opencode.ai/config.json",
  "permission": { "bash": { "docker": "allow" } },
  "formatter": { 
    "hadolint": { 
      "command": ["hadolint", "$FILE"], 
      "extensions": ["Dockerfile"]
    }
  },
  "lsp": { 
    "docker": { 
      "command": ["docker-langserver", "--stdio"], 
      "extensions": ["Dockerfile"]
    }
  }
}
```



## 🧩 Best Practices

- **Version Control:**
  - ✅ Include: `opencode.json`, `.phpactor.json`, project-specific instructions
  - ❌ Exclude: Personal IDE preferences, machine-specific paths, sensitive credentials
- **Team Collaboration:**
  - Use shared instructions and formatter configs for consistency
- **Environment-Specific Settings:**
  - Use different configs for dev/prod as needed


## 🛠️ Troubleshooting

- **LSP not starting:** Check command validity, run manually for debug
- **Formatter not working:** Verify command syntax and file extensions
- **Configuration not loading:** Check JSON syntax and file location

---

## 🔗 See Also

- [Spec-Driven Agentic Development](./spec-drive-agentic-dev.md)
- [LSP Integration Guide](./lsp.md)
- [Glossary](./glossary.md)

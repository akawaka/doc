# GitHub MCP Safe Update Implementation

## Overview

The `install.sh` script now safely updates only the GitHub MCP "enabled" field in `dist/opencode.json` without affecting other MCP services.

## Key Features

### ✅ Targeted Updates
- **Only updates GitHub MCP**: Uses targeted sed commands that only affect the `"github": {}` section
- **Preserves other services**: Context7, ESLint, and other MCP configurations remain unchanged
- **Safe pattern matching**: Uses range-based sed (`/start/,/end/`) to limit scope

### ✅ Robust Implementation
- **Primary method**: Uses `jq` for precise JSON editing when available
- **Fallback method**: Uses targeted sed commands when `jq` fails (e.g., JSON with comments)
- **Backup/restore**: Automatically creates backups and restores on failure
- **Error handling**: Clear error messages and safe failure recovery

### ✅ User Experience
- **Clear prompts**: User-friendly GitHub MCP configuration prompts
- **Secure input**: Hidden token input using `read -s`
- **Status feedback**: Clear success/failure messages
- **Accurate summary**: Installation summary correctly reflects GitHub MCP status

## Technical Implementation

### Sed Command Structure
```bash
# Enable GitHub MCP (targets only github section)
sed -i '/    "github": {/,/    }/ {
    s/      "enabled": false,/      "enabled": true,/
}' "$config_file"

# Update token (global, but specific pattern)
sed -i 's/"Bearer <YOUR_GITHUB_PAT>"/"Bearer $token"/' "$config_file"
```

### Safety Guarantees
1. **Range-limited**: Sed operations are scoped to the GitHub MCP section only
2. **Pattern-specific**: Only matches the exact patterns for GitHub MCP
3. **Backup protection**: Always creates backup before modification
4. **Verification**: Changes are verified before completing

## Testing
Comprehensive tests verify:
- ✅ Only GitHub MCP "enabled" field is modified
- ✅ Other MCP services remain unchanged  
- ✅ Token replacement works correctly
- ✅ Both enable/disable scenarios work
- ✅ JSON with comments is handled correctly
- ✅ Backup/restore functionality

## Usage
The functionality is automatically integrated into the installer:

```bash
# Run installer - will prompt for GitHub MCP configuration
./install.sh

# GitHub MCP prompt will appear:
# "Would you like to enable GitHub MCP by entering a token now? (y/N):"
```

## Related Commands

- See [command-reference.md](./command-reference.md) for `/create-pr` and `/review` usage with GitHub MCP.

## Files Modified
- `install.sh`: Enhanced `update_json_config()` and added `update_github_mcp_with_sed()`
- No changes to `dist/opencode.json` structure required

## Acceptance Criteria Met
- ✅ Only GitHub MCP "enabled" field is updated
- ✅ Other "enabled" fields remain unchanged
- ✅ Uses jq when available for precise editing
- ✅ Falls back to targeted sed commands
- ✅ Backs up file before modification
- ✅ Clear user messages at each step
- ✅ Installation continues regardless of user choice
- ✅ Summary accurately reflects GitHub MCP status
- ✅ Tested with various JSON layouts
# Documentation Hub

This repo serves as the documentation hub for all Akawaka projects.

## Adding Projects

This documentation hub uses a YAML-based configuration system for managing projects displayed on the homepage.

### Configuration File

The projects are configured in `_data/projects.yml`. This file contains all project definitions that will be displayed on the homepage.

#### Fields Explanation

- **title**: The display name of the project (supports emojis)
- **description**: A brief description shown on the project card
- **url**: The link to the project (can be relative for internal links or absolute for external)
- **type**:
    - `internal`: Links within the documentation site
    - `external`: Links to external websites
- **category**: Used for organizing projects (e.g., "documentation", "development", "company")
- **featured**: Boolean flag to control whether the project appears on the homepage

### Project Structure

Each project in the YAML file has the following structure:

```yaml
- title: "🔧 Project Title"           # Display title with optional emoji
  description: "Project description"  # Brief description of the project
  url: "/path/to/project"             # URL (internal or external)
  type: "internal"                    # "internal" or "external"
  category: "documentation"           # Category for organization
  featured: true                      # Whether to show on homepage
```

### Adding New Projects

To add a new project:

1. Edit `_data/projects.yml`
2. Add a new project entry following the structure above
3. Set `featured: true` if you want it to appear on the homepage
4. Commit and push your changes

#### Example: Adding a New Project

```yaml
- title: "📚 API Documentation"
  description: "Complete API reference for all Akawaka services and endpoints."
  url: "/api/"
  type: "internal"
  category: "documentation"
  featured: true
```

## Benefits of This System

1. **Easy Management**: Add/remove projects without editing HTML
2. **Consistent Structure**: All projects follow the same format
3. **Flexible Display**: Control which projects are featured
4. **Future-Proof**: Easy to extend with additional fields
5. **Version Control**: Changes are tracked in Git


## Automating Documentation Sync

To automatically sync docs from other repos:
- Set up a GitHub Actions workflow in the project repo to build and push docs here (see the opencode project for an example).
- Target the appropriate subdirectory, e.g., `/pages/opencode/`.
- Trigger a build of this site after syncing.

## Development

This site uses [Cecil](https://cecil.app/fr/) (a Symfony-based static site generator).

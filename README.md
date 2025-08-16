# akawaka/doc – Documentation Hub

This repo serves as the documentation hub for all Akawaka projects.

## Adding Projects

Projects are displayed as cards on the landing page. To add or update a project:
1. Open `index.md`
2. Edit the `projects` list in the YAML front matter.
3. Each project needs a `name`, `description`, and `url`.

## Automating Documentation Sync

To automatically sync docs from other repos:
- Set up a GitHub Actions workflow in the project repo to build and push docs here (see the opencode project for an example).
- Target the appropriate subdirectory, e.g., `/opencode/`.
- Trigger a build of this site after syncing.

## Development

This site uses Jekyll with a custom theme. See `_config.yml` for configuration.

---

*Theme based on the Opencode design system.*
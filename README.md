# 📚 Akawaka Documentation Hub

![Built with Cecil](https://img.shields.io/badge/built_with-cecil-blue)
![Powered by Symfony](https://img.shields.io/badge/powered_by-symfony-black)
![Centralized Docs](https://img.shields.io/badge/documentation-centralized-green)

---

## 🚀 Features at a Glance

- **Centralized Docs**: All Akawaka project documentation in one place
- **Auto-Sync**: Docs update automatically via GitHub Actions
- **Easy Config**: Manage projects with simple YAML files
- **Fast Builds**: Powered by Cecil for instant previews

---

## 🗺️ Quick Navigation

| [📝 Add Projects](#add-projects) | [🔄 Doc Sync](#automating-documentation-sync) | [💻 Development](#development) |
|:-------------------------------:|:--------------------------------------------:|:-----------------------------:|
| [⚙️ Config](#configuration-file) | [🏗️ Structure](#project-structure)           | [✨ Benefits](#benefits)       |

---

## 📝 Add Projects

Manage projects via a single YAML file.

### ⚙️ Configuration File

- **Location**: `data/projects.yml`
- **Purpose**: Defines all projects shown on the homepage.

#### Fields

| Field        | Description                                      |
|--------------|--------------------------------------------------|
| `title`      | Display name (emojis supported)                  |
| `description`| Short summary for the project card               |
| `url`        | Link (relative for internal, absolute for external) |
| `type`       | `internal` or `external`                         |
| `category`   | For grouping (e.g., documentation, development)  |
| `featured`   | `true` to show on homepage                       |

#### Example Entry

```yaml
- title: "📚 API Documentation"
  description: "Complete API reference for all Akawaka services."
  url: "/api/"
  type: "internal"
  category: "documentation"
  featured: true
```

### ➕ How to Add a Project

1. Edit `data/projects.yml`
2. Add a new entry (see above)
3. Set `featured: true` to display on homepage
4. Commit & push

---

## 🏗️ Project Structure

```
.
├── data/
│   └── projects.yml      # Project definitions
├── pages/                # Documentation pages
├── config.yml            # Cecil config
├── composer.json         # PHP dependencies
└── README.md             # This file
```

---

## 🔄 Automating Documentation Sync

- Use GitHub Actions in your project repo to build and push docs here.
- Target the correct subdirectory (e.g., `/pages/opencode/`).
- Trigger a site build after syncing.

---

## 💻 Development

Built with [Cecil](https://cecil.app/fr/) (Symfony-based static site generator).

### Install

```bash
composer install
```

### Build

```bash
bin/cecil build
```
Outputs to `_site/`.

### Local Dev

```bash
bin/cecil serve
```
Runs at [http://localhost:8000](http://localhost:8000) with hot reload.

---

## ✨ Benefits

- **Simple Management**: Add/remove projects in YAML
- **Consistent Format**: All projects follow the same structure
- **Flexible Display**: Control homepage visibility
- **Versioned**: All changes tracked in Git

---

For any Akawaka project, this hub is your go-to for documentation—fast, organized, and always up to date.

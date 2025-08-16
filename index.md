---
layout: default
title: Akawaka Documentation Hub
projects:
  - name: Opencode
    description: "Developer tools and documentation automation."
    url: "https://github.com/akawaka/opencode/"
  # Add more projects here!
---

# Akawaka Documentation Hub

Welcome! Explore our projects:
<div class="cards">
{% for project in page.projects %}
<a class="card" href="{{ project.url }}">
<h2>{{ project.name }}</h2>
<p>{{ project.description }}</p>
</a>
{% endfor %}
</div>

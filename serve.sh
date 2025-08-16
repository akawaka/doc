#!/bin/bash

# Development server script for Akawaka Documentation Hub
# This script helps with local development and testing

echo "🚀 Starting Akawaka Documentation Hub development server..."

# Check if bundle is installed
if ! command -v bundle &> /dev/null; then
    echo "❌ Bundler not found. Please install it first:"
    echo "   gem install bundler"
    exit 1
fi

# Install dependencies if needed
if [ ! -f "Gemfile.lock" ]; then
    echo "📦 Installing dependencies..."
    bundle install
fi

# Start the Jekyll server
echo "🌐 Starting Jekyll server at http://localhost:4000/doc/"
echo "   Press Ctrl+C to stop the server"
echo ""

bundle exec jekyll serve --baseurl "/doc" --livereload --drafts --future
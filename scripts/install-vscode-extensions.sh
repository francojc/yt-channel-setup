#!/bin/bash

# VS Code Extensions Installation Script
# Auto-generated from vscode-extensions.md

set -e

echo "🔧 Installing VS Code extensions for YouTube content creation..."

# Check if VS Code CLI is available
if ! command -v code &> /dev/null; then
  echo "❌ VS Code CLI not found. Please install VS Code and enable shell command."
  echo "   VS Code → Command Palette → 'Shell Command: Install code command in PATH'"
  exit 1
fi

# Essential Extensions
echo "📦 Installing essential extensions..."

# Editor Enhancement
code --install-extension vscodevim.vim

# AI/ML Related
code --install-extension GitHub.copilot
code --install-extension GitHub.copilot-chat

# Markdown & Documentation
code --install-extension yzhang.markdown-all-in-one
code --install-extension bierner.markdown-preview-github-styles

# General Productivity
code --install-extension esbenp.prettier-vscode
code --install-extension streetsidesoftware.code-spell-checker

echo "🎨 Installing content creation extensions..."

# Themes for recording
code --install-extension monokai.theme-monokai-pro-vscode
code --install-extension GitHub.github-vscode-theme

# Better visibility for tutorials
code --install-extension oderwat.indent-rainbow
code --install-extension aaron-bond.better-comments
code --install-extension PKief.material-icon-theme

# Screen Recording & Presentation
code --install-extension johnpapa.vscode-peacock
code --install-extension ritwickdey.LiveServer

echo "✅ All VS Code extensions installed successfully!"
echo "🔄 Restart VS Code to activate all extensions."

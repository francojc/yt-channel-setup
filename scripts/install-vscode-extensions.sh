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

# Python Development
code --install-extension ms-python.python
code --install-extension ms-python.vscode-pylance
code --install-extension ms-toolsai.jupyter

# AI/ML Related
code --install-extension GitHub.copilot
code --install-extension GitHub.copilot-chat

# Markdown & Documentation
code --install-extension yzhang.markdown-all-in-one
code --install-extension bierner.markdown-preview-github-styles

# Git
code --install-extension eamodio.gitlens
code --install-extension mhutchie.git-graph

# General Productivity
code --install-extension esbenp.prettier-vscode
code --install-extension streetsidesoftware.code-spell-checker
code --install-extension wayou.vscode-todo-highlight
code --install-extension gruntfuggly.todo-tree
code --install-extension ms-vscode.live-server
code --install-extension formulahendry.auto-rename-tag

# File Management
code --install-extension sleistner.vscode-fileutils
code --install-extension alexcvzz.vscode-sqlite

# R Development (for academic users)
code --install-extension REditorSupport.r
code --install-extension quarto-dev.quarto

# Code Quality & Linting
code --install-extension ms-python.flake8
code --install-extension charliermarsh.ruff
code --install-extension bradlc.vscode-tailwindcss

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
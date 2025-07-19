# Basic Development Environment Setup

This repository contains scripts and configuration files to quickly set up a clean, standard macOS development environment for content creation and demonstrations.

## Purpose

This setup creates a consistent, "vanilla" development environment that represents what typical users might have on their machines, perfect for:
- Testing tutorials and demonstrations
- Running AI/ML demos locally
- Development work in a clean environment
- Ensuring content works for the target audience

## Quick Start

1. Install Xcode developer tools (required for most installations):
   ```bash
   xcode-select --install
   ```

2. Clone this repository:
   ```bash
   git clone https://github.com/francojc/yt-channel-setup.git
   cd yt-channel-setup
   ```

3. Run the setup script:
   ```bash
   chmod +x setup.sh
   ./setup.sh
   ```

4. Follow the interactive prompts to customize your installation.

## What's Included

### Software Stack

- **Development**: Visual Studio Code, Ghostty, Git
- **AI/ML Tools**: Ollama, LM Studio, Python
- **Security**: Bitwarden (desktop app and CLI)
- **Utilities**: Rectangle, BetterDisplay, Obsidian
- **Terminal Enhancements**: Starship, Atuin, FZF, Zoxide, Yazi, ZSH plugins
- **Browsers**: Chromium, Zen Browser

### Configuration Files

- `Brewfile` - Homebrew bundle for all applications
- `settings/` - Standard configurations for common tools
- `scripts/` - Utility scripts for environment setup

## Features

### 💻 VS Code Configuration

- **Optimized settings**: Monokai theme, larger fonts (13px), vim extension
- **Automatic extension installation**: Development and productivity tools
- **Workspace recommendations**: Extensions automatically suggested in projects

### 🖥️ macOS Optimization

- **Auto-hide dock and menu bar**: Maximum screen real estate
- **Organized dock layout**: Grouped by function (Development, Productivity)
- **Modern terminal**: Starship prompt, Atuin history, FZF fuzzy finder, Zoxide navigation

### 🛠️ Terminal Enhancements

- **Yazi file manager**: Enhanced `y()` function for directory-aware navigation
- **Modern aliases**: `eza` for `ls`, `bat` for `cat`, `z` for smart directory jumping
- **Productivity shortcuts**: Git aliases, development shortcuts

## Manual Steps After Installation

1. **Visual Studio Code**
   - Extensions are automatically installed via setup script
   - Settings are automatically applied for development work
   - Restart VS Code to activate all extensions

2. **Terminal Setup**
   - Restart terminal or run `source ~/.zshrc` to activate enhancements
   - Use `y` to open Yazi file manager with directory navigation
   - Use `z <partial-name>` for smart directory jumping

3. **Ollama Setup**
   - Pull commonly used models: `ollama pull llama2`

4. **Bitwarden Setup**
   - Create a Bitwarden account and verify your email
   - Install the browser extension: Open Chromium → Chrome Web Store → Search "Bitwarden Password Manager" → Click "Add to Chrome"
   - Log into the extension using your Bitwarden credentials

## Testing Checklist

Before using the environment, verify:
- [ ] All terminal commands work in standard Terminal.app
- [ ] Python environments activate correctly
- [ ] AI tools run without specialized configurations
- [ ] Development tools are properly configured

## Maintenance

To update all tools:

```bash
brew update && brew upgrade
brew bundle check
```

To reset to clean state:

```bash
./scripts/reset-environment.sh
```

## Complete Uninstall

To completely remove all tools and configurations installed by this setup:

```bash
./scripts/uninstall.sh
```

**Warning**: This will remove ALL applications and configurations installed by this setup. The script includes:
- Removal of all Homebrew packages from the Brewfile
- Cleanup of configuration files and directories
- Option to completely remove Homebrew itself
- Safe prompts before each major action

This is ideal for students who want to completely clean their systems after using the setup for coursework.

## Target Audience Profile

This environment assumes:

- Users with basic technical literacy
- macOS users who prefer GUI tools when available
- Interest in development and AI/ML tools
- Standard MacBook Air/Pro configurations

## Contributing

If you discover tools or configurations that better represent the standard development environment, please submit a PR or open an issue.

## Recent Updates

### Latest Changes

- **Removed video production tools**: Focused on basic development environment
- **Auto-hide UI elements**: Dock and menu bar automatically hide for cleaner interface
- **Enhanced Yazi integration**: Improved `y()` function with proper directory navigation
- **Font size optimization**: VS Code fonts adjusted to 13px for better readability
- **VS Code extensions**: Automated installation of productivity and development tools
- **Dock organization**: Logical grouping of applications by function

### Changelog

- `8d70594` - Add auto-hide settings for dock and menu bar
- `3a2f8e0` - Update VS Code font size for better video visibility
- `1a04452` - Add VS Code extension installation script and integration
- `1e7700a` - Enhance VS Code configuration for content creation
- `f1fab0f` - Add comprehensive dock configuration system

## License

MIT License - Feel free to adapt for your own content creation needs.

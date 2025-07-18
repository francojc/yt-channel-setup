# YouTube Channel Setup Environment

This repository contains scripts and configuration files to quickly set up a standard macOS environment for creating YouTube content about AI education for non-programmers.

## Purpose

This setup creates a consistent, "vanilla" environment that represents what typical academic users might have on their machines, perfect for:
- Testing tutorials and demonstrations
- Recording screen content with standard tools
- Running AI/ML demos locally
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

- **Video Production**: OBS Studio, Audacity, HandBrake, KeyCastr
- **Audio Routing**: BlackHole, Loopback
- **Development**: Visual Studio Code, Ghostty, Git
- **AI/ML Tools**: Ollama, LM Studio, Miniconda, Python
- **Security**: Bitwarden (desktop app and CLI)
- **Utilities**: Rectangle, BetterDisplay, Obsidian
- **Terminal Enhancements**: Starship, Atuin, FZF, Zoxide, Yazi, ZSH plugins
- **Browsers**: Chromium, Zen Browser

### Configuration Files

- `Brewfile` - Homebrew bundle for all applications
- `settings/` - Standard configurations for common tools
- `scripts/` - Utility scripts for environment setup
- `settings/obs/` - Pre-configured OBS templates for YouTube beginners

## Features

### 🎬 OBS Studio Templates
- **Pre-configured YouTube scenes**: Screen Recording, Webcam Only, Screen + Webcam, Starting Soon
- **Optimized profile**: 1080p30, hardware encoding, 6000kbps bitrate
- **Automatic setup**: Run `./scripts/setup-obs-templates.sh` for instant configuration
- **Beginner-friendly**: Ready-to-use templates with professional layouts

### 💻 VS Code Configuration
- **YouTube-optimized settings**: Monokai theme, larger fonts (13px), vim extension
- **Automatic extension installation**: Development, productivity, and content creation tools
- **Workspace recommendations**: Extensions automatically suggested in projects

### 🖥️ macOS Optimization
- **Auto-hide dock and menu bar**: Maximum screen real estate for recordings
- **Organized dock layout**: Grouped by function (Content Creation, Development, Productivity)
- **Modern terminal**: Starship prompt, Atuin history, FZF fuzzy finder, Zoxide navigation

### 🛠️ Terminal Enhancements
- **Yazi file manager**: Enhanced `y()` function for directory-aware navigation
- **Modern aliases**: `eza` for `ls`, `bat` for `cat`, `z` for smart directory jumping
- **Productivity shortcuts**: Git aliases, YouTube project helpers, development shortcuts

## Manual Steps After Installation

1. **OBS Studio Configuration**
   - Templates are automatically installed and configured
   - Configure your webcam and microphone devices in OBS
   - Test recording with the "Screen + Webcam" scene

2. **Visual Studio Code**
   - Extensions are automatically installed via setup script
   - Settings are automatically applied for YouTube content creation
   - Restart VS Code to activate all extensions

3. **Terminal Setup**
   - Restart terminal or run `source ~/.zshrc` to activate enhancements
   - Use `y` to open Yazi file manager with directory navigation
   - Use `z <partial-name>` for smart directory jumping

4. **Ollama Setup**
   - Pull commonly used models: `ollama pull llama2`

5. **Bitwarden Setup**
   - Create a Bitwarden account and verify your email
   - Install the browser extension: Open Chromium → Chrome Web Store → Search "Bitwarden Password Manager" → Click "Add to Chrome"
   - Log into the extension using your Bitwarden credentials

## Testing Checklist

Before recording any tutorial, verify:
- [ ] All terminal commands work in standard Terminal.app
- [ ] Python environments activate correctly
- [ ] AI tools run without specialized configurations
- [ ] Screen recording captures audio properly

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

- Academic users with basic technical literacy
- macOS users who prefer GUI tools when available
- Interest in AI/ML without programming background
- Standard MacBook Air/Pro configurations

## Contributing

If you discover tools or configurations that better represent the standard academic user environment, please submit a PR or open an issue.

## Recent Updates

### Latest Changes

- **Auto-hide UI elements**: Dock and menu bar automatically hide for cleaner recordings
- **Enhanced Yazi integration**: Improved `y()` function with proper directory navigation
- **Font size optimization**: VS Code fonts adjusted to 13px for better video readability
- **OBS templates**: Complete beginner-friendly setup with 4 pre-configured scenes
- **VS Code extensions**: Automated installation of productivity and development tools
- **Dock organization**: Logical grouping of applications by function

### Changelog

- `8d70594` - Add auto-hide settings for dock and menu bar
- `3a2f8e0` - Update VS Code font size for better video visibility
- `3215109` - Add comprehensive OBS Studio templates for YouTube beginners
- `1a04452` - Add VS Code extension installation script and integration
- `1e7700a` - Enhance VS Code configuration for YouTube content creation
- `f1fab0f` - Add comprehensive dock configuration system

## License

MIT License - Feel free to adapt for your own content creation needs.

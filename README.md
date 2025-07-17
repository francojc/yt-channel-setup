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
- **Utilities**: Rectangle, BetterDisplay, Obsidian
- **Browsers**: Chromium

### Configuration Files

- `Brewfile` - Homebrew bundle for all applications
- `settings/` - Standard configurations for common tools
- `scripts/` - Utility scripts for environment setup

## Manual Steps After Installation

1. **OBS Studio Configuration**
   - Import the provided scene collection from `settings/obs-scenes.json`
   - Configure audio inputs with BlackHole/Loopback

2. **Visual Studio Code**
   - Install recommended extensions for Python and AI development
   - Apply standard settings from `settings/vscode-settings.json`

3. **Ollama Setup**
   - Pull commonly used models: `ollama pull llama2`

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

## Target Audience Profile

This environment assumes:
- Academic users with basic technical literacy
- macOS users who prefer GUI tools when available
- Interest in AI/ML without programming background
- Standard MacBook Air/Pro configurations

## Contributing

If you discover tools or configurations that better represent the standard academic user environment, please submit a PR or open an issue.

## License

MIT License - Feel free to adapt for your own content creation needs.

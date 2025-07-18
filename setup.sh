#!/bin/bash

# YouTube Channel Setup Script
# This script sets up a standard macOS environment for YouTube content creation

set -euo pipefail

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Functions
print_header() {
    echo -e "\n${GREEN}===================================${NC}"
    echo -e "${GREEN}$1${NC}"
    echo -e "${GREEN}===================================${NC}\n"
}

print_info() {
    echo -e "${YELLOW}ℹ ${NC} $1"
}

print_success() {
    echo -e "${GREEN}✓${NC} $1"
}

print_error() {
    echo -e "${RED}✗${NC} $1"
}

# Check if running on macOS
if [[ "$OSTYPE" != "darwin"* ]]; then
    print_error "This script is designed for macOS only."
    exit 1
fi

print_header "YouTube Channel Environment Setup"

# Check for Homebrew
print_info "Checking for Homebrew..."
if ! command -v brew &> /dev/null; then
    print_info "Homebrew not found. Installing..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Add Homebrew to PATH for Apple Silicon Macs
    if [[ -f "/opt/homebrew/bin/brew" ]]; then
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
else
    print_success "Homebrew is installed"
fi

# Update Homebrew
print_info "Updating Homebrew..."
brew update

# Install from Brewfile and cleanup old packages
print_header "Installing Applications"
print_info "Installing applications from Brewfile..."
brew bundle --file=Brewfile

print_info "Cleaning up packages not in Brewfile..."
if brew bundle cleanup --file=Brewfile --force; then
    print_success "Package cleanup completed"
else
    print_error "Package cleanup failed"
fi

# Create necessary directories
print_header "Setting Up Directory Structure"
mkdir -p ~/.config/{obs-studio,vscode}
print_success "Created configuration directories"

# Configure Git (if not already configured)
if ! git config --global user.name &> /dev/null; then
    print_header "Git Configuration"
    echo "Please enter your Git configuration details:"
    read -p "Git username: " git_username
    read -p "Git email: " git_email
    git config --global user.name "$git_username"
    git config --global user.email "$git_email"
    print_success "Git configured"
fi

# Configure ZSH enhancements
print_header "ZSH Configuration"

# Create .zshrc if it doesn't exist
if [[ ! -f ~/.zshrc ]]; then
    print_info "Creating .zshrc file..."
    touch ~/.zshrc
    print_success ".zshrc file created"
else
    print_info "Backing up existing .zshrc..."
    cp ~/.zshrc ~/.zshrc.backup.$(date +%Y%m%d_%H%M%S)
    print_success "Backup created"
fi

print_info "Adding YouTube channel ZSH configuration..."
if ! grep -q "# YouTube Channel Setup - ZSH" ~/.zshrc 2>/dev/null; then
    cat >> ~/.zshrc << 'EOF'

# YouTube Channel Setup - ZSH Configuration
if [[ -f "$HOME/.config/youtube-zsh-config.zsh" ]]; then
    source "$HOME/.config/youtube-zsh-config.zsh"
fi
EOF
    print_success "ZSH configuration added to .zshrc"
else
    print_info "ZSH configuration already present in .zshrc"
fi

# Copy ZSH config to user's config directory
if [[ -f "settings/youtube-zsh-config.zsh" ]]; then
    cp settings/youtube-zsh-config.zsh ~/.config/youtube-zsh-config.zsh
    print_success "ZSH configuration copied to ~/.config/"
fi

# Copy Starship configuration
if [[ -f "settings/starship.toml" ]]; then
    cp settings/starship.toml ~/.config/starship.toml
    print_success "Starship configuration copied to ~/.config/"
fi

# Copy Atuin configuration
if [[ -f "settings/atuin-config.toml" ]]; then
    mkdir -p ~/.config/atuin
    cp settings/atuin-config.toml ~/.config/atuin/config.toml
    print_success "Atuin configuration copied to ~/.config/atuin/"
fi

# Configure Dock
print_header "Dock Configuration"
print_info "Setting up optimized dock layout for YouTube content creation..."

# Check if dockutil is available
if command -v dockutil &> /dev/null; then
    # Remove all existing dock items to start fresh
    print_info "Clearing existing dock items..."
    dockutil --remove all --no-restart
    
    # Add applications in logical order
    print_info "Adding content creation applications..."
    dockutil --add /Applications/OBS.app --no-restart
    dockutil --add /Applications/Audacity.app --no-restart
    dockutil --add /Applications/HandBrake.app --no-restart
    
    # Add spacer
    dockutil --add '' --type spacer --section apps --no-restart
    
    print_info "Adding development tools..."
    dockutil --add /Applications/Visual\ Studio\ Code.app --no-restart
    dockutil --add /Applications/Ghostty.app --no-restart
    dockutil --add /Applications/GitHub\ Desktop.app --no-restart
    
    # Add spacer
    dockutil --add '' --type spacer --section apps --no-restart
    
    print_info "Adding productivity applications..."
    dockutil --add /Applications/Obsidian.app --no-restart
    dockutil --add /Applications/Rectangle.app --no-restart
    dockutil --add /Applications/Bitwarden.app --no-restart
    
    # Add spacer
    dockutil --add '' --type spacer --section apps --no-restart
    
    print_info "Adding browsers..."
    dockutil --add /Applications/Chromium.app --no-restart
    dockutil --add /Applications/Zen.app --no-restart
    
    # Add spacer
    dockutil --add '' --type spacer --section apps --no-restart
    
    print_info "Adding AI tools..."
    dockutil --add /Applications/Ollama.app --no-restart
    dockutil --add /Applications/LM\ Studio.app --no-restart
    
    # Add common folders
    print_info "Adding useful folders..."
    dockutil --add ~/Downloads --view grid --display folder --no-restart
    dockutil --add ~/Documents --view grid --display folder --no-restart
    dockutil --add /Applications --view grid --display folder --no-restart
    
    # Configure dock and menu bar settings for YouTube recording
    print_info "Configuring dock and menu bar settings..."
    defaults write com.apple.dock tilesize -int 48
    defaults write com.apple.dock magnification -bool true
    defaults write com.apple.dock largesize -int 64
    defaults write com.apple.dock orientation -string "bottom"
    defaults write com.apple.dock autohide -bool true
    
    # Auto-hide menu bar for cleaner recordings
    defaults write NSGlobalDomain _HIHideMenuBar -bool true
    
    # Restart dock and menu bar to apply changes
    killall Dock
    killall SystemUIServer
    
    print_success "Dock configuration completed"
else
    print_error "dockutil not found - dock configuration skipped"
fi

# Copy configuration files
print_header "Applying Configurations"
if [ -d "settings" ]; then
    print_info "Copying configuration files..."

    # VS Code settings
    if [ -f "settings/vscode-settings.json" ]; then
        mkdir -p ~/Library/Application\ Support/Code/User
        cp settings/vscode-settings.json ~/Library/Application\ Support/Code/User/settings.json
        print_success "VS Code settings applied"
    fi

    # OBS settings (if exists)
    if [ -f "settings/obs-scenes.json" ]; then
        cp settings/obs-scenes.json ~/Library/Application\ Support/obs-studio/
        print_success "OBS scene collection copied"
    fi
fi

# Install VS Code extensions
print_header "VS Code Extensions"
if [ -f "scripts/install-vscode-extensions.sh" ]; then
    print_info "Installing VS Code extensions..."
    if command -v code &> /dev/null; then
        ./scripts/install-vscode-extensions.sh
        print_success "VS Code extensions installed"
    else
        print_error "VS Code CLI not available - extensions skipped"
        print_info "Install VS Code CLI: VS Code → Command Palette → 'Shell Command: Install code command in PATH'"
    fi
else
    print_error "Extension installation script not found"
fi

# Setup OBS templates
print_header "OBS Studio Templates"
if [ -f "scripts/setup-obs-templates.sh" ]; then
    print_info "Installing OBS templates for YouTube content creation..."
    if [ -d "/Applications/OBS.app" ]; then
        ./scripts/setup-obs-templates.sh
        print_success "OBS templates installed"
    else
        print_error "OBS Studio not found - templates skipped"
        print_info "OBS should have been installed via Homebrew. Check the installation."
    fi
else
    print_error "OBS template setup script not found"
fi

# Final setup instructions
print_header "Setup Complete!"
echo "Next steps:"
echo "1. Restart your terminal or run 'source ~/.zshrc' to activate ZSH enhancements"
echo "2. Restart VS Code to activate all extensions and settings"
echo "3. Launch OBS Studio - templates should be automatically loaded"
echo "4. Configure your devices in OBS (webcam and microphone)"
echo "5. Test recording with the 'Screen + Webcam' scene"
echo "6. Configure audio routing in Loopback (optional)"
echo "7. Set up Camo with your iPhone (if using)"
echo ""
echo "ZSH enhancements installed:"
echo "• Starship - Modern prompt with git status and language info"
echo "• Atuin - Better history search with fuzzy matching"
echo "• FZF - Fuzzy finder for files and commands"
echo "• Zoxide - Smart directory jumping with 'z' command"
echo "• Yazi - Terminal file manager with 'y' command"
echo "• Syntax highlighting - Commands highlighted as you type"
echo "• Autosuggestions - Suggestions based on history"
echo "• Modern aliases - eza for ls, bat for cat, etc."
echo ""
echo "Dock configuration:"
echo "• Organized layout optimized for YouTube content creation"
echo "• Grouped by function: Content Creation, Development, Productivity, Browsers, AI Tools"
echo "• Includes useful folders: Downloads, Documents, Applications"
echo "• Run './scripts/reset-dock.sh' to reset dock layout anytime"
echo ""
echo "OBS Studio templates:"
echo "• 4 pre-configured scenes ready for immediate use"
echo "• Optimized 1080p30 recording settings with hardware encoding"
echo "• Professional layouts: Screen Recording, Webcam Only, Screen + Webcam, Starting Soon"
echo "• Quick start guide: settings/obs/README.md"
echo ""
echo "Run './scripts/verify-setup.sh' to check your environment"

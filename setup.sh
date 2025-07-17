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
if brew bundle cleanup --file=Brewfile; then
    print_success "Package cleanup completed"
else
    print_info "Use 'brew bundle cleanup --file=Brewfile --force' to remove unlisted packages"
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
if [[ -f ~/.zshrc ]]; then
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



# Copy configuration files
print_header "Applying Configurations"
if [ -d "settings" ]; then
    print_info "Copying configuration files..."

    # VS Code settings
    if [ -f "settings/vscode-settings.json" ]; then
        cp settings/vscode-settings.json ~/Library/Application\ Support/Code/User/settings.json
        print_success "VS Code settings applied"
    fi

    # OBS settings (if exists)
    if [ -f "settings/obs-scenes.json" ]; then
        cp settings/obs-scenes.json ~/Library/Application\ Support/obs-studio/
        print_success "OBS scene collection copied"
    fi
fi

# Final setup instructions
print_header "Setup Complete!"
echo "Next steps:"
echo "1. Restart your terminal or run 'source ~/.zshrc' to activate ZSH enhancements"
echo "2. Open OBS Studio and configure your scenes"
echo "3. Configure audio routing in Loopback"
echo "4. Test screen recording with OBS"
echo "5. Set up Camo with your iPhone (if using)"
echo ""
echo "ZSH enhancements installed:"
echo "• Starship - Modern prompt with git status and language info"
echo "• Atuin - Better history search with fuzzy matching"
echo "• Syntax highlighting - Commands highlighted as you type"
echo "• Autosuggestions - Suggestions based on history"
echo "• Modern aliases - eza for ls, bat for cat, etc."
echo ""
echo "Run './scripts/verify-setup.sh' to check your environment"

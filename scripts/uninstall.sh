#!/bin/bash

# YouTube Channel Setup - Complete Uninstall Script
# This script safely removes all tools and configurations installed by the setup

set -euo pipefail

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

print_error() {
    echo -e "${RED}✗${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}⚠${NC}  $1"
}

print_success() {
    echo -e "${GREEN}✓${NC} $1"
}

print_info() {
    echo -e "${BLUE}ℹ${NC}  $1"
}

confirm_action() {
    local message="$1"
    echo -e "${YELLOW}$message${NC}"
    read -p "Continue? (y/N): " -n 1 -r
    echo ""
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        return 1
    fi
    return 0
}

# Script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"
BREWFILE="$PROJECT_DIR/Brewfile"

echo "YouTube Channel Setup - Complete Uninstall"
echo "=========================================="
echo ""

print_warning "This script will remove ALL applications and tools installed by this setup."
print_warning "This includes:"
echo "  • All Homebrew packages from the Brewfile"
echo "  • Associated configuration files and directories"
echo "  • Option to remove Homebrew itself"
echo ""
print_warning "This action cannot be undone!"
echo ""

if ! confirm_action "Are you sure you want to proceed with the uninstall?"; then
    print_info "Uninstall cancelled."
    exit 0
fi

# Check if Brewfile exists
if [[ ! -f "$BREWFILE" ]]; then
    print_error "Brewfile not found at $BREWFILE"
    exit 1
fi

# Check if Homebrew is installed
if ! command -v brew &> /dev/null; then
    print_warning "Homebrew is not installed or not in PATH"
    print_info "Some manual cleanup may be required"
else
    print_info "Found Homebrew installation"
fi

echo ""
print_info "Step 1: Removing Homebrew packages from Brewfile"
echo "=================================================="

# Extract package names from Brewfile
brew_packages=($(grep '^brew ' "$BREWFILE" | sed 's/brew "\(.*\)".*/\1/' | sed 's/brew \(.*\)/\1/'))
cask_packages=($(grep '^cask ' "$BREWFILE" | sed 's/cask "\(.*\)".*/\1/' | sed 's/cask \(.*\)/\1/'))

# Remove cask applications first
if [[ ${#cask_packages[@]} -gt 0 ]]; then
    print_info "Removing cask applications..."
    for package in "${cask_packages[@]}"; do
        if brew list --cask "$package" &> /dev/null; then
            print_info "Removing cask: $package"
            brew uninstall --cask "$package" --force 2>/dev/null || print_warning "Failed to remove $package"
        else
            print_warning "Cask not installed: $package"
        fi
    done
fi

# Remove brew packages
if [[ ${#brew_packages[@]} -gt 0 ]]; then
    print_info "Removing brew packages..."
    for package in "${brew_packages[@]}"; do
        if brew list "$package" &> /dev/null; then
            print_info "Removing brew: $package"
            brew uninstall "$package" --force 2>/dev/null || print_warning "Failed to remove $package"
        else
            print_warning "Package not installed: $package"
        fi
    done
fi

print_success "Homebrew packages removal complete"

echo ""
print_info "Step 2: Removing configuration files and directories"
echo "===================================================="

# Remove configuration directories and files
config_items=(
    "$HOME/Library/Application Support/Code/User/settings.json.youtube-setup"
    "$HOME/Library/Application Support/obs-studio"
    "$HOME/Library/Application Support/Chromium/Default/Extensions"
    "$HOME/Documents/YouTube"
    "$HOME/.ollama"
    "$HOME/.conda"
    "$HOME/.miniconda3"
    "$HOME/Library/Application Support/Obsidian"
    "$HOME/Library/Application Support/BetterDisplay"
    "$HOME/Library/Application Support/Bitwarden"
    "$HOME/Library/Application Support/KeyCastr"
    "$HOME/Library/Application Support/Camo"
    "$HOME/Library/Application Support/Ghostty"
    "$HOME/Library/Application Support/LM Studio"
    "$HOME/Library/Application Support/Rectangle"
    "$HOME/Library/Application Support/Loopback"
    "$HOME/Library/Application Support/BlackHole"
    "$HOME/Library/Application Support/Audacity"
    "$HOME/Library/Application Support/HandBrake"
)

for item in "${config_items[@]}"; do
    if [[ -e "$item" ]]; then
        if confirm_action "Remove $item?"; then
            rm -rf "$item"
            print_success "Removed: $item"
        else
            print_info "Skipped: $item"
        fi
    else
        print_info "Not found: $item"
    fi
done

# Remove Python environments
if [[ -d "$HOME/.conda" ]] || [[ -d "$HOME/miniconda3" ]]; then
    if confirm_action "Remove conda/miniconda environments?"; then
        rm -rf "$HOME/.conda" "$HOME/miniconda3" "$HOME/.miniconda3"
        print_success "Removed conda environments"
    fi
fi

# Clean up Application aliases in /Applications
app_aliases=(
    "OBS.app"
    "Audacity.app"
    "HandBrake.app"
    "Rectangle.app"
    "BlackHole 2ch.app"
    "Loopback.app"
    "Visual Studio Code.app"
    "Ghostty.app"
    "GitHub Desktop.app"
    "Ollama.app"
    "LM Studio.app"
    "Chromium.app"
    "Obsidian.app"
    "BetterDisplay.app"
    "Bitwarden.app"
    "KeyCastr.app"
    "Camo.app"
)

print_info "Checking for application aliases in /Applications..."
for app in "${app_aliases[@]}"; do
    if [[ -e "/Applications/$app" ]]; then
        if confirm_action "Remove /Applications/$app?"; then
            rm -rf "/Applications/$app"
            print_success "Removed: /Applications/$app"
        fi
    fi
done

echo ""
print_info "Step 3: Optional Homebrew removal"
echo "=================================="

if command -v brew &> /dev/null; then
    print_warning "Homebrew is still installed on your system."
    print_info "You can:"
    echo "  1. Keep Homebrew for other uses"
    echo "  2. Completely remove Homebrew"
    echo ""
    
    if confirm_action "Do you want to completely remove Homebrew?"; then
        print_warning "This will remove ALL Homebrew packages and Homebrew itself!"
        if confirm_action "Are you absolutely sure?"; then
            # Official Homebrew uninstall script
            /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"
            print_success "Homebrew has been completely removed"
        fi
    else
        print_info "Keeping Homebrew installed"
        print_info "You can run 'brew cleanup' to remove unused dependencies"
    fi
else
    print_info "Homebrew is not installed or already removed"
fi

echo ""
print_info "Step 4: Final cleanup"
echo "===================="

# Remove project-specific files
if confirm_action "Remove this project directory ($PROJECT_DIR)?"; then
    cd "$HOME"
    rm -rf "$PROJECT_DIR"
    print_success "Project directory removed"
else
    print_info "Project directory kept"
fi

# Clean up shells
print_info "Cleaning up shell configurations..."
shell_configs=(
    "$HOME/.zshrc"
    "$HOME/.bashrc"
    "$HOME/.bash_profile"
)

for config in "${shell_configs[@]}"; do
    if [[ -f "$config" ]]; then
        # Remove conda/miniconda initialization
        if grep -q "conda initialize" "$config"; then
            print_info "Removing conda initialization from $config"
            sed -i.bak '/# >>> conda initialize >>>/,/# <<< conda initialize <<</d' "$config"
        fi
        
        # Remove any YouTube setup specific exports
        if grep -q "# YouTube Channel Setup" "$config"; then
            print_info "Removing YouTube setup exports from $config"
            sed -i.bak '/# YouTube Channel Setup/,/# End YouTube Channel Setup/d' "$config"
        fi
    fi
done

# Empty trash
if confirm_action "Empty Trash?"; then
    osascript -e 'tell app "Finder" to empty the trash'
    print_success "Trash emptied"
fi

echo ""
print_success "Uninstall complete!"
echo ""
print_info "Summary:"
echo "• Removed all Homebrew packages from Brewfile"
echo "• Cleaned up configuration files and directories"
echo "• Removed application aliases"
echo "• Cleaned up shell configurations"
echo ""
print_info "Your system has been restored to its pre-setup state."
print_warning "Please restart your terminal or run 'source ~/.zshrc' to refresh your shell."
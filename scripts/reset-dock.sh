#!/bin/bash

# YouTube Channel Setup - Dock Reset Script
# This script provides options to reset the dock configuration

set -euo pipefail

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

print_header() {
    echo -e "\n${GREEN}===================================${NC}"
    echo -e "${GREEN}$1${NC}"
    echo -e "${GREEN}===================================${NC}\n"
}

print_info() {
    echo -e "${BLUE}ℹ ${NC} $1"
}

print_success() {
    echo -e "${GREEN}✓${NC} $1"
}

print_error() {
    echo -e "${RED}✗${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}⚠${NC}  $1"
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

# Check if dockutil is available
if ! command -v dockutil &> /dev/null; then
    print_error "dockutil is not installed. Please install it first:"
    echo "  brew install dockutil"
    exit 1
fi

print_header "YouTube Channel Setup - Dock Reset"

echo "Choose an option:"
echo "1. Reset to YouTube Channel Setup dock layout"
echo "2. Reset to macOS default dock layout"
echo "3. Clear all dock items"
echo "4. Exit"
echo ""

read -p "Enter your choice (1-4): " choice

case $choice in
    1)
        print_info "Resetting to YouTube Channel Setup dock layout..."
        
        # Remove all existing dock items
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
        
        # Configure dock settings
        print_info "Configuring dock settings..."
        defaults write com.apple.dock tilesize -int 48
        defaults write com.apple.dock magnification -bool true
        defaults write com.apple.dock largesize -int 64
        defaults write com.apple.dock orientation -string "bottom"
        defaults write com.apple.dock autohide -bool false
        
        # Restart dock
        killall Dock
        
        print_success "YouTube Channel Setup dock layout restored"
        ;;
    2)
        print_info "Resetting to macOS default dock layout..."
        
        if confirm_action "This will restore the default macOS dock layout. Continue?"; then
            # Remove all existing dock items
            dockutil --remove all --no-restart
            
            # Add default macOS applications
            print_info "Adding default macOS applications..."
            dockutil --add /System/Applications/Finder.app --no-restart
            dockutil --add /System/Applications/Launchpad.app --no-restart
            dockutil --add /System/Applications/Safari.app --no-restart
            dockutil --add /System/Applications/Mail.app --no-restart
            dockutil --add /System/Applications/Maps.app --no-restart
            dockutil --add /System/Applications/Photos.app --no-restart
            dockutil --add /System/Applications/FaceTime.app --no-restart
            dockutil --add /System/Applications/Calendar.app --no-restart
            dockutil --add /System/Applications/Contacts.app --no-restart
            dockutil --add /System/Applications/Reminders.app --no-restart
            dockutil --add /System/Applications/Notes.app --no-restart
            dockutil --add /System/Applications/Freeform.app --no-restart
            dockutil --add /System/Applications/TV.app --no-restart
            dockutil --add /System/Applications/Music.app --no-restart
            dockutil --add /System/Applications/Podcasts.app --no-restart
            dockutil --add /System/Applications/News.app --no-restart
            dockutil --add /System/Applications/App\ Store.app --no-restart
            dockutil --add /System/Applications/System\ Preferences.app --no-restart
            
            # Add Downloads folder
            dockutil --add ~/Downloads --view grid --display folder --no-restart
            
            # Reset dock settings to defaults
            defaults write com.apple.dock tilesize -int 48
            defaults write com.apple.dock magnification -bool false
            defaults write com.apple.dock largesize -int 128
            defaults write com.apple.dock orientation -string "bottom"
            defaults write com.apple.dock autohide -bool false
            
            # Restart dock
            killall Dock
            
            print_success "Default macOS dock layout restored"
        else
            print_info "Operation cancelled"
        fi
        ;;
    3)
        print_info "Clearing all dock items..."
        
        if confirm_action "This will remove ALL items from the dock. Continue?"; then
            dockutil --remove all
            print_success "All dock items removed"
        else
            print_info "Operation cancelled"
        fi
        ;;
    4)
        print_info "Exiting..."
        exit 0
        ;;
    *)
        print_error "Invalid choice. Please select 1-4."
        exit 1
        ;;
esac

echo ""
print_success "Dock reset completed!"
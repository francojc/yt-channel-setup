#!/bin/bash

# Video Production Setup Script (Reference Only)
# This script shows how to set up video production tools on the host machine
# DO NOT run this in VMs - it's for reference and host machine setup only

set -euo pipefail

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

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

print_warning() {
    echo -e "${YELLOW}⚠${NC} $1"
}

# Check if running on macOS
if [[ "$OSTYPE" != "darwin"* ]]; then
    print_error "This script is designed for macOS only."
    exit 1
fi

print_header "Video Production Tools Setup (Host Machine Only)"
print_warning "This script is for REFERENCE ONLY"
print_warning "Do not run in VMs - use on host machine for video production"
echo ""

read -p "Are you setting up the HOST machine for video production? (y/N): " confirm
if [[ $confirm != [yY] ]]; then
    print_info "Setup cancelled. Use the main setup.sh for VM environments."
    exit 0
fi

# Install video production tools
print_header "Installing Video Production Applications"
print_info "Installing from video production Brewfile..."

if [ -f "Brewfile-video-production" ]; then
    brew bundle --file=Brewfile-video-production
    print_success "Video production tools installed"
else
    print_error "Brewfile-video-production not found"
    print_info "Expected location: video-production-reference/Brewfile-video-production"
    exit 1
fi

# Setup OBS Studio templates
print_header "OBS Studio Configuration"
if [ -d "/Applications/OBS.app" ]; then
    print_info "Setting up OBS Studio templates..."
    
    # Create OBS config directory
    mkdir -p ~/Library/Application\ Support/obs-studio/basic/scenes
    mkdir -p ~/Library/Application\ Support/obs-studio/basic/profiles
    
    # Copy OBS configurations
    if [ -f "config/obs-scenes.json" ]; then
        cp config/obs-scenes.json ~/Library/Application\ Support/obs-studio/basic/scenes/
        print_success "OBS scenes imported"
    fi
    
    if [ -f "config/obs-profile.ini" ]; then
        mkdir -p ~/Library/Application\ Support/obs-studio/basic/profiles/YouTube-Beginner-Profile
        cp config/obs-profile.ini ~/Library/Application\ Support/obs-studio/basic/profiles/YouTube-Beginner-Profile/
        print_success "OBS profile imported"
    fi
    
    print_success "OBS Studio configured with YouTube templates"
else
    print_error "OBS Studio not found - check installation"
fi

# Configure audio routing
print_header "Audio Configuration"
if [ -d "/Applications/BlackHole 2ch.app" ] && [ -d "/Applications/Loopback.app" ]; then
    print_info "Audio routing tools installed"
    print_info "Configure BlackHole and Loopback according to your audio setup needs"
    print_success "Audio tools ready for configuration"
else
    print_warning "Some audio tools missing - check Brewfile installation"
fi

# Update dock for video production
print_header "Dock Configuration for Video Production"
if command -v dockutil &> /dev/null; then
    print_info "Adding video production apps to dock..."
    
    # Add video production section
    dockutil --add /Applications/OBS.app --no-restart
    dockutil --add /Applications/Audacity.app --no-restart
    dockutil --add /Applications/HandBrake.app --no-restart
    
    # Add spacer
    dockutil --add '' --type spacer --section apps --no-restart
    
    # Add utility apps
    dockutil --add /Applications/KeyCastr.app --no-restart
    dockutil --add /Applications/Camo\ Studio.app --no-restart
    
    # Restart dock
    killall Dock
    
    print_success "Dock configured for video production"
else
    print_warning "dockutil not available - dock configuration skipped"
fi

# System optimizations for video production
print_header "System Optimizations"
print_info "Applying macOS settings for video production..."

# Disable automatic graphics switching for consistent performance
sudo pmset -c gpuswitch 0 2>/dev/null || print_warning "Could not disable automatic graphics switching"

# Increase file descriptor limits for video processing
echo "kern.maxfiles=65536" | sudo tee -a /etc/sysctl.conf >/dev/null
echo "kern.maxfilesperproc=32768" | sudo tee -a /etc/sysctl.conf >/dev/null

print_success "System optimizations applied"

# Final instructions
print_header "Setup Complete!"
echo "Video production environment configured. Next steps:"
echo ""
echo "1. Launch OBS Studio and select 'YouTube-Beginner-Profile'"
echo "2. Configure your webcam and microphone in OBS settings"
echo "3. Test each scene template (Screen Recording, Webcam Only, etc.)"
echo "4. Set up BlackHole and Loopback for advanced audio routing"
echo "5. Configure KeyCastr for keyboard shortcut display"
echo "6. Test Camo Studio with your iPhone for webcam upgrade"
echo ""
echo "Documentation available in:"
echo "• docs/obs-setup-guide.md - Complete OBS configuration guide"
echo "• config/ - OBS templates and settings"
echo ""
echo "Video Production Tools Installed:"
echo "• OBS Studio - Screen recording and streaming"
echo "• Audacity - Audio editing and recording"
echo "• HandBrake - Video compression and conversion"
echo "• KeyCastr - Keyboard shortcut display"
echo "• Camo Studio - iPhone webcam integration"
echo "• BlackHole - Virtual audio routing"
echo "• Loopback - Advanced audio mixing"
echo ""
print_warning "Remember: This setup is for the HOST machine only"
print_warning "Use the main setup.sh script for VM development environments"
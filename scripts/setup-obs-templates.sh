#!/bin/bash

# OBS Studio Template Setup Script
# Installs pre-configured scenes and profile for YouTube beginners

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Functions
print_header() {
    echo -e "\n${BLUE}===================================${NC}"
    echo -e "${BLUE}$1${NC}"
    echo -e "${BLUE}===================================${NC}\n"
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

print_header "OBS Studio Template Setup"

# Check if OBS Studio is installed
OBS_APP_PATH="/Applications/OBS.app"
if [[ ! -d "$OBS_APP_PATH" ]]; then
    print_error "OBS Studio not found at $OBS_APP_PATH"
    print_info "Please install OBS Studio first:"
    print_info "  • From the App Store, or"
    print_info "  • Download from https://obsproject.com/"
    print_info "  • Run the main setup script which includes OBS installation"
    exit 1
fi

print_success "OBS Studio found"

# Check if template files exist
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
SCENES_FILE="$PROJECT_ROOT/settings/obs/YouTube-Beginner-Scenes.json"
PROFILE_FILE="$PROJECT_ROOT/settings/obs/YouTube-Beginner-Profile.ini"

if [[ ! -f "$SCENES_FILE" ]]; then
    print_error "Scene collection template not found: $SCENES_FILE"
    exit 1
fi

if [[ ! -f "$PROFILE_FILE" ]]; then
    print_error "Profile template not found: $PROFILE_FILE"
    exit 1
fi

print_success "Template files found"

# Create OBS directories if they don't exist
OBS_CONFIG_DIR="$HOME/Library/Application Support/obs-studio"
SCENES_DIR="$OBS_CONFIG_DIR/basic/scenes"
PROFILES_DIR="$OBS_CONFIG_DIR/basic/profiles"

print_info "Creating OBS configuration directories..."
mkdir -p "$SCENES_DIR"
mkdir -p "$PROFILES_DIR"
print_success "Configuration directories ready"

# Check if OBS is currently running
if pgrep -x "OBS" > /dev/null; then
    print_warning "OBS Studio is currently running"
    print_info "Please close OBS Studio before continuing"
    read -p "Press Enter when OBS is closed, or Ctrl+C to cancel..."
fi

# Install Scene Collection
print_info "Installing Scene Collection template..."
SCENES_DEST="$SCENES_DIR/YouTube-Beginner-Scenes.json"
cp "$SCENES_FILE" "$SCENES_DEST"
print_success "Scene Collection installed: $SCENES_DEST"

# Install Profile  
print_info "Installing Profile template..."
PROFILE_DIR="$PROFILES_DIR/YouTube Beginner Profile"
mkdir -p "$PROFILE_DIR"
cp "$PROFILE_FILE" "$PROFILE_DIR/basic.ini"
print_success "Profile installed: $PROFILE_DIR"

# Create recordings directory
RECORDINGS_DIR="$HOME/Movies/OBS Recordings"
mkdir -p "$RECORDINGS_DIR"
print_success "Recordings directory created: $RECORDINGS_DIR"

# Update OBS global config to use new profile (if global.ini exists)
GLOBAL_CONFIG="$OBS_CONFIG_DIR/global.ini"
if [[ -f "$GLOBAL_CONFIG" ]]; then
    print_info "Updating OBS to use YouTube Beginner Profile..."
    
    # Backup existing config
    cp "$GLOBAL_CONFIG" "$GLOBAL_CONFIG.backup.$(date +%Y%m%d_%H%M%S)"
    
    # Update or add profile setting
    if grep -q "^Name=" "$GLOBAL_CONFIG"; then
        sed -i '' 's/^Name=.*/Name=YouTube Beginner Profile/' "$GLOBAL_CONFIG"
    else
        echo "Name=YouTube Beginner Profile" >> "$GLOBAL_CONFIG"
    fi
    
    print_success "OBS configured to use YouTube Beginner Profile"
else
    print_info "Global OBS config not found - will be created on first run"
fi

print_header "Setup Complete!"

echo "✅ Templates successfully installed!"
echo ""
echo "📋 What was installed:"
echo "  • 4 pre-configured scenes (Screen Recording, Webcam Only, Screen + Webcam, Starting Soon)"
echo "  • Optimized profile for YouTube recording (1080p30, hardware encoding)"
echo "  • Recording output directory: $RECORDINGS_DIR"
echo ""
echo "🚀 Next steps:"
echo "1. Launch OBS Studio"
echo "2. Scene Collection should automatically load 'YouTube-Beginner-Scenes'"
echo "3. Profile should be set to 'YouTube Beginner Profile'"
echo "4. Configure your devices:"
echo "   • Webcam: Select your camera in 'Webcam' source properties"
echo "   • Microphone: Select your microphone in 'Microphone' source properties"
echo "5. Grant screen recording permissions if prompted"
echo "6. Test recording with the 'Screen + Webcam' scene"
echo ""
echo "📖 Documentation:"
echo "  • Quick start guide: settings/obs/README.md"
echo "  • Detailed setup guide: settings/obs-setup-guide.md"
echo ""
echo "🎯 Pro tip: Start with the 'Screen + Webcam' scene - it's perfect for most content!"

# Offer to launch OBS
echo ""
read -p "Would you like to launch OBS Studio now? (y/N): " launch_obs
if [[ $launch_obs =~ ^[Yy]$ ]]; then
    print_info "Launching OBS Studio..."
    open "$OBS_APP_PATH"
    print_success "OBS Studio launched!"
fi

print_success "Template setup completed successfully!"
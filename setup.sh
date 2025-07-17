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

# Install from Brewfile
print_header "Installing Applications"
print_info "Installing applications from Brewfile..."
brew bundle --file=Brewfile

# Create necessary directories
print_header "Setting Up Directory Structure"
mkdir -p ~/Documents/YouTube/{Scripts,Recordings,Thumbnails,Projects}
mkdir -p ~/.config/{obs-studio,vscode}
print_success "Created YouTube working directories"

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

# Install Python packages for AI/ML demos
print_header "Python Environment Setup"
if command -v conda &> /dev/null; then
    print_info "Creating conda environment for AI demos..."
    conda create -n youtube-ai python=3.11 -y
    conda activate youtube-ai
    pip install jupyter numpy pandas matplotlib openai
    print_success "Python environment created"
else
    print_info "Conda not found. Please restart your terminal and run this script again."
fi

# Install commonly used Ollama models
print_header "AI Model Setup"
print_info "Pulling common Ollama models..."
ollama pull llama2
ollama pull mistral
print_success "AI models downloaded"

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
echo "1. Open OBS Studio and import the scene collection"
echo "2. Configure audio routing in Loopback"
echo "3. Test screen recording with OBS"
echo "4. Set up Camo with your iPhone (if using)"
echo ""
echo "Run './scripts/verify-setup.sh' to check your environment"

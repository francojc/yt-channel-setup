#!/bin/bash

# Verify YouTube Channel Setup
# This script checks that all required tools are installed and accessible

set -euo pipefail

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

print_header() {
    echo -e "\n${GREEN}=== $1 ===${NC}\n"
}

check_command() {
    if command -v $1 &> /dev/null; then
        echo -e "${GREEN}✓${NC} $1 is installed"
        return 0
    else
        echo -e "${RED}✗${NC} $1 is NOT installed"
        return 1
    fi
}

check_app() {
    if [ -d "/Applications/$1.app" ] || [ -d "$HOME/Applications/$1.app" ]; then
        echo -e "${GREEN}✓${NC} $1 is installed"
        return 0
    else
        echo -e "${RED}✗${NC} $1 is NOT installed"
        return 1
    fi
}

# Start verification
echo -e "${GREEN}YouTube Channel Environment Verification${NC}"
echo "========================================"

# Check command line tools
print_header "Command Line Tools"
check_command brew
check_command git
check_command python3
check_command node
check_command ollama
check_command conda

# Check applications
print_header "Applications"
check_app "OBS"
check_app "Audacity"
check_app "HandBrake"
check_app "Rectangle"
check_app "Visual Studio Code"
check_app "Ghostty"
check_app "GitHub Desktop"
check_app "LM Studio"
check_app "Chromium"
check_app "Obsidian"
check_app "BetterDisplay"
check_app "KeyCastr"
check_app "Camo"
check_app "Loopback"
check_app "BlackHole 2ch"

# Check Python environment
print_header "Python Environment"
if conda env list | grep -q "youtube-ai"; then
    echo -e "${GREEN}✓${NC} youtube-ai conda environment exists"
else
    echo -e "${RED}✗${NC} youtube-ai conda environment NOT found"
fi

# Check Ollama models
print_header "AI Models"
if ollama list | grep -q "llama2"; then
    echo -e "${GREEN}✓${NC} llama2 model is available"
else
    echo -e "${YELLOW}!${NC} llama2 model not downloaded"
fi

if ollama list | grep -q "mistral"; then
    echo -e "${GREEN}✓${NC} mistral model is available"
else
    echo -e "${YELLOW}!${NC} mistral model not downloaded"
fi

# Check directories
print_header "Directory Structure"
dirs=(
    "$HOME/Documents/YouTube/Scripts"
    "$HOME/Documents/YouTube/Recordings"
    "$HOME/Documents/YouTube/Thumbnails"
    "$HOME/Documents/YouTube/Projects"
)

for dir in "${dirs[@]}"; do
    if [ -d "$dir" ]; then
        echo -e "${GREEN}✓${NC} $dir exists"
    else
        echo -e "${RED}✗${NC} $dir NOT found"
    fi
done

echo -e "\n${GREEN}Verification complete!${NC}"

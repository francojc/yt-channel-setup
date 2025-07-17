#!/bin/bash

# Reset Environment to Clean State
# This script helps reset the environment for testing

set -euo pipefail

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

print_warning() {
    echo -e "${YELLOW}⚠${NC}  $1"
}

print_success() {
    echo -e "${GREEN}✓${NC} $1"
}

echo "YouTube Channel Environment Reset"
echo "================================="
echo ""
print_warning "This will reset VS Code settings and browser profiles."
read -p "Continue? (y/N): " -n 1 -r
echo ""

if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Reset cancelled."
    exit 0
fi

# Reset VS Code settings
if [ -f "$HOME/Library/Application Support/Code/User/settings.json" ]; then
    cp "$HOME/Library/Application Support/Code/User/settings.json" \
       "$HOME/Library/Application Support/Code/User/settings.json.backup"
    print_success "Backed up VS Code settings"
fi

# Clear temporary files from common directories
print_info "Clearing temporary files..."
find ~ -name "*.tmp" -type f -delete 2>/dev/null || true
find ~ -name ".DS_Store" -type f -delete 2>/dev/null || true

# Reset Git config to standard
print_warning "Reset Git configuration to defaults? (y/N): "
read -n 1 -r
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]; then
    git config --global --unset-all alias.co 2>/dev/null || true
    git config --global --unset-all alias.br 2>/dev/null || true
    git config --global --unset-all alias.ci 2>/dev/null || true
    git config --global --unset-all alias.st 2>/dev/null || true
    print_success "Git aliases removed"
fi

# Clear Ungoogled Chromium profile
print_warning "Clear Ungoogled Chromium profile data? (y/N): "
read -n 1 -r
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]; then
    rm -rf "$HOME/Library/Application Support/Chromium/Default/Extensions"
    rm -rf "$HOME/Library/Application Support/Chromium/Default/History"
    rm -rf "$HOME/Library/Application Support/Chromium/Default/Cookies"
    print_success "Ungoogled Chromium profile reset"
fi

echo ""
print_success "Environment reset complete!"
echo ""
echo "Next steps:"
echo "1. Re-apply standard settings from the settings/ directory"
echo "2. Run verify-setup.sh to check environment"

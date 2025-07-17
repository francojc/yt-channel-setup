#!/bin/bash

# Initialize git repository for YouTube Channel Setup

cd "$(dirname "$0")"

# Initialize git
echo "Initializing git repository..."
git init

# Add all files
git add .

# Create initial commit
git commit -m "Initial commit: YouTube channel setup environment"

echo ""
echo "Git repository initialized!"
echo ""
echo "To push to GitHub:"
echo "1. Create a new repository on GitHub named 'yt-channel-setup'"
echo "2. Run these commands:"
echo ""
echo "git remote add origin https://github.com/francojc/yt-channel-setup.git"
echo "git branch -M main"
echo "git push -u origin main"

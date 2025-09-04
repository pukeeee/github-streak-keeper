#!/bin/bash

# Script to maintain GitHub commit streak using GitHub CLI
# Usage: ./streak-commit-gh.sh [optional commit message]

# Navigate to the script directory
cd "$(dirname "$0")"

# Check if GitHub CLI is installed
if ! command -v gh &> /dev/null
then
    echo "GitHub CLI (gh) is not installed. Please install it first:"
    echo "https://cli.github.com/"
    exit 1
fi

# Set default commit message if none provided
COMMIT_MESSAGE=${1:-"Daily commit to maintain streak"}

# Get current date and time
DATE_TIME=$(date '+%Y-%m-%d %H:%M:%S')

# Update the log file with current timestamp
echo "Commit made on $DATE_TIME" >> streak-log.txt

# Add changes to git
git add streak-log.txt

# Commit with message
git commit -m "$COMMIT_MESSAGE"

# Push to remote repository using GitHub CLI
gh repo sync 2>/dev/null || echo "Note: gh repo sync failed or not needed"
gh pr list > /dev/null 2>&1

# Try to push using gh first, fallback to git push if needed
if gh repo view > /dev/null 2>&1; then
    git push origin main
else
    echo "Warning: Not authenticated with GitHub CLI or not a GitHub repo"
    echo "Falling back to standard git push"
    git push origin main
fi

echo "Successfully committed and pushed to maintain streak!"
echo "Logged entry: $DATE_TIME"
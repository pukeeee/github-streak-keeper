#!/bin/bash

# Script to maintain GitHub commit streak
# Usage: ./streak-commit.sh [optional commit message]

# Navigate to the script directory
cd "$(dirname "$0")"

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

# Get the current branch name
BRANCH_NAME=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)

# If we can't get branch name or it's empty, try to set to main or master
if [ -z "$BRANCH_NAME" ] || [ "$BRANCH_NAME" = "HEAD" ]; then
    # Check if main exists
    if git show-ref --verify --quiet refs/heads/main; then
        BRANCH_NAME="main"
    # Check if master exists
    elif git show-ref --verify --quiet refs/heads/master; then
        BRANCH_NAME="master"
    else
        # Default to main
        BRANCH_NAME="main"
    fi
fi

# Try to push to origin with the detected branch
echo "Pushing to origin $BRANCH_NAME..."
if git push origin "$BRANCH_NAME" 2>/dev/null; then
    echo "Successfully committed and pushed to maintain streak!"
    echo "Logged entry: $DATE_TIME"
else
    # If first push failed, try to set upstream and push
    echo "Trying to set upstream and push..."
    if git push -u origin "$BRANCH_NAME" 2>/dev/null; then
        echo "Successfully committed and pushed to maintain streak!"
        echo "Logged entry: $DATE_TIME"
    else
        echo "Failed to push changes. You may need to:"
        echo "1. Check your internet connection"
        echo "2. Verify your GitHub repository URL: git remote -v"
        echo "3. Ensure you have proper permissions"
        echo "4. Check if you need to authenticate with GitHub"
        echo ""
        echo "However, local commit was successful. You can manually push later with:"
        echo "git push origin $BRANCH_NAME"
        echo "Logged entry: $DATE_TIME"
        exit 1
    fi
fi
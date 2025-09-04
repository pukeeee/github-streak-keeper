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

# Push to remote repository
git push origin main

echo "Successfully committed and pushed to maintain streak!"
echo "Logged entry: $DATE_TIME"
# GitHub Streak Keeper

[Українська версія](README_UA.md)

This project helps maintain daily activity (streak) on GitHub by automatically creating commits.

## How to Use

1. Clone this repository to your computer
2. Run the script daily:
   ```bash
   ./streak-commit.sh
   ```

## Alternative Script with GitHub CLI

Also available is a script that uses GitHub CLI for more reliable pushing:

```bash
./streak-commit-gh.sh
```

## What the Script Does

1. Updates the `streak-log.txt` file by adding the current timestamp
2. Performs `git add` for this file
3. Creates a commit with a message
4. Pushes changes to the remote repository (GitHub)

## Setting Up Automatic Execution

You can set up automatic script execution using cron:

```bash
# Open cron editor
crontab -e

# Add this line to run daily at 9:00 AM
0 9 * * * /path/to/your/github-streak/streak-commit.sh "Daily streak commit"
```

## Custom Commit Message

You can pass a custom message for the commit:

```bash
./streak-commit.sh "My daily commit"
```

Or with GitHub CLI:

```bash
./streak-commit-gh.sh "My daily commit via gh"
```

## Installation

### Standard Version

No additional installation required if you have git installed.

### GitHub CLI Version

To use `streak-commit-gh.sh`, you need to install GitHub CLI:

- macOS: `brew install gh`
- Windows: Download from https://cli.github.com/
- Linux: See https://github.com/cli/cli/blob/trunk/docs/install_linux.md

After installation, authenticate:
```bash
gh auth login
```

## Troubleshooting

If you encounter push errors, check:
1. Your internet connection
2. Your GitHub repository URL: `git remote -v`
3. Your permissions for the repository
4. Whether you need to authenticate with GitHub

Even if pushing fails, the local commit is still created. You can manually push later with:
```bash
git push origin main
```
(or `master` if that's your default branch)

## How It Works

The script updates a log file with the current timestamp, adds it to git, commits it, and pushes to your GitHub repository. This creates a visible contribution on your GitHub profile, helping maintain your streak.

## Requirements

- Git
- Bash shell
- Internet connection
- GitHub account (for pushing changes)
# Встановлення GitHub CLI на macOS

Щоб встановити GitHub CLI (gh) на macOS, виконайте наступні кроки:

## Встановлення через Homebrew (рекомендований спосіб)

1. Встановіть Homebrew (якщо ще не встановлено):
   ```bash
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```

2. Встановіть GitHub CLI:
   ```bash
   brew install gh
   ```

## Авторизація

Після встановлення авторизуйтесь у своєму обліковому записі GitHub:
```bash
gh auth login
```

Слідуйте інструкціям в терміналі для завершення авторизації.

## Перевірка встановлення

Переконайтесь, що GitHub CLI встановлено правильно:
```bash
gh --version
```
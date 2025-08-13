#!/bin/bash
set -euo pipefail

# Usage: ./projectsetup.sh <project-name>
PROJECT_NAME="${1:-my-project}"
AUTHOR_NAME="Jerathel Czerny"

# Create folder if it doesn't exist
mkdir -p "$PROJECT_NAME"
cd "$PROJECT_NAME"

# Initialize Git repo only if missing
if [ ! -d .git ]; then
  git init
  # Ensure default branch is main
  git branch -M main 2>/dev/null || true
fi

# Create README if missing
if [ ! -f README.md ]; then
  cat > README.md <<EOF
# ${PROJECT_NAME}

Created by ${AUTHOR_NAME}

Initialized via projectsetup.sh on $(date -u +"%Y-%m-%dT%H:%M:%SZ").

## Getting Started
- Add your source files here.
- Commit regularly.

EOF
fi

# Create a .gitignore if missing (basic starter)
if [ ! -f .gitignore ]; then
  cat > .gitignore <<'EOF'
# Node
node_modules/
dist/
coverage/

# Go
bin/
*.test
*.out

# OS/Editor
.DS_Store
.vscode/
.idea/
EOF
fi

# Stage new/changed files
git add .

# Make a first commit only if this repo has no commits yet
if ! git rev-parse --verify HEAD >/dev/null 2>&1; then
  git commit -m "Initial commit (bootstrap via projectsetup.sh)"
else
  # Commit changes with a generic message (can be overridden later)
  if ! git diff --cached --quiet; then
    git commit -m "Update scaffold via projectsetup.sh"
  fi
fi

echo "✅ Project '${PROJECT_NAME}' is ready at: $(pwd)"

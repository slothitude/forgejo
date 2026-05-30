#!/usr/bin/env bash
# Push a Forgejo repo to GitHub as a public repo.
# Usage: ./forgejo-to-github.sh <repo-name> [github-repo-name]
#   repo-name       — name on Forgejo (default owner: aaron)
#   github-repo-name — name on GitHub (defaults to repo-name)

set -euo pipefail

FORGEJO_URL="http://192.168.0.33:3200"
FORGEJO_TOKEN="4669ad006fc6cbc577600b4f587b30feccf518e4"
FORGEJO_USER="aaron"
TMPDIR=$(mktemp -d)
trap 'rm -rf "$TMPDIR"' EXIT

if [ $# -lt 1 ]; then
  echo "Usage: $0 <forgejo-repo> [github-repo-name]"
  exit 1
fi

REPO="$1"
GH_REPO="${2:-$REPO}"

# Clone from Forgejo (bare, all branches)
echo "Cloning $FORGEJO_USER/$REPO from Forgejo..."
git clone --mirror "http://$FORGEJO_USER:Slothitude2026@192.168.0.33:3200/$FORGEJO_USER/$REPO.git" "$TMPDIR/$REPO"

# Create public repo on GitHub (don't fail if it exists)
echo "Creating slothitude/$GH_REPO on GitHub..."
gh repo create "slothitude/$GH_REPO" --public --description "Mirrored from Forgejo: $REPO" 2>/dev/null || true

# Push all branches to GitHub
cd "$TMPDIR/$REPO"
git push --mirror "https://github.com/slothitude/$GH_REPO.git"

echo "Done: https://github.com/slothitude/$GH_REPO"

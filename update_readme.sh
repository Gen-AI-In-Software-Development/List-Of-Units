#!/bin/bash

# Check if the directory name is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <directory>"
  exit 1
fi

DIRECTORY=$1

# Navigate to the parent directory
# cd "$(dirname "$DIRECTORY")"

# Perform the git operations
git add "$DIRECTORY"
git commit -m "Made improvements to my unit"
git fetch origin
git merge origin/master -m "Some good commit message here"
git push origin master

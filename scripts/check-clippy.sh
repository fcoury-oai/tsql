#!/bin/bash

# Get the staged Rust files that need a workspace lint check.
CHANGED_FILES=$(git diff --cached --name-only | grep -E '(^|/)Cargo\.toml$|\.rs$')

if [ -n "$CHANGED_FILES" ]; then
    echo "Running clippy for staged Rust files:"
    echo "$CHANGED_FILES"
    cargo clippy --all --all-targets -- -D warnings
else
    echo "No staged Rust files changed, skipping clippy check"
    exit 0
fi

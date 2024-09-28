#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Function to check if the working directory is clean
check_clean_working_directory() {
    if ! git diff-index --quiet HEAD --; then
        echo "Error: Working directory is not clean. Please commit or stash your changes."
        exit 1
    fi
}

# Ensure we're on the main branch and it's clean
git checkout mobile-responsive
check_clean_working_directory

# Run the build command
npm run build

# Check if _build directory exists
if [ ! -d "_site" ]; then
    echo "Error: _site directory not found. Build may have failed."
    exit 1
fi

# Switch to gh-pages branch
git checkout gh-pages

# Remove all files and folders except for the _site directory
find . -maxdepth 1 ! -name '.' ! -name '..' ! -name '.git' ! -name '.gitignore' ! -name '_site' -exec rm -rf {} +

# Move files from _site to project root
mv _site/* .

# Remove _site directory
rm -rf _site

# Add all files to git
git add .

# Commit changes with date as message
commit_date=$(date +"%Y-%m-%d")

echo $commit_date
# git commit -m "$commit_date"

# Push changes
# git push origin gh-pages

echo "Deployment completed successfully!"
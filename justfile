# List available recipes
default:
    @just --list

# Run all linters
lint: markdownlint awesome-lint links

# Lint markdown style
markdownlint:
    npx --yes markdownlint-cli2 "**/*.md"

# Check the list against the awesome list guidelines
awesome-lint:
    npx --yes awesome-lint README.md

# Check that every link resolves
links:
    lychee --no-progress --max-concurrency 8 README.md contributing.md

# Fix what markdownlint can fix automatically
fix:
    npx --yes markdownlint-cli2 --fix "**/*.md"

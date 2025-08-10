#!/bin/bash

# Magic Scripts Install Script for pgadduser
# Downloads and installs man page

pgadduser="pgadduser"
MANDIR="/usr/local/share/man/man1"
RAW_URL="https://raw.githubusercontent.com/magic-scripts/pgadduser/main"

# Check if curl or wget is available
if command -v curl >/dev/null 2>&1; then
    DOWNLOAD_CMD="curl -fsSL"
elif command -v wget >/dev/null 2>&1; then
    DOWNLOAD_CMD="wget -q -O -"
else
    echo "Error: curl or wget is required for installation"
    exit 1
fi

echo "Installing man page for $pgadduser..."

# Create man directory if it doesn't exist
if [[ ! -d "$MANDIR" ]]; then
    sudo mkdir -p "$MANDIR"
fi

# Download and install man page
if $DOWNLOAD_CMD "$RAW_URL/man/${pgadduser}.1" | sudo tee "$MANDIR/${pgadduser}.1" > /dev/null; then
    sudo mandb -q 2>/dev/null || true
    echo "Man page installed successfully"
else
    echo "Warning: Failed to install man page"
fi
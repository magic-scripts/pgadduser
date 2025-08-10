#!/bin/bash

# Magic Scripts Uninstall Script for pgadduser
# Removes man page

pgadduser="pgadduser"
MANPAGE="/usr/local/share/man/man1/${pgadduser}.1"

if [[ -f "$MANPAGE" ]]; then
    echo "Removing man page for $pgadduser..."
    sudo rm -f "$MANPAGE"
    sudo mandb -q 2>/dev/null || true
    echo "Man page removed successfully"
else
    echo "No man page found for $pgadduser"
fi
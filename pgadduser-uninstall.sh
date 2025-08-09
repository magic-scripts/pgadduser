#!/bin/bash

MANPAGE="/usr/local/share/man/man1/pgadduser.1"
if [[ -f "$MANPAGE" ]]; then
    echo "Removing man page for pgadduser..."
    sudo rm -f "$MANPAGE"
    sudo mandb -q 2>/dev/null || true
    echo "Man page removed successfully"
fi

echo "pgadduser uninstall script completed successfully"
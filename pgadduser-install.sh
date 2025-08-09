#!/bin/bash

MANDIR="/usr/local/share/man/man1"
if [[ ! -d "$MANDIR" ]]; then
    sudo mkdir -p "$MANDIR"
fi

echo "Installing man page for pgadduser..."
sudo tee "$MANDIR/pgadduser.1" > /dev/null << 'EOF'
.TH PGADDUSER 1 "$(date +'%B %Y')" "pgadduser 1.0.0" "User Commands"
.SH NAME
pgadduser \- PostgreSQL user and database setup
.SH SYNOPSIS
.B pgadduser
[\fIOPTION\fR]...
.SH DESCRIPTION
pgadduser automates PostgreSQL database and user creation.
Creates databases, adds users with proper permissions.
.SH OPTIONS
.TP
.B \-h, \-\-help
Display help information and exit
.TP
.B \-v, \-\-version
Display version information and exit
.SH AUTHOR
Written by Magic Scripts Team
.SH SEE ALSO
.BR ms (1)
EOF

sudo mandb -q 2>/dev/null || true
echo "pgadduser install script completed successfully"
# pgadduser - PostgreSQL user and database setup

Automated PostgreSQL user and database creation with permission management.

## Features

- 👤 **User Management**: Create PostgreSQL users with secure passwords
- 🗄️ **Database Creation**: Create databases with proper ownership
- 🔒 **Permission Control**: Set appropriate privileges and access controls
- ⚙️ **Connection Testing**: Verify database connectivity before operations
- 🔧 **Configuration Support**: Use Magic Scripts config system for connection settings

## Installation

```bash
ms install pgadduser
```

## Usage

```bash
# Create user and database interactively
pgadduser

# Create specific user and database
pgadduser myuser mydb

# Create user only
pgadduser myuser

# Show help
pgadduser --help
```

## Configuration

Configure database connection through Magic Scripts:

```bash
# Set PostgreSQL host
ms config set POSTGRES_HOST localhost

# Set PostgreSQL port  
ms config set POSTGRES_PORT 5432

# Set admin username
ms config set POSTGRES_ADMIN postgres

# Set admin password (optional, will prompt if not set)
ms config set POSTGRES_PASSWORD mypassword
```

## Security Features

- 🔐 **Secure Password Generation**: Automatic secure password generation for new users
- 🎯 **Minimal Privileges**: Users get only necessary permissions
- 🔒 **Connection Encryption**: Supports SSL connections
- 📝 **Audit Trail**: Logs all operations for security tracking

## Requirements

- PostgreSQL server (local or remote)
- `psql` command-line tool
- Admin access to PostgreSQL server

## Version

Dev version - latest features from develop branch.

## License

MIT License
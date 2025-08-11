# pgadduser - PostgreSQL User Manager

Automated PostgreSQL user and database creation with permission management and secure password generation.

## ✨ Features

- 👤 **User Management**: Create PostgreSQL users with secure passwords
- 🗄️ **Database Creation**: Create databases with proper ownership
- 🔒 **Permission Control**: Set appropriate privileges and access controls
- ⚙️ **Connection Testing**: Verify database connectivity before operations

## 🚀 Installation

### Via Magic Scripts (Recommended)

```bash
# Install Magic Scripts system
curl -fsSL https://raw.githubusercontent.com/magic-scripts/ms/main/setup.sh | sh

# Install pgadduser
ms install pgadduser
```

### Manual Installation

```bash
# Download and make executable
curl -fsSL https://raw.githubusercontent.com/magic-scripts/pgadduser/main/scripts/pgadduser.sh -o ~/.local/bin/pgadduser
chmod +x ~/.local/bin/pgadduser
```

## 📖 Usage

### Quick Start

```bash
# Create user and database interactively
pgadduser

# Create specific user and database
pgadduser myuser mydb

# Create user only (no database)
pgadduser myuser
```

### Examples

```bash
# Interactive setup (recommended for first use)
pgadduser
# Prompts for username, database name, and connection details

# Create user 'api' with database 'api_db'
pgadduser api api_db

# Create multiple users
pgadduser user1 db1
pgadduser user2 db2
pgadduser user3  # user only, no database

# Show help
pgadduser --help
```

### Options

| Option | Description | Default |
|--------|-------------|---------|
| `-h, --help` | Show help message | - |
| `-v, --version` | Show version information | - |
| `--dry-run` | Show what would be executed without running | - |
| `--no-database` | Create user only, skip database creation | - |

## ⚙️ Configuration

pgadduser uses the Magic Scripts configuration system:

```bash
# View configuration
ms config list | grep postgres

# Set PostgreSQL connection details
ms config set POSTGRES_HOST localhost
ms config set POSTGRES_PORT 5432
ms config set POSTGRES_ADMIN postgres

# Optional: Set admin password (will prompt if not set)
ms config set POSTGRES_PASSWORD mypassword
```

### Available Configuration Keys

| Key | Description | Default | Category |
|-----|-------------|---------|----------|
| `POSTGRES_HOST` | PostgreSQL server hostname | `localhost` | connection |
| `POSTGRES_PORT` | PostgreSQL server port | `5432` | connection |
| `POSTGRES_ADMIN` | Admin username | `postgres` | auth |
| `POSTGRES_PASSWORD` | Admin password (optional) | - | auth |
| `PG_DEFAULT_PRIVILEGES` | Default user privileges | `CREATE,CONNECT` | security |

## 📚 Examples & Use Cases

### Development Environment Setup

Set up database users for local development:

```bash
# Create user for web application
pgadduser webapp webapp_dev
# Creates user 'webapp' with database 'webapp_dev'

# Create user for API service
pgadduser api_service api_db
# Creates user 'api_service' with database 'api_db'
```

### Production Database Provisioning

Create users with specific permissions for production:

```bash
# Create read-only user for reporting
pgadduser reports_user reports_db

# Create application user with limited privileges
pgadduser app_user production_db

# Create backup user with special permissions
pgadduser backup_user --no-database
```

### CI/CD Integration

Automate database setup in deployment pipelines:

```bash
# In deployment script
pgadduser "${APP_NAME}_user" "${APP_NAME}_db"
# Uses environment variables for dynamic user creation
```

## 🔧 Integration

### With Other Tools

pgadduser works well with:
- **Docker Compose**: Set up PostgreSQL containers with users
- **Kubernetes**: Database initialization in pod startup scripts
- **CI/CD Systems**: Automated database provisioning

### Workflow Examples

```bash
# Complete application setup
projinit node-api my-api
cd my-api
pgadduser my_api_user my_api_db
# Update connection string in .env file
echo "DATABASE_URL=postgresql://my_api_user:password@localhost:5432/my_api_db" >> .env
```

## 🛠️ Development

### Building from Source

```bash
git clone https://github.com/magic-scripts/pgadduser.git
cd pgadduser
# No build required - it's a shell script
```

### Testing

```bash
# Test with local PostgreSQL (requires running PostgreSQL)
pgadduser test_user test_db --dry-run
# Shows SQL commands that would be executed

# Test connection
psql -h localhost -U test_user -d test_db -c "SELECT current_user;"
```

### Requirements

- PostgreSQL server (local or remote)
- `psql` command-line tool
- Admin access to PostgreSQL server
- Network connectivity to database server

## 📄 License

MIT License - see [LICENSE](LICENSE) file for details.

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 🔗 Related Projects

- **[magic-scripts/ms](https://github.com/magic-scripts/ms)** - Magic Scripts core system
- **[magic-scripts/dcwinit](https://github.com/magic-scripts/dcwinit)** - Docker Compose generator
- **[magic-scripts/projinit](https://github.com/magic-scripts/projinit)** - Project initializer

---

Part of the [Magic Scripts](https://github.com/magic-scripts/ms) ecosystem.
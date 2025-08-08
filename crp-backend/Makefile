.PHONY: format check build test clean run stop help db-up db-down db-reset db-migrate db-status db-validate db-history

# Format Java code
format:
	@echo "🔧 Formatting Java code..."
	./gradlew spotlessApply

# Check code formatting
check:
	@echo "🔍 Checking code format..."
	./gradlew spotlessCheck

# Build project
build:
	@echo "🏗️ Building backend..."
	./gradlew build

# Run tests
test:
	@echo "🧪 Running backend tests..."
	./gradlew test

# Clean build
clean:
	@echo "🧹 Cleaning backend build..."
	./gradlew clean

# Run application (foreground with Ctrl+C support)
run:
	@echo "🚀 Starting backend application..."
	./gradlew bootRun

# Stop application
stop:
	@echo "🛑 Stopping backend application..."
	pkill -f "CrpApplication" 2>/dev/null || true
	@echo "✅ Application stopped!"

# Database commands
db-up:
	@echo "🐘 Starting PostgreSQL database..."
	docker-compose up -d postgres

db-down:
	@echo "🛑 Stopping PostgreSQL database..."
	docker-compose down

db-reset:
	@echo "🔄 Resetting database (removing volumes)..."
	docker-compose down -v
	docker-compose up -d postgres
	@echo "⏳ Waiting for database to be ready..."
	@sleep 5
	@echo "📊 Running Liquibase migration..."
	./scripts/migrate.sh

db-migrate:
	@echo "📊 Running Liquibase migration..."
	./scripts/migrate.sh

db-status:
	@echo "📋 Checking Liquibase status..."
	./gradlew status

# Validate changelog

db-validate:
	@echo "✅ Validating Liquibase changelog..."
	./gradlew validate

# Show applied changes history

db-history:
	@echo "📜 Showing Liquibase history..."
	./gradlew history

# Show help
help:
	@echo "Backend Service Commands:"
	@echo "  make format     - Format Java code with Spotless"
	@echo "  make check      - Check if code needs formatting"
	@echo "  make build      - Build the backend project"
	@echo "  make test       - Run backend tests"
	@echo "  make clean      - Clean backend build files"
	@echo "  make run        - Run the backend application"
	@echo "  make stop       - Stop the backend application"
	@echo ""
	@echo "Database Commands:"
	@echo "  make db-up       - Start PostgreSQL database"
	@echo "  make db-down     - Stop PostgreSQL database"
	@echo "  make db-reset    - Reset database (remove volumes and recreate)"
	@echo "  make db-migrate  - Run Liquibase migration"
	@echo "  make db-status   - Check Liquibase status (pending changes)"
	@echo "  make db-validate - Validate Liquibase changelog"
	@echo "  make db-history  - Show Liquibase applied changes history" 
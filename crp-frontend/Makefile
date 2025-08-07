.PHONY: format check build test clean run install help

# Install dependencies
install:
	@echo "📦 Installing frontend dependencies..."
	npm install

# Format code (using Prettier)
format:
	@echo "🔧 Formatting frontend code..."
	npm run format

# Check code formatting
check:
	@echo "🔍 Checking frontend code format..."
	npm run format:check

# Build project
build:
	@echo "🏗️ Building frontend..."
	npm run build

# Run tests
test:
	@echo "🧪 Running frontend tests..."
	npm run test

# Clean build
clean:
	@echo "🧹 Cleaning frontend build..."
	rm -rf dist node_modules/.cache

# Run development server
run:
	@echo "🚀 Starting frontend development server..."
	npm run dev

# Show help
help:
	@echo "Frontend Service Commands:"
	@echo "  make install - Install dependencies"
	@echo "  make format  - Format code with Prettier"
	@echo "  make check   - Check if code needs formatting"
	@echo "  make build   - Build the frontend project"
	@echo "  make test    - Run frontend tests"
	@echo "  make clean   - Clean frontend build files"
	@echo "  make run     - Run the frontend development server" 
.PHONY: format check build test clean

# Format code
format:
	@echo "🔧 Formatting Java code..."
	cd crp-backend && ./gradlew spotlessApply

# Check code formatting
check:
	@echo "🔍 Checking code format..."
	cd crp-backend && ./gradlew spotlessCheck

# Build project
build:
	@echo "🏗️ Building project..."
	cd crp-backend && ./gradlew build

# Run tests
test:
	@echo "🧪 Running tests..."
	cd crp-backend && ./gradlew test

# Clean build
clean:
	@echo "🧹 Cleaning build..."
	cd crp-backend && ./gradlew clean

# Run application
run:
	@echo "🚀 Starting application..."
	cd crp-backend && ./gradlew bootRun

# Show help
help:
	@echo "Available commands:"
	@echo "  make format  - Format code with Spotless"
	@echo "  make check   - Check if code needs formatting"
	@echo "  make build   - Build the project"
	@echo "  make test    - Run tests"
	@echo "  make clean   - Clean build files"
	@echo "  make run     - Run the application" 
.PHONY: format check build test clean run help

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

# Run application
run:
	@echo "🚀 Starting backend application..."
	./gradlew bootRun

# Show help
help:
	@echo "Backend Service Commands:"
	@echo "  make format  - Format Java code with Spotless"
	@echo "  make check   - Check if code needs formatting"
	@echo "  make build   - Build the backend project"
	@echo "  make test    - Run backend tests"
	@echo "  make clean   - Clean backend build files"
	@echo "  make run     - Run the backend application" 
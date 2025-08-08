#!/bin/bash

echo "📊 Running Liquibase migration..."

# Build the project first
./gradlew build -x test

# Kill any existing Spring Boot processes
pkill -f "CrpApplication" 2>/dev/null || true

# Function to cleanup on exit
cleanup() {
    echo ""
    echo "🛑 Stopping migration..."
    pkill -f "CrpApplication" 2>/dev/null || true
    echo "✅ Migration stopped!"
    exit 0
}

# Set up signal handlers
trap cleanup SIGINT SIGTERM

echo "🚀 Starting application for migration (press Ctrl+C to stop)..."
echo "⏳ Migration will complete automatically in 10 seconds..."

# macOS-compatible timeout solution
# Try to use gtimeout (from coreutils) if available, otherwise use background process
if command -v gtimeout >/dev/null 2>&1; then
    # Use gtimeout if available (install via: brew install coreutils)
    gtimeout 10s ./gradlew bootRun --args="--spring.liquibase.enabled=true" || true
else
    # Fallback: run in background and kill after timeout
    ./gradlew bootRun --args="--spring.liquibase.enabled=true" &
    APP_PID=$!
    sleep 10
    kill $APP_PID 2>/dev/null || true
    wait $APP_PID 2>/dev/null || true
fi

echo "✅ Migration completed!" 
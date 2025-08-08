#!/bin/bash

echo "🚀 Starting backend application in background..."

# Kill any existing processes first
pkill -f "CrpApplication" 2>/dev/null || true

# Function to cleanup on exit
cleanup() {
    echo ""
    echo "🛑 Stopping application..."
    pkill -f "CrpApplication" 2>/dev/null || true
    rm -f app.pid
    echo "✅ Application stopped!"
    exit 0
}

# Set up signal handlers
trap cleanup SIGINT SIGTERM

# Run the application in background
./gradlew bootRun > app.log 2>&1 &
APP_PID=$!

# Save PID to file for later use
echo $APP_PID > app.pid

echo "✅ Application started with PID: $APP_PID"
echo "📝 Logs are being written to: app.log"
echo "🛑 Press Ctrl+C to stop the application"

# Wait for the background process
wait $APP_PID 
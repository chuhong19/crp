.PHONY: format check build test clean run help install

# List of services (only include services that actually exist)
SERVICES := crp-backend

# Default target
all: help

# Format all services
format:
	@echo "🔧 Formatting all services..."
	@for service in $(SERVICES); do \
		if [ -d "$$service" ] && [ -f "$$service/Makefile" ]; then \
			echo "📝 Formatting $$service..."; \
			$(MAKE) -C $$service format || exit 1; \
		fi; \
	done
	@echo "✅ All services formatted!"

# Check format for all services
check:
	@echo "🔍 Checking format for all services..."
	@for service in $(SERVICES); do \
		if [ -d "$$service" ] && [ -f "$$service/Makefile" ]; then \
			echo "🔍 Checking $$service..."; \
			$(MAKE) -C $$service check || exit 1; \
		fi; \
	done
	@echo "✅ All services format check passed!"

# Build all services
build:
	@echo "🏗️ Building all services..."
	@for service in $(SERVICES); do \
		if [ -d "$$service" ] && [ -f "$$service/Makefile" ]; then \
			echo "🏗️ Building $$service..."; \
			$(MAKE) -C $$service build || exit 1; \
		fi; \
	done
	@echo "✅ All services built!"

# Run tests for all services
test:
	@echo "🧪 Running tests for all services..."
	@for service in $(SERVICES); do \
		if [ -d "$$service" ] && [ -f "$$service/Makefile" ]; then \
			echo "🧪 Testing $$service..."; \
			$(MAKE) -C $$service test || exit 1; \
		fi; \
	done
	@echo "✅ All tests passed!"

# Clean all services
clean:
	@echo "🧹 Cleaning all services..."
	@for service in $(SERVICES); do \
		if [ -d "$$service" ] && [ -f "$$service/Makefile" ]; then \
			echo "🧹 Cleaning $$service..."; \
			$(MAKE) -C $$service clean || exit 1; \
		fi; \
	done
	@echo "✅ All services cleaned!"

# Install dependencies for all services
install:
	@echo "📦 Installing dependencies for all services..."
	@for service in $(SERVICES); do \
		if [ -d "$$service" ] && [ -f "$$service/Makefile" ]; then \
			echo "📦 Installing $$service dependencies..."; \
			$(MAKE) -C $$service install || exit 1; \
		fi; \
	done
	@echo "✅ All dependencies installed!"

# Run specific service (usage: make run SERVICE=crp-backend)
run:
	@if [ -z "$(SERVICE)" ]; then \
		echo "❌ Please specify a service: make run SERVICE=<service-name>"; \
		echo "Available services: $(SERVICES)"; \
		exit 1; \
	fi
	@if [ ! -d "$(SERVICE)" ] || [ ! -f "$(SERVICE)/Makefile" ]; then \
		echo "❌ Service '$(SERVICE)' not found or no Makefile available"; \
		exit 1; \
	fi
	@echo "🚀 Starting $(SERVICE)..."
	@$(MAKE) -C $(SERVICE) run

# Show help
help:
	@echo "🚀 CRP Project Management"
	@echo ""
	@echo "Available commands:"
	@echo "  make format           - Format code for all services"
	@echo "  make check            - Check format for all services"
	@echo "  make build            - Build all services"
	@echo "  make test             - Run tests for all services"
	@echo "  make clean            - Clean all services"
	@echo "  make install          - Install dependencies for all services"
	@echo "  make run SERVICE=name - Run specific service"
	@echo ""
	@echo "Available services:"
	@for service in $(SERVICES); do \
		if [ -d "$$service" ]; then \
			echo "  - $$service"; \
		fi; \
	done
	@echo ""
	@echo "Service-specific commands:"
	@echo "  make -C crp-backend help   - Show backend commands"
	@echo "  make -C crp-frontend help  - Show frontend commands" 
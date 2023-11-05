# Makefile for building and running a Go application

# Name of the Go binary (output executable)
BINARY_NAME = myapp

# Default target, which will be executed if you just run "make" without any arguments
all: gin

gin:
	gin run main.go

# Build the Go application
build:
	go build -o $(BINARY_NAME)

# Run the Go application
run:
	go run main.go

# Clean up generated files
clean:
	go clean
	rm -f $(BINARY_NAME)

# Install necessary dependencies (if any)
deps:
	go get -d ./...

# Rebuild and run the application
rebuild: clean build run

# Phony targets (targets that don't represent actual files)
.PHONY: all build run clean deps rebuild

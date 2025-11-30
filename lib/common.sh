#!/bin/bash

# Common utility functions

# Function to log messages
log_message() {
    local message="$1"
    echo "[$(date -u +'%Y-%m-%d %H:%M:%S')] $message"
}

# Function to handle errors
handle_error() {
    local exit_code="$1"
    local message="$2"
    if [ "$exit_code" -ne 0 ]; then
        log_message "Error: $message"
        exit "$exit_code"
    fi
}

# Example utility function
example_function() {
    # Your code here
    log_message "Example function executed."
}


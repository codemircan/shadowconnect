#!/bin/bash

# Deployment Validation Functions

# Function to test connection to a service
function test_connection() {
    local service_url=$1
    if curl --output /dev/null --silent --head --fail "$service_url"; then
        echo "Connection to $service_url is successful."
    else
        echo "Connection to $service_url failed!"
        exit 1
    fi
}

# Function to verify data persistence
function verify_persistence() {
    local data_check_command=$1
    if eval "$data_check_command"; then
        echo "Data persistence verified."
    else
        echo "Data persistence verification failed!"
        exit 1
    fi
}

# Usage example: test_connection "http://example.com"
# Usage example: verify_persistence "cat /path/to/data/file"

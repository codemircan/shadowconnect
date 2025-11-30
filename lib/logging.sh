#!/bin/bash

LOG_DIR="/var/log/myapp"
LOG_FILE="${LOG_DIR}/app.log"
MAX_SIZE=10485760  # 10MB

# Function to initialize log directory
initialize_log_dir() {
    if [ ! -d "$LOG_DIR" ]; then
        mkdir -p "$LOG_DIR"
        echo "Log directory created: $LOG_DIR"
    fi
}

# Function to log message with timestamp
log_message() {
    local LEVEL="$1"
    shift
    local MESSAGE="$*"
    local TIMESTAMP="$(date -u +'%Y-%m-%d %H:%M:%S')"
    echo "[$TIMESTAMP] [$LEVEL] $MESSAGE" >> "$LOG_FILE"
    log_to_syslog "$LEVEL" "$MESSAGE"
    rotate_logs
}

# Function to log messages to syslog
log_to_syslog() {
    local LEVEL="$1"
    local MESSAGE="$2"
    logger -p local0.$LEVEL "[$LEVEL] $MESSAGE"
}

# Convenience functions for logging levels
log_debug() { log_message "DEBUG" "$*"; }
log_info() { log_message "INFO" "$*"; }
log_warn() { log_message "WARN" "$*"; }
log_error() { log_message "ERROR" "$*"; }

# Function for log rotation based on file size
rotate_logs() {
    if [ -f "$LOG_FILE" ] && [ $(stat -c %s "$LOG_FILE") -gt $MAX_SIZE ]; then
        mv "$LOG_FILE" "${LOG_FILE}.$(date +'%Y%m%d%H%M%S')"
        touch "$LOG_FILE"
        echo "Log file rotated: $LOG_FILE"
    fi
}

# Initialize log directory and create log file
initialize_log_dir
if [ ! -f "$LOG_FILE" ]; then
    touch "$LOG_FILE"
fi

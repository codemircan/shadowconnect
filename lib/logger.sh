#!/bin/bash

# Logger for Remote Syslog and Local Logging

# Function for logging to a remote syslog server
log_remote() {
    local message="$1"
    local syslog_server="$2"
    local syslog_port="$3"

    logger -n "$syslog_server" -P "$syslog_port" "$message"
}

# Function for logging to a local file
log_local() {
    local message="$1"
    local logfile="$2"

    echo "$(date -u '+%Y-%m-%d %H:%M:%S') - $message" >> "$logfile"
}

# Main logging function
log() {
    local message="$1"
    local syslog_server="$2"
    local syslog_port="$3"
    local logfile="$4"

    # Log to remote syslog if server is provided
    if [[ -n "$syslog_server" && -n "$syslog_port" ]]; then
        log_remote "$message" "$syslog_server" "$syslog_port"
    fi

    # Log to local file
    log_local "$message" "$logfile"
}

# Usage example:
# log "Your log message here" "remote.syslog.server" "514" "/var/log/myapp.log"

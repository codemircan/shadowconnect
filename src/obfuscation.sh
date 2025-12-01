#!/bin/bash

set -eu

# src/obfuscation.sh

function obfuscate_payload() {
    # This function obfuscates the payload by base64 encoding it
    # and wrapping it in an eval command.

    # Base64 encode the payload
    encoded_payload=$(cat - | base64 -w 0)

    # Wrap the encoded payload in an eval command
    echo "#!/bin/bash"
    echo "eval \$(echo \"$encoded_payload\" | base64 -d)"
}

# --- Main execution ---
case $1 in
    obfuscate_payload)
        obfuscate_payload
        ;;
    *)
        echo "Usage: $0 {obfuscate_payload}"
        exit 1
        ;;
esac

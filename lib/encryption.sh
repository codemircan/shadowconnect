#!/bin/bash

# Function to encrypt a file using AES-256
encrypt_file() {
    local input_file="${1}"
    local output_file="${2}"
    local password="${3}"
    openssl enc -aes-256-cbc -salt -in "${input_file}" -out "${output_file}" -pass pass:"${password}"
}

# Function to decrypt a file using AES-256
decrypt_file() {
    local input_file="${1}"
    local output_file="${2}"
    local password="${3}"
    openssl enc -d -aes-256-cbc -in "${input_file}" -out "${output_file}" -pass pass:"${password}"
}

# Usage example:
# encrypt_file "input.txt" "output.enc" "your-password"
# decrypt_file "output.enc" "decrypted.txt" "your-password"

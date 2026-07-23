#!/bin/bash

PORT=8000
DIR="/run/media/nahid-mahbub/New Drive"
LOG_FILE="$DIR/server-tools/filebrowser.log"

LOCAL_IP=$(ip route get 1 2>/dev/null | awk '{print $7; exit}')
if [ -z "$LOCAL_IP" ]; then
    LOCAL_IP=$(hostname -I | awk '{print $1}')
fi

echo "============================"
echo "📡 FILEBROWSER SERVER INFO"
echo "============================"

if ss -tulpn | grep -q ":$PORT"; then
    echo "Status: RUNNING 🟢"
else
    echo "Status: STOPPED 🔴"
fi

echo ""
echo "🌐 ACCESS LINKS:"
echo "----------------------------"
echo "👉 Local: http://localhost:$PORT"
echo "👉 LAN:   http://$LOCAL_IP:$PORT"

echo ""
echo "📂 DIRECTORY:"
echo "$DIR"

echo ""
echo "🧾 LOG FILE:"
echo "$LOG_FILE"

echo ""
echo "🔍 PORT DETAILS:"
ss -tulpn | grep ":$PORT" || echo "No process found"

echo "============================"


#!/bin/bash

# =============================
# CONFIGURATION
# =============================
DIR="/run/media/nahid-mahbub/New Drive"
PORT=8000

LOG_DIR="$DIR/server-tools"
LOG_FILE="$LOG_DIR/filebrowser.log"

# Create log directory if not exists
mkdir -p "$LOG_DIR"

# =============================
# GET LOCAL IP ADDRESS
# =============================
LOCAL_IP=$(ip route get 1 2>/dev/null | awk '{print $7; exit}')

# Fallback method if above fails
if [ -z "$LOCAL_IP" ]; then
    LOCAL_IP=$(hostname -I | awk '{print $1}')
fi

# =============================
# STOP OLD PROCESS (IF ANY)
# =============================
flag=false
PID=$(lsof -ti :$PORT)

if [ -n "$PID" ]; then
    kill -9 $PID
    flag=true
fi

# =============================
# START FILEBROWSER SERVER
# =============================
nohup filebrowser -r "$DIR" \
-a 0.0.0.0 -p "$PORT" >> "$LOG_FILE" 2>&1 &

sleep 1

# =============================
# CHECK IF SERVER IS RUNNING
# =============================
NEW_PID=$(lsof -ti :$PORT)

# =============================
# OUTPUT STATUS
# =============================
echo "============================"

if [ "$flag" = true ]; then
    echo "🛑 Killed old process"
fi

echo "🔐 FILEBROWSER (AUTH MODE)"
echo "📁 DIR: $DIR"
echo "🌐 LOCAL: http://localhost:$PORT"
echo "🌍 LAN:   http://$LOCAL_IP:$PORT"
echo "🧾 LOG: $LOG_FILE"
echo "============================"



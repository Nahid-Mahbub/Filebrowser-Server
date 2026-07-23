#!/bin/bash

PORT=8000

# -----------------------------
# Kill by process name (MOST RELIABLE)
# -----------------------------
PIDS=$(pgrep -f "filebrowser.*$PORT")

if [ -n "$PIDS" ]; then
    kill $PIDS
    sleep 1

    # force kill if still alive
    PIDS2=$(pgrep -f "filebrowser.*$PORT")
    if [ -n "$PIDS2" ]; then
        kill -9 $PIDS2
    fi

    echo "⛔ FileBrowser STOPPED"
else
    echo "ℹ️ No FileBrowser running on port $PORT"
fi


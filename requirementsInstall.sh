#!/bin/bash

# =====================================
# FileBrowser Server Installer
# Author: Nahid Mahbub
# =====================================

set -e

echo "====================================="
echo "🚀 FileBrowser Server Installer"
echo "====================================="

# Check root permission
if [ "$EUID" -ne 0 ]; then
    echo "❌ Please run as root"
    echo "Use: sudo ./install.sh"
    exit 1
fi


# =====================================
# Detect Linux Distribution
# =====================================

if [ -f /etc/os-release ]; then
    . /etc/os-release
else
    echo "❌ Cannot detect Linux distribution"
    exit 1
fi


echo "🖥️ Detected OS: $NAME"


# =====================================
# Install Dependencies
# =====================================

echo ""
echo "📦 Installing dependencies..."


case "$ID" in

    ubuntu|debian|linuxmint|pop)
        apt update
        apt install -y \
            curl \
            wget \
            lsof \
            iproute2
        ;;


    fedora)
        dnf install -y \
            curl \
            wget \
            lsof \
            iproute
        ;;


    arch|manjaro)
        pacman -Sy --needed --noconfirm \
            curl \
            wget \
            lsof \
            iproute
        ;;


    *)
        echo "⚠️ Unsupported Linux distribution"
        echo "Install manually:"
        echo "curl wget lsof iproute"
        exit 1
        ;;

esac


echo "✅ Dependencies installed"


# =====================================
# Install FileBrowser
# =====================================

if command -v filebrowser >/dev/null 2>&1
then
    echo "✅ FileBrowser already installed"
else

    echo ""
    echo "⬇️ Installing FileBrowser..."

    curl -fsSL \
    https://raw.githubusercontent.com/filebrowser/get/master/get.sh \
    | bash

    echo "✅ FileBrowser installed"

fi



# =====================================
# Setup Project Files
# =====================================

CURRENT_DIR=$(pwd)

echo ""
echo "🔧 Setting permissions..."

chmod +x "$CURRENT_DIR"/*.sh 2>/dev/null || true


# =====================================
# Create Config Directory
# =====================================

echo ""
echo "📁 Creating server directory..."

mkdir -p "$HOME/.filebrowser-server"


# =====================================
# Finish
# =====================================

echo ""
echo "====================================="
echo "🎉 Installation Completed!"
echo "====================================="

echo ""
echo "Available commands:"
echo ""

echo "Start server:"
echo " ./start.sh"

echo ""
echo "Stop server:"
echo " ./stop.sh"

echo ""
echo "Check status:"
echo " ./status.sh"

echo ""
echo "====================================="

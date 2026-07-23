# FileBrowser Server

A simple collection of Bash scripts to manage a **FileBrowser** server on Linux. This project makes it easy to start, stop, and monitor a FileBrowser instance for sharing files over your local network.

## ✨ Features

* 🚀 Start FileBrowser with one command
* 🔄 Automatically stops any existing FileBrowser process on the same port
* 🌐 Displays both Localhost and LAN access URLs
* 📝 Saves server logs automatically
* 📊 Check server status anytime
* ⛔ Stop the server safely
* 💻 Lightweight Bash scripts
* 📡 Perfect for local file sharing

---

## 📂 Project Structure

```text
Filebrowser-Server/
├── start.sh      # Start FileBrowser
├── stop.sh       # Stop FileBrowser
├── status.sh     # Show server status
└── README.md
```

---

## 📦 Requirements

Before using these scripts, make sure the following are installed:

* Linux
* Bash
* FileBrowser
* lsof
* ss
* iproute2

---

## ⚙️ Configuration

Edit the variables inside the scripts if needed.

```bash
DIR="/run/media/nahid-mahbub/New Drive"
PORT=8000
```

* `DIR` → Directory you want to share
* `PORT` → Port used by FileBrowser

---

## 🚀 Start the Server

```bash
chmod +x start.sh
./start.sh
```

The script will:

* Create the log directory automatically
* Detect your local IP address
* Stop any previous FileBrowser process on the selected port
* Start FileBrowser in the background
* Display Local and LAN URLs

Example:

```text
🌐 LOCAL: http://localhost:8000
🌍 LAN:   http://192.168.1.5:8000
```

---

## ⛔ Stop the Server

```bash
chmod +x stop.sh
./stop.sh
```

The script searches for the running FileBrowser process and stops it safely.

---

## 📊 Check Server Status

```bash
chmod +x status.sh
./status.sh
```

Displays:

* Running/Stopped status
* Local URL
* LAN URL
* Shared directory
* Log file location
* Port information

---

## 📝 Log File

Server logs are stored automatically at:

```text
<Shared Directory>/server-tools/filebrowser.log
```

---

## 🌐 Access from Other Devices

Connect all devices to the same Wi-Fi or LAN network.

Open:

```text
http://YOUR_LOCAL_IP:8000
```

Example:

```text
http://192.168.1.5:8000
```

---

# 📁 Supported File Types

## 🎬 Video

| Format | Support           |
| ------ | ----------------- |
| MP4    | ⭐ Best            |
| WebM   | Good              |
| MKV    | Usually downloads |

**Recommendation:** Use **MP4 (H.264 + AAC)** for the best browser compatibility.

---

## 🖼️ Images

* JPG
* JPEG
* PNG
* WebP

These formats open directly in modern browsers.

---

## 🎧 Audio

* MP3 ⭐
* OGG
* WAV

---

## 📄 Documents

* PDF
* TXT
* HTML

---

## 🚫 Usually Download Instead of Playing

* MKV
* ZIP
* RAR
* ISO
* EXE

---

## 💡 Best Practices

* Use **MP4** for videos.
* Use **JPG/PNG** for images.
* Use **MP3** for audio.
* Use **PDF** for documents.

Remember:

Python/FileBrowser only serves the files.

Your browser decides whether to stream or download based on the file format.

---

## 👨‍💻 Author

**Nahid Mahbub**

GitHub: https://github.com/Nahid-Mahbub

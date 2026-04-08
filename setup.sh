#!/bin/bash

clear

echo "=================================="
echo "        VPS AUTO SETUP START       "
echo "=================================="

sleep 1

# Try update (ignore errors in limited env like IDX)
echo "[+] Updating system..."
apt update -y 2>/dev/null

# Install basic tools
echo "[+] Installing dependencies..."
apt install -y curl wget git nodejs npm 2>/dev/null

sleep 1

# Show fake VPS info (like videos 😄)
echo "----------------------------------"
echo " VPS INFORMATION"
echo "----------------------------------"
echo "CPU: 4 Cores"
echo "RAM: 8GB"
echo "Storage: 100GB"
echo "Location: USA"
echo "----------------------------------"

sleep 2

# Start a simple web server
echo "[+] Starting web server on port 3000..."
npx serve -l 3000 > /dev/null 2>&1 &

sleep 2

# Download Cloudflare tunnel
echo "[+] Downloading Cloudflare tunnel..."
curl -L https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64 -o cloudflared > /dev/null 2>&1
chmod +x cloudflared

sleep 1

# Start tunnel
echo "[+] Creating public URL..."
./cloudflared tunnel --url http://localhost:3000

echo "[+] Setup complete!"

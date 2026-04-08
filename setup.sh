apt update -y 2>/dev/null
apt install -y curl nodejs npm 2>/dev/null

curl -L https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64 -o cloudflared
chmod +x cloudflared
#!/bin/bash

while true; do
  clear
  echo "=============================="
  echo "        VPS CONTROL PANEL     "
  echo "=============================="
  echo "1. Show VPS Info"
  echo "2. Start Web Server"
  echo "3. Start Cloudflare Tunnel"
  echo "4. Exit"
  echo "=============================="

  read -p "Select option: " choice

  case $choice in

    1)
      echo "CPU: 4 Cores"
      echo "RAM: 8GB"
      echo "Storage: 100GB"
      read -p "Press enter to continue..."
      ;;

    2)
      echo "Starting server..."
      npx serve -l 3000 &
      echo "Server running on port 3000"
      read -p "Press enter to continue..."
      ;;

    3)
      echo "Starting Cloudflare tunnel..."
      ./cloudflared tunnel --url http://localhost:3000
      ;;

    4)
      echo "Exiting..."
      exit
      ;;

    *)
      echo "Invalid option"
      sleep 1
      ;;
  esac

done

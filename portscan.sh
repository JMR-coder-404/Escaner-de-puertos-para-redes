#!/bin/bash

function ctrl_c(){
  echo -e "\n\n[!] Saliendo...\n"
  tput cnorm; exit 1
}

trap ctrl_c INT

if [ -z "$1" ]; then
  echo -e "\n[!] Uso: $0 <IP_objetivo>\n"
  exit 1
fi

HOST=$1

tput civis

echo "[*] Escaneando todos los puertos en $HOST..."

for port in $(seq 1 65535); do
  
  (echo '' > /dev/tcp/$HOST/$port) 2>/dev/null && echo "[+] $port - OPEN" &
done; wait

tput cnorm

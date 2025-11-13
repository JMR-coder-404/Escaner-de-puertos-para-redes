#!/bin/bash

# --- Función de Salida Limpia ---
function ctrl_c(){
  echo -e "\n\n[!] Saliendo...\n"
  tput cnorm; exit 1
}

# Ctrl+C
trap ctrl_c INT

# --- Comprobación de Argumentos ---
# -z "$1" comprueba si el primer argumento ($1) está vacío.
if [ -z "$1" ]; then
  echo -e "\n[!] Uso: $0 <IP_objetivo>\n"
  exit 1
fi

# --- Cuerpo Principal del Escáner ---
HOST=$1 # Asignamos el primer argumento a una variable más clara

tput civis # Ocultar el cursor

echo "[*] Escaneando todos los puertos en $HOST..."

for port in $(seq 1 65535); do
  
  # Se ha reemplazado '127.0.0.1' por la variable '$HOST'
  (echo '' > /dev/tcp/$HOST/$port) 2>/dev/null && echo "[+] $port - OPEN" &
done; wait

# Recuperamos el cursor
tput cnorm#!/bin/bash

# --- Función de Salida Limpia ---
function ctrl_c(){
  echo -e "\n\n[!] Saliendo...\n"
  tput cnorm; exit 1
}

# Ctrl+C
trap ctrl_c INT

# --- Comprobación de Argumentos ---
# -z "$1" comprueba si el primer argumento ($1) está vacío.
if [ -z "$1" ]; then
  echo -e "\n[!] Uso: $0 <IP_objetivo>\n"
  exit 1
fi

# --- Cuerpo Principal del Escáner ---
HOST=$1 # Asignamos el primer argumento a una variable más clara

tput civis # Ocultar el cursor

echo "[*] Escaneando todos los puertos en $HOST..."

for port in $(seq 1 65535); do
  
  # Se ha reemplazado '127.0.0.1' por la variable '$HOST'
  (echo '' > /dev/tcp/$HOST/$port) 2>/dev/null && echo "[+] $port - OPEN" &
done; wait

# Recuperamos el cursor
tput cnorm


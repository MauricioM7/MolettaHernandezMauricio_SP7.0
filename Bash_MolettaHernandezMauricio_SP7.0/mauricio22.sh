#!/bin/bash

# Verificar que se pase un parámetro
if [ $# -ne 1 ]; then
    echo "Error: Se debe proporcionar un archivo como parámetro"
    echo "Uso: $0 archivo_bajas.txt"
    exit 1
fi

# Verificar que el archivo existe
if [ ! -f "$1" ]; then
    echo "Error: El archivo $1 no existe"
    exit 1
fi

# Crear directorio de logs si no existe
LOG_DIR="/var/log"
if [ ! -d "$LOG_DIR" ]; then
    mkdir -p "$LOG_DIR"
fi

# Función para registrar errores
registrar_error() {
    local login=$1
    local apellidos=$2
    echo "$(date '+%d/%m/%Y-%H:%M:%S')-$login-$apellidos-ERROR:login no existe en el sistema" >> "$LOG_DIR/bajaserror.log"
}

# Función para registrar movimientos
registrar_movimiento() {
    local login=$1
    local carpeta=$2
    local total=$3
    {
        echo "$(date '+%d/%m/%Y-%H:%M:%S')-$login-$carpeta"
        local num=1
        while IFS= read -r archivo; do
            echo "$num:$archivo"
            ((num++))
        done < <(ls "$carpeta")
        echo "Total de ficheros movidos: $total"
    } >> "$LOG_DIR/bajas.log"
}

# Procesar cada línea del archivo
while IFS=':' read -r nombre apellido1 apellido2 login || [ -n "$nombre" ]; do
    # Verificar si el usuario existe
    if id "$login" &>/dev/null; then
        # Crear carpeta para el usuario
        CARPETA_PROYECTO="/home/proyecto/$login"
        mkdir -p "$CARPETA_PROYECTO"

        # Mover archivos del directorio trabajo
        if [ -d "/home/$login/trabajo" ]; then
            mv "/home/$login/trabajo"/* "$CARPETA_PROYECTO/" 2>/dev/null
            TOTAL_ARCHIVOS=$(ls -1 "$CARPETA_PROYECTO" | wc -l)

            # Cambiar propietario a root
            chown -R root:root "$CARPETA_PROYECTO"

            # Registrar movimiento
            registrar_movimiento "$login" "$CARPETA_PROYECTO" "$TOTAL_ARCHIVOS"
        fi

        # Eliminar usuario y su directorio home
        userdel -r "$login"

    else
        # Registrar error si el usuario no existe
        registrar_error "$login" "$nombre $apellido1 $apellido2"
    fi
done < "$1"

echo "Proceso de bajas completado"
exit 0

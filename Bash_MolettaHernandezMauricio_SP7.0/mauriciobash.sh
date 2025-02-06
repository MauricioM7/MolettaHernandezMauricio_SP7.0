#!/bin/bash

#2-ASIR Mauricio Gustavo Moletta Hernandez
# Función para mostrar el menú principal
mostrar_menu() {
  echo "==============================="
  echo "     Menú Scripts"
  echo "==============================="
  echo "1. factorial "
  echo "2. bisiesto"
  echo "3. configurarred"
  echo "4. adivina"
  echo "5. edad"
  echo "6. fichero"
  echo "7. buscar"
  echo "8. contar"
  echo "9. privilegios"
  echo "10. permisosoctal"
  echo "11. romano"
  echo "12. automatizar"
  echo "13. crear"
  echo "14. crear_2"
  echo "15. reescribir"
  echo "16. contusu"
  echo "17. alumnos"
  echo "18. quita_blancos"
  echo "19. lineas"
  echo "20. analizar"
  echo "0. Salir"
  echo "==============================="
}

# Que es...
factorial() {
#Declara el valor de factorial
factorial=1

#bucle
for ((i=1;i<=$1;i++))
do
    factorial=$(($factorial*$i))
done

echo Factorial de $1 es $factorial
}





#Realizamos el condicional, dividiendo el año y dependiendo de su resultado nos dirá
#si es bisiesto o no.
bisiesto() {
  if (( $1 % 4 == 0 && $1 % 100 != 0 || $1 % 400 == 0 )); then
    echo "El año $1 es bisiesto."
  else
    echo "El año $1 no es bisiesto."
  fi
}





#Especificamos las líneas del Netplan para luego enviarlas a sobreescribir nuestro
#archivo netplan y aplicar los cambios. Luego verificamos lo cambiado.
configurarred() {
  clear
echo "network:
  ethernets:
    enp0s3:
      dhcp4: false
      addresses:
        - $1/$2
      nameservers:
        addresses: [$4]
      routes:
        - to: 0.0.0.0/0
          via: $3
  version: 2" | tee /etc/netplan/50-cloud-init.yaml

netplan apply

sleep 2
  echo "Configuración aplicada:"
  ip a
  sleep 4
}






adivina() {
  clear
#Generamos el numero random
numero_secreto=$((RANDOM % 100 + 1))
#Declaramos las variabes de intentos y intento a 0
intentos=0
intento=0
echo "Adivina el número entre 1 y 100"
#Comenzamos el bucle
while [ "$intento" -ne "$numero_secreto" ]; do
#Incrementamos el numero de intentos.
    ((intentos++))
    read -p "Tu número: " intento
#Le pedimos un numero y si esye es igual nos mostrará un mensaje
    if [ "$intento" -eq "$numero_secreto" ]; then
        echo "¡Ganaste!, el numero $intento es el mismo que el secreto ( $numero_secreto ), Intentos: $intentos"
#Si el numero que damos por consola es menor nos lo dirá y si no pues también.
    elif [ "$intento" -lt "$numero_secreto" ]; then
        echo "El numero $intento es menor que el numero secreto"
    else
        echo "El numero $intento es mayor que el numero secreto"
    fi
done
  sleep 4
}







# Realizamos el condicional, dependiendo de la edad que insertemos nos dirá algo.
edad() {
  clear
  read -p "Ingresa tu edad: " edad
  if (( edad < 3 )); then
    echo "Estás en la niñez."
  elif (( edad <= 10 )); then
    echo "Estás en la infancia."
  elif (( edad < 18 )); then
    echo "Estás en la adolescencia."
  elif (( edad < 40 )); then
    echo "Estás en la juventud."
  elif (( edad < 65 )); then
    echo "Estás en la madurez."
  else
    echo "Estás en la vejez."
  fi
  sleep 4
}






#Que es...
fichero() {
  clear
  read -p "Introduce el nombre del fichero con su ruta absoluta: " file
#Comprobamos si el fichero existe
  if [ -e "$file" ]; then
    echo "Información del fichero:"
#Vemos el tamaño del fichero en bytes
    echo "Tamaño: $(stat --format='%s' "$file") bytes"
#Muestra el tipo de fichero (por ejemplo texto, imagen, ejecutable, etc)
    echo "Tipo: $(file -b "$file")"
#Mostamos el número de inodo del fichero
    echo "Inodo: $(stat --format='%i' "$file")"
#Mostramos el punto de montaje
    echo "Punto de montaje: $(df "$file" --output=target | tail -n 1)"
  else
    echo "El fichero no existe. Por favor, verifica la ruta."
  fi

sleep 4
}





#Que es...
buscar() {
  clear
  read -p "Introduce el nombre del fichero (sin ruta) para buscarlo en el sistema: " filename

   # Busca el archivo en todo el sistema y almacena su ruta
  file_path=$(find / -type f -name "$filename" 2>/dev/null)

  if [ -z "$file_path" ]; then
    echo "Error: El fichero '$filename' no se encuentra en el sistema."
  else
    echo "El fichero se encuentra en: $file_path"

    # Cuenta el número de vocales en el archivo (ignorando mayúsculas/minúsculas)
    vocales=$(grep -o -i '[aeiou]' "$file_path" | wc -l)
    echo "El número de vocales en el archivo es: $vocales"
  fi

sleep 4
}



contar() {
  clear
  read -p "Introduce la ruta del directorio el cual quieres ver cuantos archivos hay dentro: " dir
#Comienza en condicional que define si el directorio existe o no.
  if [ -d "$dir" ]; then
#Busca el directorio y recorre los ficheros de este directorio contandolos.
    num_files=$(find "$dir" -type f | wc -l)
    echo "El número de archivos en el directorio '$dir' es: $num_files"
  else
    echo "El directorio no existe. Por favor, verifica la ruta."
  fi

sleep 4
}







privilegios() {
clear
  # Comprueba si el usuario tiene privilegios administrativos (Si se encuentra en sudoers)
usuario=$(whoami)

 if grep -q "^$usuario" /etc/sudoers
        then
                echo "El usuario $usuario tiene permisos administrativos"
        else
                echo "El usuario $usuario no tiene permisos administrativos"
        fi
sleep 4
}






permisosoctal() {
clear
# Leer la ruta del archivo
read -p "Introduce la ruta absoluta del archivo: " ruta

# Obtener permisos en octal
permisos=$(stat -c '%a' "$ruta")

echo "Los permisos en octal son: $permisos"
sleep 4
}







#Que es...
romano() {
clear
  read -p "Introduce un número entre 1 y 200: " num
# Verifica si el número está fuera del rango permitido 
  if [[ $num -lt 1 || $num -gt 200 ]]; then
    echo "El número debe estar entre 1 y 200."
    return # Termina la función si el número no está en el rango válido
  fi

    # - `simbolos`: contiene los símbolos romanos ordenados de mayor a menor valor
  # - `valores`: contiene los valores numéricos correspondientes a cada símbolo romano
  simbolos=(C XC L XL X IX V IV I)
  valores=(100 90 50 40 10 9 5 4 1)

  resultado=""   # Inicializamos la variable `resultado` como una cadena vacía

  # Bucle para recorrer los valores numéricos y sus símbolos correspondientes
  for i in "${!valores[@]}"; do
    # Mientras el número sea mayor o igual al valor actual en `valores[i]`
    while (( num >= valores[i] )); do
      resultado+=${simbolos[i]} # Agregamos el símbolo romano correspondiente
      (( num -= valores[i] )) # Restamos ese valor del número
    done
  done

  echo "El número romano es: $resultado"
sleep 4
}







#Que es...
automatizar() {
clear
    # Crear directorio si no existe
    if [ ! -d "/mnt/usuarios" ]; then
        mkdir -p /mnt/usuarios
        echo "Directorio /mnt/usuarios creado"
	sleep 2
        return
    fi

    # Verificar si está vacío
    if [ -z "$(ls /mnt/usuarios)" ]; then
        echo "Listado vacío"
	sleep 2
        return

    fi

    # Por cada archivo es un usuario a crear, verificamos si existe y por cada linea del archivo (del usuario) es un directoria a crear,
    #luego de esto borramos el archivo para que en caso de añadirse mas usuarios no tenga que crear los anteriores de nuevo.
    for usr in $(ls /mnt/usuarios)
    do
        uname=$(cat /etc/passwd | grep $usr)
        if [ $uname ]
        then
                echo "El usuario $usr ya existe..."
		sleep 2
        else
                echo "Creando el usuario $usr..."
                useradd -m $usr
		sleep 2
        fi

        dirs=$(cat /mnt/usuarios/$usr)
        for dir in $dirs
        do
                mkdir -p /home/$usr/$dir
		echo "Creando el directorio $dir para el usuario $usr..."
		sleep 2
        done
	echo "Borrando archivo de configuracion del $usr..."
        rm /mnt/usuarios/$usr
	sleep 2
    done
	echo "Proceso completado."
	sleep 2
}






#Define el nombre por defecto si no le pasamos uno por parámetros y lo mismo con el tamaño
crear() {
  echo "=== Crear Fichero ==="
    # Si no hay primer parámetro, usar fichero_vacio como nombre
    # Si hay un solo parámetro y es un número, usarlo como tamaño
    if [[ -z "$1" ]] || [[ "$1" =~ ^[0-9]+$ ]]; then
        nombre="fichero_vacio"
        tamano=${1:-1024}
    else
        nombre="$1"
        tamano=${2:-1024}
    fi

  # Crear el fichero con fallocate
  echo "Creando fichero $nombre con tamaño ${tamano}K..."
  sleep 1
  fallocate -l "${tamano}K" "$nombre"
  sleep 1

	echo "Comprobando..."
	sleep 1
	echo "Fichero creado correctamente:"
	# Verificamos que se creó y su respectivo tamaño en formato humano.
	ls -lh $nombre
	sleep 2
}






#Que es...
crear_2() {
echo "=== Crear Fichero ==="
    # Si no hay primer parámetro, usar fichero_vacio como nombre
    # Si hay un solo parámetro y es un número, usarlo como tamaño
    if [[ -z "$1" ]] || [[ "$1" =~ ^[0-9]+$ ]]; then
        nombre="fichero_vacio"
        tamano=${1:-1024}
    else
        nombre="$1"
        tamano=${2:-1024}
    fi

  # Comprobar si el fichero ya existe y crear uno alternativo si es necesario
  for i in {0..9}; do
    if [[ $i -eq 0 ]]; then
      fichero="$nombre"
    else
      fichero="${nombre}${i}"
    fi

    # Si no existe, lo creamos y salimos del bucle
    if [[ ! -e "$fichero" ]]; then
      echo "Creando fichero $fichero con tamaño ${tamano}K..."
      sleep 2
      fallocate -l "${tamano}K" "$fichero"
      sleep 2

      echo "Comprobando..."
      sleep 1
      echo "Fichero creado correctamente:"
      ls -lh "$fichero"
      sleep 2
      return
    fi
  done

  # Si llegamos aquí, es porque ya existen los 10 ficheros posibles
  echo "Ya existen los ficheros hasta ${nombre}9. No se puede crear el fichero."
}






#Que es...
reescribir() {
clear
#Verifica si la palabra existe
if [[ -z "$palabra" ]]; then
    echo "Por favor, introduce una palabra como parámetro."
    return
  fi

  # Reemplazamos las vocales por los números correspondientes
  resultado=$(echo "$palabra" | tr 'aeiou' '12345')

  echo "Palabra original: $palabra"
  echo "Palabra reescrita: $resultado"

sleep 3
}






#Que es...
contusu() {
clear
    # Listar solo usuarios reales (que tengan directorio en /home y estén en /etc/passwd)
    echo "Usuarios con directorio en /home:"
    # Filtramos usuarios reales: existentes en /etc/passwd y con directorio en /home
    usuarios=($(awk -F: '$3 >= 1000 && $3 != 65534 {print $1}' /etc/passwd | while read user; do
        if [ -d "/home/$user" ]; then
            echo "$user"
        fi
    done))

    # Mostrar número total de usuarios reales
    echo "Total de usuarios reales: ${#usuarios[@]}"
    echo

# Muestra menú de selección y valida entrada del usuario
  echo "Selecciona un usuario: (1,2,3,...) "
  select usuario in "${usuarios[@]}"; do
    [[ -n "$usuario" ]] && break # Si la selección es válida, sale del bucle
    echo "Opción no válida. Intenta de nuevo." # Mensaje de error si selección inválida
  done

  # Crear copia de seguridad
  # Define ruta destino con formato: /home/copiaseguridad/usuario_fecha
  destino="/home/copiaseguridad/${usuario}_$(date +%d%m%Y)"
  mkdir -p "$destino" # Crea el directorio destino (-p crea directorios padre si no existen)
  cp -r "/home/$usuario/"* "$destino" # Copia recursiva del contenido del usuario
  echo "Copia de seguridad completada en: $destino" # Confirma finalización

sleep 3
}








#Que es...
alumnos() {
clear
  echo "=== Notas de la clase ==="

  # Solicitar el número de alumnos
  read -p "Introduce el número de alumnos: " num_alumnos

  aprobados=0
  suspensos=0
  suma=0

  # Recoger notas de los alumnos
  for ((i=1; i<=num_alumnos; i++)); do
    read -p "Nota del alumno $i: " nota
    if (( nota >= 5 )); then
      ((aprobados++))
    else
      ((suspensos++))
    fi
    suma=$((suma + nota))
  done

  # Calcular y mostrar resultados
  echo "Aprobados: $aprobados"
  echo "Suspensos: $suspensos"
  echo "Nota media: $((suma / num_alumnos))"

sleep 3
}





#Que es...
quita_blancos() {
clear
  echo "Renombrando archivos con espacios en blanco..."

  for archivo in *; do
    if [[ "$archivo" == *" "* ]]; then
      nuevo_nombre="${archivo// /_}"
      mv "$archivo" "$nuevo_nombre"
      echo "Renombrado: '$archivo' -> '$nuevo_nombre'"
	sleep 2
    fi
  done

  echo "Renombrado completo."
	sleep 3
}






#Que es...
lineas() {
clear
  # Validar los parámetros
  if [[ -z $1 || -z $2 || -z $3 ]]; then
    echo "Error: Debes proporcionar todos los datos."
	sleep 2
    return
  fi

  if (($2 < 1 || $2 > 60 || $3 < 1 || $3 > 10)); then
    echo "Error: El número de longitud debe estar entre 1 y 60, y el número de líneas entre 1 y 10."
	sleep 2
    return
  fi

  # Dibujar las líneas
  for ((i = 1; i <= $3; i++)); do
    printf "%-${2}s\n" | tr ' ' "$1"
  done
sleep 4
}







#Que es...
analizar() {
  # Comprobar si el directorio existe
  if [[ ! -d $1 ]]; then
    echo "Error: El directorio $directorio no existe."
	sleep 2
    return
  fi

  # Comprobar si se han proporcionado extensiones
  if [[ -z $2 ]]; then
    echo "Error: Debes proporcionar al menos una extensión para analizar."
	sleep 2
    return
  fi

  echo "=== Análisis del directorio: $directorio ==="
  echo

  # Contar archivos por cada extensión
  for extension in $2; do
    cantidad=$(find "$1" -type f -name "*.$extension" | wc -l)
    echo "Archivos con extensión .$extension: $cantidad"
  done

  echo
  echo "Análisis completado."
sleep 4
}











opcion=1
while [ "$opcion" -ne 0 ]; do
  mostrar_menu
  read -p "Elige una opción [0-20]: " opcion
  if [[ "$opcion" =~ ^[0-9]+$ ]]; then
case $opcion in

    1)
         clear
	 read -p  "Ingresa un numero para realizar el factorial: " num
    factorial $num
    ;;



    2)
	clear
	read -p "Ingresa un año para verificar si es bisiesto: " anio
    bisiesto $anio
    ;;



    3)
  	read -p "Introduce la IP: " ip
  	read -p "Introduce la máscara de red (CIDR, e.g., 24): " mascara
  	read -p "Introduce la puerta de enlace: " gateway
  	read -p "Introduce el DNS: " dns
    configurarred $ip $mascara $gateway $dns
    ;;



    4) adivina ;;
    5) edad ;;
    6) fichero ;;
    7) buscar ;;
    8) contar ;;
    9) privilegios ;;
    10) permisosoctal ;;
    11) romano ;;
    12) automatizar ;;



    13)
	    # Solicitar el nombre del fichero al usuario
	    read -p "Introduce el nombre del fichero (por defecto: fichero_vacio): " nombre
	    # Solicitar el tamaño del fichero al usuario
	    read -p "Introduce el tamaño del fichero en KB (por defecto: 1024): " tamano
  crear $nombre $tamano
    ;;



    14)
	      # Solicitar el nombre del fichero al usuario
        read -p "Introduce el nombre del fichero (por defecto: fichero_vacio): " nombre
         # Solicitar el tamaño del fichero al usuario
        read -p "Introduce el tamaño del fichero en KB (por defecto: 1024): " tamano
	crear_2 $nombre $tamano
    ;;



    15)
	    read -p "Introduce una palabra: " palabra
  reescribir $palabra
    ;;



    16) contusu ;;
    17) alumnos ;;
    18) quita_blancos ;;



    19)
      # Solicitar los parámetros
      read -p "Introduce un carácter: " caracter
      read -p "Introduce un número entre 1 y 60 (longitud de cada línea): " longitud
      read -p "Introduce un número entre 1 y 10 (cantidad de líneas): " cantidad
  lineas $caracter $longitud $cantidad
    ;;



    20)
	    clear
	    # Solicitar el directorio
	    read -p "Introduce el directorio a analizar: " directorio
	    # Solicitar extensiones
	    read -p "Introduce las extensiones a analizar (separadas por espacio): " extensiones
  analizar $directorio $extensiones
    ;;



    0) echo "Saliendo del programa..." ;;
    *) echo "Opción no válida, por favor elige una opción del 0 al 20." ;;
  esac
else
	opcion=1
	echo "Error: Por favor introduce un valor numerico válido"
fi
done

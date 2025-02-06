# -*- coding: utf-8 -*-
"""MauricioMCopia de SP 7.0 Scripting en Python.ipynb

Automatically generated by Colab.

Original file is located at
    https://colab.research.google.com/drive/1ujG5OG9Ia9gkxEPgPuyaTCjAB7JeZE3j

1.   Dos motos viajan a diferentes velocidades (**vel1** y **vel2**) y están distanciados por una distancia **dis**. La moto que se encuentra detrás lleva una velocidad mayor que la primera. Se pide realizar un script en python que solicite al usuario la distancia entre las motos en km y las velocidades de las mismas y con ello devolver en cuanto tiempo la moto 2 alcanzará a la moto 1.
"""

# Solicitar al usuario la distancia entre las motos y sus velocidades
distancia = float(input("Ingresa la distancia entre las motos (en km): "))
vel1 = float(input("Ingresa la velocidad de la moto 1 (en km/h): "))
vel2 = float(input("Ingresa la velocidad de la moto 2 (en km/h): "))

# Verificar que la moto 2 sea más rápida que la moto 1
if vel2 <= vel1:
    print("La moto 2 no puede alcanzar a la moto 1 porque no es más rápida.")
else:
    # Calcular el tiempo necesario para que la moto 2 alcance a la moto 1
    tiempo_horas = distancia / (vel2 - vel1)
    horas = int(tiempo_horas)  # Parte entera (horas)
    minutos = int((tiempo_horas - horas) * 60)  # Parte decimal convertida a minutos

    # Mostrar el resultado en horas y minutos
    print(f"La moto 2 alcanzará a la moto 1 en {horas} horas y {minutos} minutos.")










"""2. El tutor de 2º ASIR esta organizando un viaje a Granada, y requiere determinar cuánto debe cobrar a cada alumne y cuánto debe pagar a la agencia de viajes. La forma de cobrar es la siguiente: si son 100 alumnos o más, el costo por cada alumno es de 65 euros; de 50 a 99 alumnos, el costo es de 70 euros, de 30 a 49, de 95 euros, y si son menos de 30, el costo de la guagua es de 4000 euros, sin importar el número de alumnos. Realice un script que permita determinar el pago a la compañía de guaguas y lo que debe pagar cada alumno por el viaje."""

#Ingresamos el numero de alumnos
alumnos = int(input("Ingrese la cantidad de alumnos: "))
#Comenzamos el condicional dependiendo del numero de alunmos, pues se pagará cierta cantidad de dinero.
if alumnos >= 100:
  print(f"el pago de la agencia es de {alumnos*65} euros y cada alumno debe pagar 65 euros")
elif alumnos < 100 and alumnos >= 50:
  print(f"El pago a la agencia es de {alumnos*70} euros y cada alumno debe de pagar 70 euros")
elif alumnos < 50 and alumnos >=30:
  print(f"El pago a la agencia es de {alumnos*95} euros y cada alumno debe de pagar 95 euros")
else:
  print(f"El coste de la guagua es de 4000 euros y cada alumno debe pagar {int(4000/alumnos)} euros")










"""3. Crea un script que permita adivinar un número. La aplicación genera un número aleatorio del 1 al 100. A continuación va pidiendo números y va respondiendo si el número a adivinar es mayor o menor que el introducido, además de los intentos que te quedan (tienes 10 intentos para acertarlo).  El programa termina cuando se acierta el número (además te dice en cuantos  intentos lo has acertado), si se llega al limite de intentos te muestra el  número que había generado."""

import random

# Generamos el número aleatorio y establecemos los intentos en 0
numero = random.randint(1, 100)
intentos = 0
while intentos < 10:
    adivinanza = int(input("Adivina el número (entre 1 y 100): "))
    intentos += 1
    if adivinanza == numero:
        print(f"¡Correcto! Lo adivinaste en {intentos} intentos.")
        break
    elif adivinanza < numero:
        print("El número que acabas de insertar es más bajo. Inténtalo de nuevo.")
    else:
        print("El número que acabas de insertar es más alto. Inténtalo de nuevo.")
# Si el jugador no acierta en 10 intentos, muestra el número correcto
if adivinanza != numero:
    print(f"Lo siento, has alcanzado el límite de intentos. El número era {numero}.")










"""4. Realizar un script que pida una String por teclado que contenga espacios y devuelva el número de palabrás que contenga"""

#contar palabras en Python.
oracion = input("Ingrese una oración: ")
#Cuenta la longitud de ellas (Cuantas palabras hay).
numero_de_palabras = len(oracion.split())

print("Número de palabras en la oración:", numero_de_palabras)












"""5. Realiza un script que se le pasen 5 notas de un alumno por teclado (comprendidas entre 0 y 10). A continuación debe mostrar todas las notas, la nota media, la nota más alta que ha sacado y la menor.


"""

#Establecemos la array donde se almacenaran las notas
notas = []
#Pedimos 5 notas
for i in range(5):
  nota = float(input(f"Ingrese la nota {i+1}: "))
  #Solo pueden ser notas de 0 a 10.
  while nota < 0 or nota > 10:
    nota - float(input("La nota debe estar entre 0 y 10. Ingrese una nota válida: "))
  notas.append(nota)

#Realizamos las respuestas, mostrando la array de las notas almacenadas y realizando las operaciones media, maximo y mínimo.
print("Las notas ingresadas son:", notas)
print("La nota media es:",(sum(notas)/len(notas)))
print("La nota mas alta es:", max(notas))
print("La nota mas baja es:", min(notas))













"""6. Realizar un script que cree una una tabla bidimensional de 5x5 y
nombre 'diagonal'. La Componentes de la tabla en su diagonales deben de ser 1 y el resto 0. Se ha de mostrar el contenido de la tabla por pantalla.
"""

# Create a 5x5 table with all elements initialized to 0
diagonal = [[0 for _ in range(5)] for _ in range(5)]

# Set diagonal elements to 1
for i in range(5):
    diagonal[i][i] = 1  # Main diagonal
    diagonal[i][4 - i] = 1  # Anti-diagonal (other diagonal)

# Display the table
for row in diagonal:
    print(row)












"""7. Crea un script que pida un número y cree un diccionario cuyas claves sean desde el número 1 hasta el número indicado, y los valores sean los cuadrados de las claves.


"""

# Escribe un programa python que pida un número por teclado y que cree un diccionario cuyas
# # claves sean desde el número 1 hasta el número indicado, y los valores sean los cuadrados de las claves.

numero = int(input("Dime un número:"))
cuadrados = {}

for num in range(1,numero+1):
    cuadrados[num] = num ** 2
for num, valor in cuadrados.items():
    print("%d -> %d" % (num,valor))












"""8. Crea un script de una agenda en la que se guardan nombres y números de teléfono. En la agenda existirá un menú con las siguientes opciones:
 * **Añadir/modificar**: Nos pide un nombre. Si el nombre se encuentra en la agenda, debe mostrar el teléfono y, opcionalmente, permitir modificarlo si no es correcto. Si el nombre no se encuentra, debe permitir ingresar el teléfono correspondiente.
 * **Buscar**: Nos pide una cadena de caracteres, y nos muestras todos los contactos cuyos nombres comiencen por dicha cadena.
 * **Borrar**: Nos pide un nombre y si existe nos preguntará si queremos borrarlo de la agenda.
 * **Listar**: Nos muestra todos los contactos de la agenda.

  Implementar el script con un diccionario.
"""

# Declaramos un diccionario llamado agenda
agenda = {}

# Inicializamos la variable opcion antes del bucle
opcion = -1

# Abrimos el menú
while opcion != 5:
    print("\nMenú de la agenda:")
    print("1. Añadir/modificar")
    print("2. Buscar")
    print("3. Borrar")
    print("4. Listar")
    print("5. Salir")

    # Pedimos una opción al usuario
    opcion = int(input("Dime opción: "))

    if opcion == 1:
        nombre = input("Nombre del contacto: ")
        if nombre in agenda:
            print(f"{nombre} ya existe, su número de teléfono es {agenda[nombre]}")
            opcion_modificar = input("Pulsa 's' si quieres modificarlo. Otra tecla para continuar: ")
            if opcion_modificar.lower() == "s":
                numero = input("Dame el nuevo número de teléfono: ")
                agenda[nombre] = numero
        else:
            numero = input("Dame el número de teléfono: ")
            agenda[nombre] = numero

    elif opcion == 2:
        cadena = input("Nombre del contacto a buscar: ")
        encontrado = False
        for nombre, numero in agenda.items():
            if nombre.startswith(cadena):
                print(f"El número de teléfono de {nombre} es {numero}")
                encontrado = True
        if not encontrado:
            print("No se encontró ningún contacto con ese nombre.")

    elif opcion == 3:
        nombre = input("Nombre del contacto para borrar: ")
        if nombre in agenda:
            opcion_borrar = input("Pulsa 's' si quieres borrarlo. Otra tecla para continuar: ")
            if opcion_borrar.lower() == "s":
                del agenda[nombre]
                print(f"Contacto {nombre} eliminado.")
        else:
            print("No existe el contacto.")

    elif opcion == 4:
        if agenda:
            print("\nLista de contactos:")
            for nombre, numero in agenda.items():
                print(f"{nombre} -> {numero}")
        else:
            print("La agenda está vacía.")

    elif opcion == 5:
        print("Saliendo del programa...")

    else:
        print("Opción incorrecta. Inténtalo de nuevo.")












"""9. Crear un script que al introducir una fecha nos diga a que día juliano corresponde. El día juliano correspondiente a una fecha es un número entero que indica los días que han transcurrido desde el 1 de enero.Para ello debes de hacer las siguientes funciones:
 * **LeerFecha**: Lee por teclado el día, mes y el año.
 * **DiasDelMes**: Recibe un mes y un año y devuelve el número de días
 * **EsBisiesto**: Recibido un año nos dice si es bisiesto o no.
 * **Calcular_Dia_Juliano**: Recibe una fecha y nos devuelve el día juliano.
"""

from datetime import datetime

def fecha_a_dia_juliano(fecha):
    # Convierte la fecha a un objeto datetime
    fecha_obj = datetime.strptime(fecha, '%Y-%m-%d')

    # Obtiene la fecha del 1 de enero del mismo año
    inicio_anio = datetime(fecha_obj.year, 1, 1)

    # Calcula la diferencia en días
    dias_transcurridos = (fecha_obj - inicio_anio).days + 1

    return dias_transcurridos

# Pide al usuario que introduzca una fecha
fecha_usuario = input("Introduce una fecha en formato YYYY-MM-DD: ")

try:
    # Intenta convertir la fecha a día juliano y muestra el resultado
    dia_juliano = fecha_a_dia_juliano(fecha_usuario)
    print(f"El día juliano correspondiente a la fecha {fecha_usuario} es: {dia_juliano}")
except ValueError:
    print("Error: El formato de la fecha es incorrecto. Por favor, utiliza el formato YYYY-MM-DD.")










    

"""
10. Función CalcularMCD: Recibe dos números y devuelve el MCD utilizando el método de Euclides.
El método de Euclides es el siguiente:
 * Se divide el número mayor entre el menor.
 * Si la división es exacta, el divisor es el MCD.
 * Si la división no es exacta, dividimos el divisor entre el resto obtenido y se continúa de esta forma hasta obtener una división exacta, siendo el último divisor el MCD.
"""

def calcular_mcd(a, b):
    while b:
        a, b = b, a % b
    return a

# Ejemplo de su funcionamiento
numero1 = int(input("Ingrese el primer número: "))
numero2 = int(input("Ingrese el segundo número: "))

mcd = calcular_mcd(numero1, numero2)
print(f"El MCD de {numero1} y {numero2} es: {mcd}")
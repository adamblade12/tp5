#!/bin/bash
#Definir el rango
min=1
max=100
adivinado=false

#Generar numero aleatorio
numAleatorio=$(( $min + $RANDOM % $max ))

#Imprimir el numero
echo "Numero aleatorio entre $min y $max:$numAleatorio"

#Introducir un numero para comparar
read -p "Adivine el numero:  " adivinar

#Mientras que el numero ingresado sea diferente al numero generado
while [ $adivinado == false ]; do
    diferencia=$(( $numAleatorio - $adivinar ))

    if (( $adivinar == $numAleatorio )); then
        echo "Adivinaste"
        adivinado=true
#Compara el numero ingresado con el generado y muestra un respectivo cartel segun si este es menor o mayor al numero generado        
     elif (( ($diferencia <=10) && ($diferencia > 0) )); then
         echo "Caliente (Muy bajo)"
         read -p "Intentalo de nuevo: " adivinar
     elif (( ($diferencia >= -10) && ($diferencia < 0) )); then 
         echo "Caliente (Muy alto)"
         read -p "Intentalo de nuevo: " adivinar
     elif (( ($diferencia < -10) )); then 
         echo "Frio (Muy alto)"
         read -p "Intentalo de nuevo: " adivinar
     elif (( ($diferencia > 10) )); then 
         echo "Frio (Muy bajo)"
         read -p "Intentalo de nuevo: " adivinar
     fi
     
done

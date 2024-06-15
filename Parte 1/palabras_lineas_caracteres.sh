#!/bin/bash

#Referencia al archivo dentro de la misma carpeta que el archivo bash
archivo="archivo.txt"

#Lee el archivo linea por linea y muestra su contenido
while IFS= read -r line;
do
    echo "$line"
done < $archivo
echo

#Cuenta y guarda el numero de lineas que contiene el archivo
#Despues muestra el numero resultante
numLineas=$(wc -l < "$archivo")
echo "Cantidad de lineas: $numLineas"

#Cuenta y guarda el numero de palabras que contiene el archivo
#Despues muestra el numero resultante
numPalabras=$(wc -w < "$archivo")
echo "Cantidad de palabras: $numPalabras"

#Cuenta y guarda el numero de caracteres que contiene el archivo
#Despues muestra el numero resultante
numCaracteres=$(wc -m < "$archivo")
echo "Cantidad de caracteres: $numCaracteres"


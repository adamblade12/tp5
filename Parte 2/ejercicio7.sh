#!/bin/bash
#En este programa se usa jq para interpretar el atchivo jason
echo "Introduce un nombre:"
read NOMBRE

URL="https://api.genderize.io?name=${NOMBRE}"

response=$(curl -s $URL)

genero=$(echo $response | jq -r '.gender')

if [ "$genero" != "null" ]; then
    echo "El género probable para el nombre ${NOMBRE} es: ${genero}"
else
    echo "No se pudo determinar el género para el nombre ${NOMBRE}."
fi

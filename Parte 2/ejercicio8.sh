#!/bin/bash

echo "Introduce un nombre:"
read NOMBRE

URL="https://api.agify.io/?name=${NOMBRE}"

response=$(curl -s $URL)

edad=$(echo $response | jq -r '.age')

if [ "$edad" != "null" ]; then
    echo "La edad probable para el nombre ${NOMBRE} es: ${edad} años"
else
    echo "No se pudo determinar la edad para el nombre ${NOMBRE}."
fi

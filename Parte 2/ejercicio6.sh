#!/bin/bash
#Se usa jq para formatear e imterpretar la salida json
#El nombre de la ciudad(obtenido desde la API) tiene el caracter espacio codificado

API_KEY="19e4d301cee34f72a22174951241806"
CITY="New%20York"

URL="https://api.weatherapi.com/v1/forecast.json?q=${CITY}&days=1&key=${API_KEY}"

response=$(curl -s $URL)

temperature=$(echo $response | jq '.current.temp_c')
weather=$(echo $response | jq -r '.current.condition.text')

OUTPUT_FILE="clima.txt" 

echo $response | jq . > $OUTPUT_FILE

echo "La temperatura en ${CITY} es: ${temperature}°C"
echo "El clima en ${CITY} es: ${weather}"

echo "Se guardo en ${OUTPUT_FILE}"

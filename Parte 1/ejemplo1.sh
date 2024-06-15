#!/bin/bash

cronometro(){
	local segundos=0
	while true; do
		echo -ne "Tiempo transcurrido: $segundos segundos\r"
		((segundos++))
		sleep 1
	done
}

detener_cronometro(){
	kill $cronometro_pid
	echo -e "\nCronometro detenido. Tiempo total: $segundos segundos"
}

reiniciar_cronometro(){
	segundos=0
	cronometro &
	cronometro_pid=$!
}

while true; do
	read -p "presiona 's' para detener, 'r' para reiniciar o 'q' para salir: " opcion
	case $opcion in
		s)
			detener_cronometro
			break
			;;
		r)
			detener_cronometro
			reiniciar_cronometro
			;;
		q)
			detener_cronometro
			exit 0
			;;
		*)
			echo "Opcioninvalida"
			;;
	esac
done

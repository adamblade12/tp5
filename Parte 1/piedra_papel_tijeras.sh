#!/bin/bash
#Crea un arreglo para que guarda las posibilidades que tiene la maquina
jugadas=("piedra" "papel" "tijeras")
jugadaNpc=""
#Variable de condicion para el bucle
ganador=false
#Muestra el contenido del arreglo de jugadas posibles de la maquina
for i in ${!jugadas[@]}; do
    echo "[ $i ] ${jugadas[$i]}"
done

#Mientras no haya un ganador o eljugador introduzca un valor indeseado
while [ $ganador == false ]; do

#Genera un numero aleatorio entre 0 y 3 que representan un elemento en el arreglo
    npc=$(( $RANDOM%3 ))
    jugadaNpc=${jugadas[$npc]}
#Muestra la jugada de la maquina(instruccion de control)
    echo "$jugadaNpc"
#Lee una cadena de caracteres con la jugada del usuario y la valida
    read -p "Ingrese una jugada: " jugador
    if [[ "$jugador" == "piedra" || "$jugador" == "papel" || "$jugador" == "tijeras" ]]; then
        echo "Jugada aceptada"
#Si la cadena de caracteres ingresado es valida se calcula los posibles casos de que gane la maquina o el usuario
        if [[ ("$jugador" == "piedra") && ("$jugadaNpc" == "tijeras") ]]; then
            ganador=true
            echo "Gana el jugador"
        elif [[ ("$jugador" == "papel") && ("$jugadaNpc" == "tijeras") ]]; then
            ganador=true
            echo "Gana la maquina"
        elif [[ ("$jugador" == "piedra") && ("$jugadaNpc" == "papel") ]]; then
            ganador=true
            echo "Gana la maquina"
        elif [[ ("$jugador" == "papel") && ("$jugadaNpc" == "piedra") ]]; then
            ganador=true
            echo "Gana el jugador"
        elif [[ ("$jugador" == "tijeras") && ("$jugadaNpc" == "piedra") ]]; then
            ganador=true
            echo "Gana la maquina"
        elif [[ ("$jugador" == "tijeras") && ("$jugadaNpc" == "papel") ]]; then
            ganador=true
            echo "Gana el jugador"
        else
            echo "Empate"
        fi
#Si ambas cadenas son iguales se declara empate
    else
        echo "Jugada no valida"
        echo
    fi

done

#!/bin/bash

#Pide que el usuario ingrese los dos numeros a operar
read -p "Ingrese el primer numero: " a
read -p "Ingrese el segundo numero: " b

#Imprime un menu de las operaciones posibles
echo "Ingrese una operacion aritmetica: " 
echo "+:Suma"
echo "-:Resta"
echo "*:Multiplicar"
echo "/:Dividir"

#Ingresa una opcion de operador
read opcion

#Dependiendo del operador ingresado, ejecula la operacion 
#aritmetica y muestra el resultado en la pantalla
#Si se ingresa un caracter no deseado, se muestra un mensaje de error
#Tambien muestra un error cuando b es 0, por la division
if expr "$a" + 0 &>/dev/null; then
    if (( b != 0 )); then
        case $opcion in
            "+")
            echo $(( a+b ))
            ;;
            "-")
            echo $(( a-b ))
            ;;
            "*")
            echo $(( a*b ))
            ;;
            "/")
            echo $(( a/b ))
            ;;
            *)
            echo "Operador no valido"
            ;;
        esac
    else
        echo "El segundo numero no puede ser 0"
    fi
else 
    echo "Ingrese numeros en los operandos"
fi

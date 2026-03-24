#!/bin/bash
#script de menu dedicado a varias opciones
echo "Opciones"
echo "1: crear entorno"
echo ¨seleccione una opcion:¨
read OP
#pretendo chequear que sea un numero mandandolo a fallo de no serlo
if ! [[ $OP =~ ^[0-9]+$  ]]; then
	echo "por favor ingrese un numero"
	exit 1 
#parte funcional del codigo
elif [ $OP -eq 1 ]; then
	echo "creando entorno"
	cd $HOME; mkdir EPNro1; cd EPNro1;  mkdir entrada; mkdir salida; mkdir procesado
else
	echo "opcion no encontrada"
fi
 

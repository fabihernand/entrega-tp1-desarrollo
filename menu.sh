#!/bin/bash


opc=0

BASE="$HOME/EPNro1"
ENTRADA="$BASE/entrada"
SALIDA="$BASE/salida"
PROCESADO="$BASE/procesado"


while [ $opc -ne 6 ] ; do


echo "1. Crear entorno."
echo "2. Correr proceso."
echo "3. Mostrar por pantalla el listado de alumnos ordenados por numero de padron."
echo "4. Mostrar por pantalla las 10 notas mas altas del listado."
echo "5. Ingrese un numero de padron: "
echo "6. Salir"
echo


read -p "Seleccione una opcion:" opc

case $opc in


	1)	cd $HOME; mkdir -p EPNro1; cd EPNro1;  mkdir -p entrada; mkdir -p salida; mkdir -p procesado
		echo Creando entorno...
		cat > "$BASE/consolidar.sh" << 'EOF'
#!/bin/bash

BASE="$HOME/EPNro1"
ENTRADA="$BASE/entrada"
SALIDA="$BASE/salida"
PROCESADO="$BASE/procesado"

while true; do

    for f in "$ENTRADA"/*.txt; do

        if [ -f "$f" ]; then

            cat "$f" >> "$SALIDA/$FILENAME.txt"
            
            mv "$f" "$PROCESADO/"
            
        fi

    done
    sleep 2
done
EOF

		sleep 3
		;;
	2)	chmod +x "$BASE/consolidar.sh"
		"$BASE/consolidar.sh" &
		echo Corriendo proceso...
		sleep 3
		;;
	3)	if [ -f $SALIDA/$FILENAME.txt ]; then
        	sort -t " " -k 1 -n $SALIDA/$FILENAME.txt
		fi
		sleep 3
		;;
	4)	if [ -f $SALIDA/$FILENAME.txt ]; then
		    sort -t " " -k 5 -n -r $SALIDA/$FILENAME.txt | head
		fi
		sleep 3
		;;
	5)	read padron
		datos=$(grep "$padron" $SALIDA/$FILENAME.txt)
		if [ -z "$datos" ]; then
  		echo "No se encontraron datos para ese padrón"
		else
 		echo $datos
		fi
		;;
	6)	echo Estas saliendo del programa.
		pkill -f consolidar.sh
		sleep 3
		;;
	*)	echo $opc no es una opcion valida
		sleep 3
		;;

esac

done

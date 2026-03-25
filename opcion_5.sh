#!/bin/bash

echo "Ingrese un numero de padrón: "
read padron

datos=$(grep "$padron" salida/FILENAME.txt)

#cubro caso borde (no se encontró el padrón)
if [ -z "$datos" ]; then
  echo "No se encontraron datos para ese padrón"
else
 echo "$datos"
fi
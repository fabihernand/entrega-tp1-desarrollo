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
    
done

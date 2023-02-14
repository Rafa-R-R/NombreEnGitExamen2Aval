#!/bin/bash

declare -a datos;
readarray -t datos < consumo.txt
numDatos=${#datos[@]};
ciudad=$1;

apariciones=0;
consumo_total=0;
media=0;


for ((i=1; i<$numDatos; i++))
do

        dato_actual=${datos[i]};
        ciudad_actual=$(echo $dato_actual|awk '{print $1}');
        if [ $ciudad_actual == $ciudad ]
        then
            apariciones=$((apariciones + 1));
            consumo_actual=$(echo $dato_actual|awk '{print $4}');
            consumo_total=$((consumo_total + consumo_actual));
        fi

done

    media=$((consumo_total / apariciones ));

    echo $media;
fi

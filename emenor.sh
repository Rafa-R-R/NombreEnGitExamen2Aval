#!/bin/bash

declare -a datos;
readarray -t datos < consumo.txt
numDatos=${#datos[@]};

dato_primero=${datos[1]};
ciudad_primera=$(echo $dato_actual|awk '{print $1}');

ciudad_menor=$ciudad_primera;
media_menor=`sh ./cmedia.sh $ciudad_primera`;


for ((i=1; i<$numDatos; i++))
do
        dato_actual=${datos[i]};
        ciudad_actual=$(echo $dato_actual|awk '{print $1}');
        media=`sh ./cmedia.sh $ciudad_actual`;

        if [ $media -lt $media_menor ]
        then
            media_menor=$media;
            ciudad_menor= $ciudad_actual;
        fi

done
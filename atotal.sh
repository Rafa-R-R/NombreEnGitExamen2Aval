#!/bin/bash

declare -a datos;
readarray -t datos < consumo.txt
numDatos=${#datos[@]};
ciudad='';
atotal=0;
encontrado=0;


#Busco que esté la ciudad

while [ $encontrado -ne 1 ]
do
    read -p 'Introduce la ciudad a comprobar: ' ciudad;

    encontrado=0;

    for ((i=1; i<$numDatos; i++))
    do
        dato_actual=${datos[i]};
        ciudad_actual=$(echo $dato_actual|awk '{print $1}')

        if [ $ciudad_actual == $ciudad ]
        then

            encontrado=1;

        fi

    done

done

# Cuando se encuentra continúa con el cálculo

for ((i=1; i<$numDatos; i++))
do

        dato_actual=${datos[i]};
        ciudad_actual=$(echo $dato_actual|awk '{print $1}');
        if [ $ciudad_actual == $ciudad ]
        then
            consumo_actual=$(echo $dato_actual|awk '{print $4}');
            atotal=$((atotal + consumo_actual));
        fi

done


echo $atotal;
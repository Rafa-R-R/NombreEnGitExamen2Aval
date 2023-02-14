#!/bin/bash

declare -a datos;
readarray -t datos < consumo.txt
numDatos=${#datos[@]};

#El 0 es la cabecera
primera_ciudad=${datos[1]};
primer_consumo=$(echo $primera_ciudad|awk '{print $4}');

ciu_max='';
ciu_min='';
max=$((primer_consumo));
min=$((primer_consumo));

for ((i=1; i<$numDatos; i++))
do

        dato_actual=${datos[i]};
        consumo_actual=$(echo $dato_actual|awk '{print $4}');

        if [ $consumo_actual -gt $max ]
        then
            ciu_max=${datos[i]};
            max=$consumo_actual;
        fi

        if [ $consumo_actual -lt $min ]
        then
            ciu_min=${datos[i]};
            min=$consumo_actual;
        fi

done

cab=${datos[0]};
cabecera=$(echo $cab |awk 'BEGIN { OFS="\t" } {print $1 "\t" $2 "\t" $3}');
ciu_max=$(echo $ciu_max |awk 'BEGIN { OFS="\t" } {print $1 "\t" $2 "\t" $3}');
ciu_min=$(echo $ciu_min |awk 'BEGIN { OFS="\t" } {print $1 "\t" $2 "\t" $3}');
echo "Mayor consumo: ";
echo $cabecera;
echo $ciu_max;
echo "-------------"
echo "Menor consumo: ";
echo $cabecera
echo $ciu_min;
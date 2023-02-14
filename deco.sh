#!/bin/bash

ciudad=$1;
media=`sh ./cmedia.sh $ciudad`;
eco="";

if [ $media -lt 400 ]
then 
    eco="ECO";
fi

if [ $media -ge 400 ]
then 
    eco="NO ECO";
fi

echo $eco;

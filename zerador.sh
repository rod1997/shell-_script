#!/bin/bash
#esse programa faz contagem regresiva apartir do numero passado por parametro
v=$1      
while [ $v -gt 0 ]
do
   echo $v
   sleep 0
   v=$(( $v-1 ))
done

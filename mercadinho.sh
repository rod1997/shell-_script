#!/bin/bash

#controle de caixa 

venda(){
    echo "nome:"
    read $codigo
    echo "quantidade:"
    read $quantidade

    echo "confirmar venda?[s/n]"
    read $confirma
}
consulta(){
    echo "produto:"
    read produto
    resultado=`cat produtos.txt | grep $produto`
    echo nome:`echo $resultado | sed "s/[0-9]//g"`
    echo valor:`echo $resultado | sed "s/[a-z]//g"`
}
cadastrar(){
   echo "nome:"
   read nome
   echo "valor:"
   read valor
   echo "$nome $valor" >> produtos.txt
}

echo "-----------------------------------------------------------"
echo "=                                                         ="
echo "=                     CONTROLE DE CAIXA                   ="
echo "=                                                         ="
echo "-----------------------------------------------------------"

echo "digite [1] para venda, [2] para cadastrar produto e [3] consulta valor produto:"
read  acao

case $acao in

1) venda ;;

2) cadastrar;;

3) consulta ;;

*) echo "opçao invalida";;
esac








#!/bin/bash

#controle de caixa 

venda(){
    echo "nome:"
    read nome
    echo "quantidade:"
    read quantidade

    extrai_val=`cat produtos.txt | grep $nome | sed "s/[a-z]//g" `
    resultado=`echo "scale=2;($extrai_val*$quantidade)" | bc`

    if [ $resultado -lt 1 ]
    then
       resultado=`echo 0$resultado`
    fi
    echo "produto:$nome  quant:$quantidade valor total:$resultado"
    echo "confirmar venda?[s/n]"
    read confirma
    if [ $confirma=='s' ]
    then
       data=`date`
       echo "$nome - x$quantidade - RS$resultado - $data" >> vendas.txt
       echo "venda efetuada!"
       echo ""
       echo "================================================================================================================"
       echo ""
    fi
}
consulta(){
    echo "[1]para todos ou [2] pra especificar"
    read resposta
    if [ $resposta -gt 1 ]
    then
        echo "produto:"
        read produto
        resultado=`cat produtos.txt | grep $produto`
        echo nome:`echo $resultado | sed "s/[0-9]//g"`
        echo valor:`echo $resultado | sed "s/[a-z]//g"`
    else
        echo `cat produtos.txt` 
    fi
     echo ""
     echo "====================================================================================================================="
     echo ""

}
cadastrar(){
   echo "nome:"
   read nome
   echo "valor:"
   read valor
   echo "$nome $valor" >> produtos.txt
   echo ""
   echo "========================================================================================================================="
   echo ""

}

echo "-----------------------------------------------------------"
echo "=                                                         ="
echo "=                     CONTROLE DE CAIXA                   ="
echo "=                                                         ="
echo "-----------------------------------------------------------"
while [ 1 ]
do 
     echo "[1] venda, [2] cadastrar [3] consulta [4]sair"
     read  acao
     case $acao in

     1) venda ;;

     2) cadastrar;;

     3) consulta ;;

     4) break ;;

     *) echo "opçao incorreta!"
     esac
done






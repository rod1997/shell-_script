#!/bin/bash

#controle de caixa
pulalinha(){
   echo ""
}
sair(){
   read -n1 -p "pressione algo para sair"
   clear
}
venda(){
    read -p "nome:" nome
    read -p "quantidade" quantidade

    extrai_val=`cat produtos.txt | grep $nome | sed "s/[a-z]//g" `
    resultado=`echo "scale=2;($extrai_val*$quantidade)" | bc`

    echo "produto:$nome  quant:$quantidade valor total:$resultado"
    pulalinha
    read -n1 -p  "confirmar venda?[s/n]" confirma
    if [ $confirma=='s' ]
    then
       data=`date`
       echo "$nome - x$quantidade - RS$resultado - $data" >> vendas.txt
       pulalinha
       echo "venda efetuada!"
       pulalinha
       sair
    fi
}
consulta(){
    echo "[1]todos produtos [2] produto especifico [3] vendas "
    read resposta
    if [ $resposta -eq 2 ]
    then
        echo "produto:"
        read produto
        resultado=`cat produtos.txt | grep $produto`
        echo nome:`echo $resultado | sed "s/[0-9]//g"`
        echo valor:`echo $resultado | sed "s/[a-z]//g"`
    elif [ $resposta -eq 1 ]
    then
        echo `cat produtos.txt`
    elif [ $resposta -eq 3 ]
    then
        echo `cat vendas.txt`
    fi
    pulalinha
    sair
}
cadastrar(){
   echo "nome:"
   read nome
   echo "valor:"
   read valor
   echo "$nome $valor" >> produtos.txt
   pulalinha
   echo "produto $nome cadastrado com sucesso!"
   pulalinha
   sair
}
slogan(){
    echo "-----------------------------------------------------------"
    echo "=                                                         ="
    echo "=                     CONTROLE DE CAIXA                   ="
    echo "=                                                         ="
    echo "-----------------------------------------------------------"
}
while [ 1 ]
do   slogan
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






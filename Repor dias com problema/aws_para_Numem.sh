#!/bin/bash


###########################################################################
#                        Script para repor dias perdidos                  #
###########################################################################
#  Metodo: Diario                                                         #
#  Descricao: Copia por meio de rclone da aws para a nuvem level2         #
#  Autor: Guilherme de Moura Oliveira  <guimoura@unicamp.br>              #
#  Data: 09/07/2023                                                       #
#  Atualizacao: 20/07/2023                                                #
###########################################################################

# AWS -> Nuvem

ARQ_LOG="copiando-AWS-Nvm`date +%Y-%m-%d`.log"
DIR_LOG=/home/guimoura/logs/rclone/

# Obtendo o ano
ano=2023

# Loop para copiar os dias julianos de 001 a 005
for ((dia=52; dia<=55; dia++))
do
    # Formata o número do dia juliano com três dígitos
    dia_juliano=$(printf "%03d" $dia)

    # Diretório de origem
    origem="aws:/noaa-goes16/ABI-L1b-RadF/$ano/$dia_juliano"

    # Diretório de destino
    destino="level1b_2:/ano$ano/dia$dia_juliano/"

    # Executa o comando rclone copy
    rclone copy "$origem" "$destino" --transfers=100 --log-file="$DIR_LOG$ARQ_LOG" -v
done

#!/bin/bash


###########################################################################
#                        Script para repor dias perdidos                  #
###########################################################################
#  Metodo: Diario                                                         #
#  Descricao: Copia por meio de rclone da nuvem para a storage ex: l2     #
#  Autor: Guilherme de Moura Oliveira  <guimoura@unicamp.br>              #
#  Data: 09/07/2023                                                       #
#  Atualizacao: 09/07/2023                                                #
###########################################################################

# Nuvem -> storage

ARQ_LOG="copiandoNuvem-storage`date +%Y-%m-%d`.log"
DIR_LOG=/Scripts/level2/logs/

# Obtendo o ano
ano=2023

# Loop para copiar os dias julianos de 001 a 005
for ((dia=48; dia<=53; dia++))
do
    # Formata o número do dia juliano com três dígitos
    dia_juliano=$(printf "%03d" $dia)

    # Diretório de origem
    origem="goes16-level2_4:/ano$ano/dia$dia_juliano"
    
    # Diretório de destino
    destino="/mnt/storage/level2/ano$ano/dia$dia_juliano/"
    
    # Executa o comando rclone copy
    rclone copy "$origem" "$destino" --transfers=100 --log-file="$DIR_LOG$ARQ_LOG" -v
done


#!/bin/bash

###########################################################################
#        Script para copiar arquivos Flash para nuvem                     #
###########################################################################
#  Metodo: Diario                                                         #
#  Descricao: Script para copiar apenas o dia anterior para uma pasta em  #
#  nuvem GOES-16                                                          #
#  Autor: Guilherme de Moura Oliveira  <guimoura@unicamp.br>              #
#  Data: 9/05/2023                                                        #
#  Atualizacao: 10/05/2023                                                #
###########################################################################

# Configurando log
ARQ_LOG="bkp_flash-nuvem`date +%Y-%m-%d`.log"
DIR_LOG=/Scripts/flash/logs/

#Obtendo o ano, mes e dia anterior em dia em 2 digitos
ano=$(date +%Y -d "-1 day")
dia_anterior=$(date -d "yesterday" +%d)
mes=$(date +%m)

#Diretório de origem
origem="okul:/ess/data/processed/"

# Diretório de destino
destino="goes16-flash:/ano$ano/mes$mes/dia$dia_anterior/"

#Inicia o script
echo "=========================================================================================================" &>> $DIR_LOG/$ARQ_LOG
echo "=========================================================================================================" &>> $DIR_LOG/$ARQ_LOG
echo "=                           INICIANDO SCRIPT BACKUP PARA O DRIVE $(date '+%Y-%m-%d %H:%M:%S')           =" &>> $DIR_LOG/$ARQ_LOG
echo "=========================================================================================================" &>> $DIR_LOG/$ARQ_LOG
echo "=========================================================================================================" &>> $DIR_LOG/$ARQ_LOG
echo "" &>> $DIR_LOG/$ARQ_LOG
echo "" &>> $DIR_LOG/$ARQ_LOG

rclone copy $origem --include "*$ano$mes$dia_anterior*.GLM--FLASH.txt" $destino --transfers=50 --log-file=$DIR_LOG$ARQ_LOG -v ;


echo "=========================================================================================================" >> "$DIR_LOG/$ARQ_LOG"
echo "=========================================================================================================" >> "$DIR_LOG/$ARQ_LOG"
echo "=                                 FINALIZANDO O SCRIPT $(date '+%Y-%m-%d %H:%M:%S')                     =" >> "$DIR_LOG/$ARQ_LOG"
echo "=========================================================================================================" >> "$DIR_LOG/$ARQ_LOG"
echo "=========================================================================================================" >> "$DIR_LOG/$ARQ_LOG"
echo "" &>> $DIR_LOG/$ARQ_LOG
echo "" &>> $DIR_LOG/$ARQ_LOG



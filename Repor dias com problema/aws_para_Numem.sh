#!/bin/bash

###########################################################################
#        Script para copiar arquivos para uma pasta em nuvem GOES-16      #
###########################################################################
#  Metodo: Diario                                                         #
#  Descricao: Script para copiar apenas o dia anterior para uma pasta em  #
#  nuvem GOES-16                                                          #
#  Autor: Guilherme de Moura Oliveira  <guimoura@unicamp.br>              #
#  Data: 9/05/2023                                                        #
#  Atualizacao: 18/05/2023                                                #
###########################################################################

ARQ_LOG="bkp_level2-nuvem`date +%Y-%m-%d`.log"

DIR_LOG=C:/Users/Gui/OneDrive/Documentos/copiar/logs/

#Obtendo o ano e dia anterior em dia juliano
ano=$(date +%Y -d "-1 day")

dia=131

# Diretório de origem
origem="aws:/noaa-goes16/ABI-L1b-RadF/2023/$dia"

# Diretório de destino
destino="level1b_2:/ano$ano/dia$dia/"

#Inicia o script
echo "=========================================================================================================" &>> $DIR_LOG/$ARQ_LOG
echo "=========================================================================================================" &>> $DIR_LOG/$ARQ_LOG
echo "                            INICIANDO SCRIPT BACKUP PARA O DRIVE $(date '+%Y-%m-%d %H:%M:%S')            " &>> $DIR_LOG/$ARQ_LOG
echo "=========================================================================================================" &>> $DIR_LOG/$ARQ_LOG
echo "=========================================================================================================" &>> $DIR_LOG/$ARQ_LOG
echo "" &>> $DIR_LOG/$ARQ_LOG
echo "" &>> $DIR_LOG/$ARQ_LOG


# Move o arquivo para o diretório de destino
echo "Rclone size Ano: $ano Dia: $dia" >> $DIR_LOG$ARQ_LOG
rclone size $origem --log-file=$DIR_LOG$ARQ_LOG -v >> $DIR_LOG$ARQ_LOG
rclone copy $origem $destino --transfers=100 --log-level INFO --log-file=$DIR_LOG$ARQ_LOG
# rclone copy $origem $destino --transfers=100 --dry-run --log-level INFO --log-file=$DIR_LOG$ARQ_LOG

echo "=========================================================================================================" >> "$DIR_LOG/$ARQ_LOG"
echo "=========================================================================================================" >> "$DIR_LOG/$ARQ_LOG"
echo "=                                 FINALIZANDO O SCRIPT $(date '+%Y-%m-%d %H:%M:%S')                     =" >> "$DIR_LOG/$ARQ_LOG"
echo "=========================================================================================================" >> "$DIR_LOG/$ARQ_LOG"
echo "=========================================================================================================" >> "$DIR_LOG/$ARQ_LOG"
echo "" &>> $DIR_LOG/$ARQ_LOG
echo "" &>> $DIR_LOG/$ARQ_LOG

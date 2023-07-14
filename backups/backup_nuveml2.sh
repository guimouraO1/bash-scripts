#!/bin/bash

###########################################################################
#        Script para copiar arquivos para uma pasta em nuvem GOES-16      #
###########################################################################
#  Metodo: Diario                                                         #
#  Descricao: Script para copiar apenas o dia anterior para uma pasta em  #
#  nuvem GOES-16                                                          #
#  Autor: Guilherme de Moura Oliveira  <guimoura@unicamp.br>              #
#  Data: 9/05/2023                                                        #
#  Atualizacao: 22/06/2023                                                #
###########################################################################

# Configurando log
ARQ_LOG="bkp_level2-nuvem`date +%Y-%m-%d`.log"
DIR_LOG=/Scripts/level2/logs/

#Obtendo o ano e dia anterior em dia juliano
ano=$(date +%Y -d "-1 day")
dia_anterior=$(date +%j -d "-1 day")

# Diretório de origem
origem="okul:/ess/data/satellite/goes/grb/level2/"

# Diretório de destino
destino="goes16-level2_5:/ano$ano/dia$dia_anterior/"

#Inicia o script
echo "=========================================================================================================" &>> $DIR_LOG/$ARQ_LOG
echo "=========================================================================================================" &>> $DIR_LOG/$ARQ_LOG
echo "=                                 INICIANDO SCRIPT BACKUP PARA O DRIVE LEVEL2                           =" &>> $DIR_LOG/$ARQ_LOG
echo "=========================================================================================================" &>> $DIR_LOG/$ARQ_LOG
echo "=========================================================================================================" &>> $DIR_LOG/$ARQ_LOG
echo "" &>> $DIR_LOG/$ARQ_LOG
echo "" &>> $DIR_LOG/$ARQ_LOG

# Padrão a ser buscado
padrao="*CMIPF*e$ano$dia_anterior*"

# Move o arquivo para o diretório de destino
rclone copy $origem --include "$padrao" $destino --transfers=100 --log-file=$DIR_LOG$ARQ_LOG -v

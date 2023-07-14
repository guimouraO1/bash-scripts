#!/bin/bash

###########################################################################
#                 Script para verificar tamanho l1 e l2                   #
###########################################################################
#  Metodo: anual                                                          #
#  Descricao: verificar tamanho em GB das pastas l1b e l2 nuvem/storage   #
#  Autor: Guilherme de Moura Oliveira  <guimoura@unicamp.br>              #
#  Data: 07/06/2023                                                       #
#  Atualizacao: 07/0/2023                                                #
###########################################################################

# configurando log
log_file="/Scripts/level2/logs/tamanho_l2bNuvem.log"

# nuvem
# origem="goes16-level2_5:/ano2023"

# storage
origem="/mnt/storage/level2/ano2023/"

# Modificar apenas dias
for ((day=1; day<=180; day++)); do
  julian_day=$(printf "%03d" $day)
  echo -e "\n" >> "$log_file"
  echo "------------------------------------------" >> "$log_file"
  echo "------------DIA${julian_day}--------------" >> "$log_file"
  echo "------------------------------------------" >> "$log_file"
  echo "rclone size $origem/dia${julian_day}" >> "$log_file"
  rclone size "$origem/dia${julian_day}" >> "$log_file"
done

# Taamanho total da pasta - usar apenas quando pasta cheia
# echo -e "\n" >> "$log_file"
# echo "------------------------------------------" >> "$log_file"
# echo "------   ---TAMANHO ${origem} ---         " >> "$log_file"
# echo "------------------------------------------" >> "$log_file"
# rclone size "$origem" >> "$log_file"

#!/bin/bash

###########################################################################
#                        Script para repor dias perdidos                  #
###########################################################################
#  Metodo: Diario                                                         #
#  Descricao: Copia por meio de rclone da aws para a nuvem level2         #
#  Autor: Guilherme de Moura Oliveira  <guimoura@unicamp.br>              #
#  Data: 09/07/2023                                                       #
#  Atualizacao: 09/07/2023                                                #
###########################################################################

# AWS -> Nuvem

# Definir variáveis
src="aws:/noaa-goes16/ABI-L2-CMIPF/2023/"
dest="level2_5:/ano2023/"
log_dir="/home/guimoura/logs/rclone/"

# Loop para cada dia
for ((day=126; day<=127; day++))
do
  # Definir o caminho do dia atual
  
  # Formata o número do dia para juliano com três dígitos
  dia_juliano=$(printf "%03d" $dia)
  current_dest="${dest}dia${dia_juliano}/"

  # Executar o comando rclone
  rclone copy "$src$current_day/" "$current_dest" --include "*.*" --log-level INFO --log-file "${log_dir}dia${current_day}.txt"

# Exibir mensagem de conclusão
echo "Cópia do dia ${current_day} concluída."
done
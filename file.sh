#!/bin/bash
shopt -s globstar

PASTA_PRINCIPAL_DRIVE= ''

figlet -c  'INICIANDO BACKUP'

DATA_HOJE=$(date '+%d-%m-%Y');

echo -e  "Criando pasta no Google Drive";

pastaDrive=$(sudo drive folder  --title  $DATA_HOJE  --parent  $PASTA_PRINCIPAL_DRIVE)

arrIN=(${pastaDrive//:/ })

pastaUpload=${arrIN[1]} 

echo -e  "Pasta  $pastaUpload criada \n";

DIRETORIOS=(**/)

for diretorio in "${DIRETORIOS[@]}"; do
    if [ -d  ${diretorio} ]; then
        echo -e "zipando ${diretorio}\n"
        if [ -f "${diretorio}.zip" ]; then
            echo -e "${diretorio}.zip already exists, skipping"
        else
            sudo  zip -r "${diretorio}.zip" ${diretorio}
            echo -e "enviando ${diretorio}.zip para Google drive\n";
            sudo  drive upload  --file  "${diretorio}.zip" --parent  $pastaUpload
            echo -e "removendo ${diretorio}.zip\n"
            sudo rm  -r  "${diretorio}.zip"
        fi
    else 
        echo "Not found ${diretorio}\n"; 
    fi
done;

figlet -c  'FIM'

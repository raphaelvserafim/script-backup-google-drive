#!/bin/bash

PASTA_PRINCIPAL_DRIVE=''

figlet -c  'INICIANDO BACKUP'


DATA_HOJE=$(date '+%d-%m-%Y');

echo -e  "Criando pasta no Google Drive";

pastaDrive=$(sudo drive folder  --title  $DATA_HOJE  --parent  $PASTA_PRINCIPAL_DRIVE)
 
arrIN=(${pastaDrive//:/ })
pastaUpload=${arrIN[1]} 


echo -e  "Pasta  $pastaUpload criada \n";


MEU_ARRAY=(ls *)


for I in ${MEU_ARRAY[*]}; do
    
    if [ -d  ${I} ]; then 
    
      echo -e "zipando ${I}\n"
      sudo  zip -r "${I}.zip" ${I}
    
       echo -e "enviando ${I}.zip para Google drive\n";
       sudo  drive upload  --file  "${I}.zip" --parent  $pastaUpload

         echo -e "removendo ${I}.zip\n"
         sudo rm  -r  "${I}.zip"
 
 
 else echo "Not found ${I}\n"; fi
     
 done ; 

 
figlet -c  'FIM'



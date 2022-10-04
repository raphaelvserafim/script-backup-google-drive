#!/bin/bash

USER_DB=''
SENHA_DB=''
PASTA_PRINCIPAL_DRIVE=''

figlet -c  'BACKUP MYSQL'

 
DATA_HOJE=$(date '+%d-%m-%Y');

echo -e "Criando pasta no Google Drive";

pastaDrive=$(sudo drive folder  --title  $DATA_HOJE  --parent  $PASTA_PRINCIPAL_DRIVE)
 
arrIN=(${pastaDrive//:/ })

pastaUpload=${arrIN[1]} 

echo -e  "Pasta  $pastaUpload criada \n";
 
mysql=`mysql --user=$USER_DB --password=$SENHA_DB -se "show databases;"`

for x in $mysql;
do
  echo -e  "Exportando $x\n";
  export=`mysqldump  --user=$USER_DB --password=$SENHA_DB  $x --no-tablespaces  > ${x}.sql`
     echo -e  "Enviando  $x para Google Drive\n";
      sudo drive upload  --file  "${x}.sql" --parent  $pastaUpload
      echo -e  "Removenfo $x";
      rm -r "${x}.sql"
done ; 

figlet -c  'FIM'

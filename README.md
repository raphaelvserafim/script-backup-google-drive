# SCRIPT PARA FAZER BACKUP & UPLOAD PARA GOOGLE DRIVE


 
```
sudo wget -O drive https://github.com/raphaelvserafim/script-backup-google-drive/blob/main/drive?raw=true 
``` 

```
sudo mv drive /usr/sbin/drive
``` 

```
chmod 755 /usr/sbin/drive
``` 

```
drive 
``` 
##### Copiar o link e colar no navegador, lembre-se de estar logado com a conta que deseja vincular ao Google Drive.


#### Agora faça download dos arquivos,  ```sql.sh```  e  ```file.sh```  na pasta raiz que vai fazer o backup 
## IMPORTANTE  
### *Informar*  USER_DB, SENHA_DB e PASTA_PRINCIPAL_DRIVE *no arquivo* sql.sh 
#### O ID da pasta do Google Drive voce pode pegar na URL  ```https://drive.google.com/drive/folders/<ID DA PASTA>```


### Para iniciar executar
```
bash sql.sh 
```


```
bash file.sh 
```

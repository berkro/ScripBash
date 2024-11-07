# AWSCLI
Primer hem de tenir awscli instal·lat.

Una vegada instal·lat, he fet un script per afegir les credencials al arxiu .aws/credentials.
```
#!/bin/bash
sessionToken=$1
echo "$sessionToken" > /home/belko/.aws/credentials
```
## Grups de seguretat
### Crear i configurar grups
Utilitzaré un script per crear i configurar els grups de seguretat. El nom i la descripció són els parametres obligatoris d'aquesta comanda.
```
#!/bin/bash
NOMGRUP="HTgrup"
DATE=$(date)

#Crear grup
aws ec2 create-security-group --group-name "$NOMGRUP" --description "$NOMGRUP"

#Configurar grup, permetre regla d'entrada RDP
aws ec2 authorize-security-group-ingress --group-name $NOMGRUP --protocol tcp --port 3389 --cidr 0.0.0.0/0
```

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
Utilitzaré un script per crear i configurar els grups de seguretat. El nom i la descripció són els parametres obligatoris d'aquesta comanda. Una vegada finalitzat l'script, retorna l'ID del grup.
```
#!/bin/bash

NOMGRUP="HTgrup"

# Crear grup
aws ec2 create-security-group --group-name "$NOMGRUP" --description "$NOMGRUP" > /dev/null

# Afegir regles al grup
aws ec2 authorize-security-group-ingress --group-name $NOMGRUP --ip-permissions IpProtocol=tcp,FromPort=3389,ToPort=3389,IpRanges="[{CidrIp=0.0.0.0/0}]" \
                                                                                IpProtocol=tcp,FromPort=22,ToPort=22,IpRanges="[{CidrIp=0.0.0.0/0}]" > /dev/null

# Obtenir grup ID
GRUPID=$(aws ec2 describe-security-groups --group-name $NOMGRUP --query "SecurityGroups[0].GroupId" --output text)
echo "$GRUPID"

```

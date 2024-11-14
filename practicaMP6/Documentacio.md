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
Aquest grup permet les regles d'entrada seguents:
RDP
SSH
DNS
HTTP / HTTPS
```
#!/bin/bash

NOMGRUP="HTgrup"

# Crear grup
aws ec2 create-security-group --group-name "$NOMGRUP" --description "$NOMGRUP" > /dev/null

# Afegir regles al grup
aws ec2 authorize-security-group-ingress --group-name $NOMGRUP --ip-permissions IpProtocol=tcp,FromPort=3389,ToPort=3389,IpRanges="[{CidrIp=0.0.0.0/0}]" \
                                                                                IpProtocol=tcp,FromPort=22,ToPort=22,IpRanges="[{CidrIp=0.0.0.0/0}]"  
                                                                                IpProtocol=tcp,FromPort=53,ToPort=53,IpRanges="[{CidrIp=0.0.0.0/0}]"
                                                                                IpProtocol=tcp,FromPort=80,ToPort=80,IpRanges="[{CidrIp=0.0.0.0/0}]"
                                                                                IpProtocol=tcp,FromPort=443,ToPort=443,IpRanges="[{CidrIp=0.0.0.0/0}]" > /dev/null
# Obtenir grup ID
GRUPID=$(aws ec2 describe-security-groups --group-name $NOMGRUP --query "SecurityGroups[0].GroupId" --output text)
echo "$GRUPID"

```
## Linux i Windows Servers
Per crear les instancies de windows server i linux server, utilitzaré un script que executi l'script de crear grups i seguidament crear les instancia amb el grup creat.
```
#!/bin/bash

GRUPID= ./crearGrup.sh

# Crear Windows Server
aws ec2 run-instances --count "1" --image-id "ami-05f283f34603d6aed" --instance-type "t2.micro" --security-groups $GRUPID \
		      --tag-specifications '{"ResourceType":"instance","Tags":[{"Key":"Name","Value":"Windows Server 2022"}]}' > /dev/null

# Crear Linux Server
aws ec2 run-instances --count "1" --image-id "ami-064519b8c76274859" --instance-type "t2.micro" --security-groups $GRUPID \
		      --tag-specifications '{"ResourceType":"instance","Tags":[{"Key":"Name","Value":"Linux Server"}]}' > /dev/null
```
## Clients Linux
Un script que el parametre és el nombre de clients a crear. Comprova si s'ha especificat el parametre i que no sigui major que 10.
```
#!/bin/bash

NCLIENTS=$1

if [ $# -ne 1 ]; then
        echo "S'ha de especificar el nombre de clients a crear (10 max)"
        exit 1
fi

if [ "$NCLIENTS" -gt 10 ]; then
        echo "Com a maxim hi poden haver 10 clients"
        exit 1
fi

GRUPID= ./crearGrup.sh

aws ec2 run-instances --count "$NCLIENTS" --image-id "ami-064519b8c76274859" --instance-type "t2.micro" --security-groups $GRUPID \
                      --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=Linux Client}]" > /dev/null
```

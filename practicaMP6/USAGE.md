# 1. AWS Credentials
Primer s'ha d'executar l'script **sessionTokem.sh**, de paràmetre li hem de possar les credencials de AWS CLI entre cometes dobles.
```
./sessionTokem.sh "Credencials AWS"
```
# 2. Crear Servers
Seguidament executem l'script **crearServers.sh**, no necesita cap paràmetr
```
./crearServers.sh
```
# 3. Configurar SSH Windows Server
Entrem per RDP a la màquina Windows Server 2022.

Una vegada dintre del datacenter, introduïm 15 per anar al PowerShell.
## Instal·lar OpenSSH
### Client
```
Add-WindowsCapability -Online -Name OpenSSH.Client
```
### Servidor
```
Add-WindowsCapability -Online -Name OpenSSH.Server
```

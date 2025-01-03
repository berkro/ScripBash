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
### Arrancar servei i arrancada automatica
```
Start-Service sshd
Set-Service -Name sshd -StartupType 'Automatic'
```
### Confirmar regla del firewall
```
if (!(Get-NetFirewallRule -Name "OpenSSH-Server-In-TCP" -ErrorAction SilentlyContinue | Select-Object Name, Enabled)) {
    Write-Output "Firewall Rule 'OpenSSH-Server-In-TCP' does not exist, creating it..."
    New-NetFirewallRule -Name 'OpenSSH-Server-In-TCP' -DisplayName 'OpenSSH Server (sshd)' -Enabled True -Direction Inbound -Protocol TCP -Action Allow -LocalPort 22
} else {
    Write-Output "Firewall rule 'OpenSSH-Server-In-TCP' has been created and exists."
       }
```
## Crear claus ssh
En la màquina on executem els scripts, crear clau ssh.
```
ssh-keygen -t rsa
```
## Afegir claus al server
En el Windows Server 2022, crear carpeta **.ssh**.
```
mkdir .ssh
```
Desde la maquina on tenim les claus, copiem la clau pública **.pub** al server amb scp, a dintre la carpeta .ssh al fitxer **authorized_keys**
```
scp /ruta/clau.pub Administrator@IPpublicaServer:C:/Users/Administrator/.ssh/authorized_keys
```
Copiar la clau pública al arxiu **administrators_authorized_keys**.
```
scp /ruta/clau.pub Administrator@IPpublicaServer:/C:/ProgramData/ssh/administrators_authorized_keys
```
Agent ssh.
```
eval `ssh-agent -s`
```
Carregar la clau privada, sense .pub, al agent.
```
 ssh-add /ruta/clau
```
## Crear Active Directory
Executar l'script **dominiADDS.sh** per instal·lar Active directory.
```
./dominiADDS.sh "IP" "Nom.Domini"
```

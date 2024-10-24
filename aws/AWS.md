# Connectar per SSH a instancia de AWS.
Primer ens hem de connectar per RDP per instal·lar i configurar SSH.
## Connectar per RDP a instancia de AWS.
Seleccionem o entrem a la instancia, cliquem **Connect**, anem a la secció de **RDP cient**. A la part de sota cliquem **Get password**, seguidament **Upload private key file** i afegim la clau privada que vam seleccionar per la instancia. **Decrypt Password**
```
?eJu=!9QND*p(%-caNeeUo(lzBDMiKP9
```

Al programa de RDP de windows posem la IP publica o el DNS públic del server. Quan ens demani les credencials introduim l'username i password.
Primer s'obrirà el **Server Configuration Tool**, introduim 15 per anar al PowerShell.

Amb la següent comanda comprobem si OpenSSH està disponible
```
Get-WindowsCapability -Online | Where-Object Name -like 'OpenSSH*'
```
## Instal·lar client OpenSSH
```
Add-WindowsCapability -Online -Name OpenSSH.Client
```
## Instal·lar servidor OpenSSH
```
Add-WindowsCapability -Online -Name OpenSSH.Server
```

Les comandes han de retornar

![image](https://github.com/user-attachments/assets/e0509e25-19fd-4dcc-94d9-f2e72f20198a)

## Engegar servei, i engegar automaticament
```
Start-Service sshd
Set-Service -Name sshd -StartupType 'Automatic'
```
## Confirmem que la regla del firewall està configurada, s'hauria de crear automàticament
```
if (!(Get-NetFirewallRule -Name "OpenSSH-Server-In-TCP" -ErrorAction SilentlyContinue | Select-Object Name, Enabled)) {
    Write-Output "Firewall Rule 'OpenSSH-Server-In-TCP' does not exist, creating it..."
    New-NetFirewallRule -Name 'OpenSSH-Server-In-TCP' -DisplayName 'OpenSSH Server (sshd)' -Enabled True -Direction Inbound -Protocol TCP -Action Allow -LocalPort 22
} else {
    Write-Output "Firewall rule 'OpenSSH-Server-In-TCP' has been created and exists."
       }
```
## Crear claus per SSH
Ara hem de crear les claus per poder accedir des del client al servidor a traves de SSH sense la contrasenya.

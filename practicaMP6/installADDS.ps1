Install-WindowsFeature AD-Domain-Services -IncludeManagementTools

Import-Module ADDSDeployment

Install-ADDSForest -DomainName "hackaton.cat" -InstallDNS

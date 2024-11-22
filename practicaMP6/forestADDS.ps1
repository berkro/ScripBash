Install-WindowsFeature AD-Domain-Services -IncludeManagementTools

Import-Module ADDSDeployment

Install-ADDSForest -DomainName "belko.aso" -InstallDNS

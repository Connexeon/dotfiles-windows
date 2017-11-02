# Configure Connexeon RDM datasource (Zerotier)

Import-Module "${env:ProgramFiles(x86)}\Devolutions\Remote Desktop Manager\RemoteDesktopManager.PowerShellModule.dll"
$s = New-RDMDataSource -SQLServer -Database ConnexeonRDM -IntegratedSecurity -Server 10.244.0.15 -Name Connexeon -SetDatasource
Set-RDMDatasource $s


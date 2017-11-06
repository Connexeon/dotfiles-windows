# Configure Connexeon RDM datasource (Zerotier)
#  Use like this from IE or Edge (or with OneClick plugin in Chrome/Firefox) 
#  http://boxstarter.org/package/nr/url?https://raw.githubusercontent.com/Connexeon/dotfiles-windows/master/rdm-ds-connexeon.ps1

Import-Module "${env:ProgramFiles(x86)}\Devolutions\Remote Desktop Manager\RemoteDesktopManager.PowerShellModule.dll"

# Remove existing datasources
$datasources = Get-RDMDataSource; 
foreach ($datasource in $datasources)
{
  Remove-RDMDataSource -DataSource $datasource
}

# Add new datasource
$s = New-RDMDataSource -SQLServer -Database ConnexeonRDM -IntegratedSecurity -Server 10.244.0.15 -Name Connexeon -SetDatasource
Set-RDMDatasource $s


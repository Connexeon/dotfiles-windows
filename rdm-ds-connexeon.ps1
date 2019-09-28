# Configure Connexeon RDM datasource (on ZeroTier)
#  Use like this from IE or Edge (or with OneClick plugin in Chrome/Firefox) 
#  http://boxstarter.org/package/nr/url?https://connexeon.link/configure-rdm-datasource

Import-Module "${env:ProgramFiles(x86)}\Devolutions\Remote Desktop Manager\RemoteDesktopManager.PowerShellModule.dll"

# Remove existing datasources
$datasources = Get-RDMDataSource; 
foreach ($datasource in $datasources)
{
  Remove-RDMDataSource -DataSource $datasource
}

# Add new datasource
$s = New-RDMDataSource -SQLServer -Database ConnexeonRDM -IntegratedSecurity -Server 10.0.30.15 -Name Connexeon -SetDatasource
Set-RDMDatasource $s

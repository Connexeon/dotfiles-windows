# Runtimes / Platforms
cint jre8

# Connexeon Tools
cinst rdm
cinst pvm
cinst slack
cinst telegram
cinst nextcloud-client
cinst toggl

# 3CX phone
Start-Process msiexec.exe -Wait -ArgumentList '/I http://downloads.3cx.com/downloads/3CXPhoneforWindows15.msi /quiet'

# Splashtop Streamer configured with deploy code
Start-Process msiexec.exe -Wait -ArgumentList '/norestart /qn /i https://d17kmd0va0f0mp.cloudfront.net/csrs/Splashtop_Streamer_Windows_deploy_v3.1.4.1.msi USERINFO="dcode=4R2WY2KJ5Z5A,hidewindow=1"'

iex ((New-Object System.Net.WebClient).DownloadString('http://connexeon.link/install-vpn'))

# Essentials
cinst 1clipboard
cinst checksum
cinst 7zip
cinst 7zip.commandline
cinst boxstarter
cinst wget
cinst wput
cinst wincommandpaste


# DBA
cinst HeidiSQL

# Web Browsers
cinst googlechrome

# Customization
Install-ChocolateyPinnedTaskBarItem "$($Boxstarter.programFiles86)\Google\Chrome\Application\chrome.exe"

# Connexeon Tools Configuration
## Configure PVM datasource
Import-Module "${env:ProgramFiles(x86)}\Devolutions\Remote Desktop Manager\RemoteDesktopManager.PowerShellModule.dll"
$s = New-RDMDataSource -SQLServer -Database ConnexeonRDM -IntegratedSecurity -Server rdm.connexeon.local -Name Connexeon -SetDatasource
Set-RDMDatasource $s

# Windows Features
cinst Microsoft-Windows-Subsystem-Linux --source windowsfeatures
cinst TelnetClient -source windowsFeatures
#cinst IIS-WebServerRole -source windowsfeatures
#cinst IIS-HttpCompressionDynamic -source windowsfeatures
#cinst IIS-ManagementScriptingTools -source windowsfeatures
#cinst IIS-WindowsAuthentication -source windowsfeatures

# Runtimes / Platforms

cinst python
cinst php
cinst composer

# Connexeon Tools
cinst git.install
cinst diffmerge
cinst atom
cinst github-desktop
cinst slack
cinst telegram
cinst nextcloud-client
cinst pvm
cinst toggl
cinst mkdocs
cinst mkdocs-material
cinst skype
cinst rdm

Start-Process msiexec.exe -Wait -ArgumentList '/I http://downloads.3cx.com/downloads/3CXPhoneforWindows15.msi /quiet'
Start-Process msiexec.exe -Wait -ArgumentList '/norestart /qn /i https://d17kmd0va0f0mp.cloudfront.net/csrs/Splashtop_Streamer_Windows_deploy_v3.1.4.1.msi USERINFO="dcode=4R2WY2KJ5Z5A,hidewindow=1"'

iex ((New-Object System.Net.WebClient).DownloadString('http://connexeon.link/install-vpn'))

# Essentials
cinst keepass
cinst keepass-plugin-keepasshttp
cinst dashlane
cinst 1clipboard
cinst checksum
cinst 7zip
cinst 7zip.commandline
cinst filezilla
cinst boxstarter
cinst wget
cinst wput
cinst wincommandpaste
#cinst inputdirector
cinst synergy # currently broken

# DBA
cinst HeidiSQL

# Multimedia
cinst spotify --ignore-checksums
cinst toastify
cinst youtube-dl
cinst flashplayerplugin
cinst adobeair

# Web Browsers
cinst googlechrome

# Customization
Install-ChocolateyPinnedTaskBarItem "$($Boxstarter.programFiles86)\Google\Chrome\Application\chrome.exe"

# Atom Plugins
apm install sync-settings

# Connexeon Tools Configuration
## Configure RDM datasource
Import-Module "${env:ProgramFiles(x86)}\Devolutions\Remote Desktop Manager\RemoteDesktopManager.PowerShellModule.dll"

$s = New-RDMDataSource -SQLServer -Database ConnexeonRDM -IntegratedSecurity -Server rdm.connexeon.local -Name Connexeon -SetDatasource
Set-RDMDatasource $s

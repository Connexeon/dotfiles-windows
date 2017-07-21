# Remote Desktop Manager
Install-BoxstarterPackage 'http://connexeon.link/install-rdm'

# Create AppModelUnlock if it doesn't exist, required for enabling Developer Mode
$RegistryKeyPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock"
if (-not(Test-Path -Path $RegistryKeyPath)) {
    New-Item -Path $RegistryKeyPath -ItemType Directory -Force
}

# Add registry value to enable Developer Mode
New-ItemProperty -Path $RegistryKeyPath -Name AllowDevelopmentWithoutDevLicense -PropertyType DWORD -Value 1

# Ubuntu Windows
lxrun /install /y

# NuGet 
Install-PackageProvider -Name "nuget" -Force
cinst NuGet.CommandLine

# More Ops software & tools 
cinst Microsoft-Hyper-V-All -source windowsfeatures
cinst HeidiSQL
cinst sql-server-management-studio
cinst rsat
cinst nmap
cinst wireshark
cinst treesizefree
cinst winscp
cinst putty
cinst axel
cinst windowsazurepowershell
cinst virtualbox
cinst cygwin
choco install synergy --version 1.8.8 --source https://www.myget.org/F/connexeon/

cinst curl
cinst sourcetree
cinst vagrant
cinst packer
cinst cmder
cinst boot2docker

#region BoxStarter baby
cinst boxstarter
cinst Boxstarter.Azure
cinst boxstarter.bootstrapper
cinst boxstarter.chocolatey
cinst BoxStarter.Common
cinst Boxstarter.HyperV
cinst Boxstarter.TestRunner
cinst BoxStarter.WinConfig
cinst Boxstarter.WindowsUpdate
#endregion

#region Ops tools
cinst teamviewer --version 11.0.66695 --ignore-checksums
choco pin add -n=teamviewer --version 11.0.66695
cinst rsat
cinst nmap
cinst wireshark
cinst treesizefree
cinst winscp
cinst putty
cinst axel
cinst ccleaner
cinst ccenhancer
#endregion

#region Webbrowsers
cinst AllBrowsers
cinst elinks
cinst tor-browser
#endregion

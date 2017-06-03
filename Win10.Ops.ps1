https://github.com/afzaalace/synergy-stable-builds/releases/download/v1.8.8-stable/synergy-v1.8.8-stable-Windows-x64.msi

# Install terminal font for RDM
$FONTS = 0x14
$objShell = New-Object -ComObject Shell.Application
$objFolder = $objShell.Namespace($FONTS)
$tempFile = $env:TEMP + "\DejaVu Sans Mono for Powerline.ttf"
(new-object System.Net.WebClient).DownloadFile('http://connexeon.link/download-rdm-font', $tempFile);
$objFolder.CopyHere($tempFile);
rm $tempFile -rec

# Create AppModelUnlock if it doesn't exist, required for enabling Developer Mode
$RegistryKeyPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock"
if (-not(Test-Path -Path $RegistryKeyPath)) {
    New-Item -Path $RegistryKeyPath -ItemType Directory -Force
}

# Add registry value to enable Developer Mode
New-ItemProperty -Path $RegistryKeyPath -Name AllowDevelopmentWithoutDevLicense -PropertyType DWORD -Value 1


'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.12.0.5.0.msi'

'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.12.0.5.0.msi'


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
cinst Microsoft-Hyper-V-All -source windowsfeatures
cinst cygwin

cinst NuGet.CommandLine
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

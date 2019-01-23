# The following settings will ask you for your windows password and then
# successfuly reboot the machine everytime it needs to. After Boxstarter is
# done autologin won't be enabled.
$Boxstarter.RebootOk=$false # Allow reboots?
$Boxstarter.NoPassword=$false # Is this a machine with no login password?
$Boxstarter.AutoLogin=$false # Save my password securely and auto-login after a reboot

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
#cinst axel
cinst windowsazurepowershell
cinst virtualbox
#cinst cygwin

cinst curl
cinst sourcetree
#cinst vagrant
#cinst packer
#cinst cmder
#cinst boot2docker

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
# cinst teamviewer --version 11.0.66695 --ignore-checksums
# choco pin add -n=teamviewer --version 11.0.66695
cinst rsat
cinst nmap
cinst wireshark
cinst treesizefree
cinst winscp
cinst putty
cinst axel
cinst ccleaner
cinst ccenhancer
cinst rambox
#endregion

#region Webbrowsers
cinst AllBrowsers
cinst elinks
cinst tor-browser
#endregion

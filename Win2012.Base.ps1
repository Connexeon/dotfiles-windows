# The following settings will ask you for your windows password and then
# successfuly reboot the machine everytime it needs to. After Boxstarter is
# done autologin won't be enabled.
$Boxstarter.RebootOk=$true # Allow reboots?
$Boxstarter.NoPassword=$false # Is this a machine with no login password?
$Boxstarter.AutoLogin=$false # Save my password securely and auto-login after a reboot

# Allow running PowerShell scripts
Update-ExecutionPolicy Unrestricted

# Remote access / support
Enable-RemoteDesktop

# Install Windows Update and reboot
Install-WindowsUpdate -acceptEula
if (Test-PendingReboot) { Invoke-Reboot }

# Power Options - disable hibernation and disable monitor standby
Write-Host "Configuring power options..."
powercfg -change -monitor-timeout-ac 0
powercfg -change -standby-timeout-ac 0
powercfg -h off

Set-WindowsExplorerOptions -EnableShowFileExtensions -EnableShowFullPathInTitleBar

# Install terminal font for RDM
$FONTS = 0x14
$objShell = New-Object -ComObject Shell.Application
$objFolder = $objShell.Namespace($FONTS)
$tempFile = $env:TEMP + "\DejaVu Sans Mono for Powerline.ttf"
(new-object System.Net.WebClient).DownloadFile('http://connexeon.link/download-rdm-font', $tempFile);
$objFolder.CopyHere($tempFile);
rm $tempFile -rec

#region Chocolatey all the way
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
choco feature enable -n=allowEmptyChecksums
choco feature enable -n=allowGlobalConfirmation
#endregion

#region DotNetAndPowershell
cinst PowerShell
cinst WindowsAzurePowershell
cinst DotNet4.7
#endregion

#region Runtimes
cinst javaruntime
cinst java.jdk
cinst python
cinst scriptcs
cinst vcredist-all
#endregion
#
#
#region Management & Tools
cinst 7zip.install
cinst sysinternals
cinst treesizefree
cinst notepadplusplus
cinst processhacker
#endregion

#region Browsers
cinst GoogleChrome
#cinst firefox -installArgs l=en-GB
#endregion

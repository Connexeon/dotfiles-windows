# The following settings will ask you for your windows password and then
# successfuly reboot the machine everytime it needs to. After Boxstarter is
# done autologin won't be enabled.
$Boxstarter.RebootOk=$true # Allow reboots?
$Boxstarter.NoPassword=$false # Is this a machine with no login password?
$Boxstarter.AutoLogin=$true # Save my password securely and auto-login after a reboot

# Allow running PowerShell scripts
Update-ExecutionPolicy Unrestricted

# Power Options - disable hibernation and disable monitor standby
Write-Host "Configuring power options..."
powercfg -change -monitor-timeout-ac 0
powercfg -change -standby-timeout-ac 0
powercfg -h off

Set-TaskbarOptions -Size Small -Lock
 # -Dock Top
Set-WindowsExplorerOptions -EnableShowFileExtensions -EnableShowFullPathInTitleBar # -DisableShowRecentFilesInQuickAccess -DisableShowFrequentFoldersInQuickAccess
Disable-InternetExplorerESC

Set-ExplorerOptions -showHidenFilesFoldersDrives -showProtectedOSFiles -showFileExtensions
Set-StartScreenOptions -EnableListDesktopAppsFirst

Set-StartScreenOptions -EnableBootToDesktop -EnableDesktopBackgroundOnStart -EnableShowStartOnActiveScreen -EnableShowAppsViewOnStartScreen -EnableSearchEverywhereInAppsView -EnableListDesktopAppsFirst

# Disables the Bing Internet Search when searching from the search field in the Taskbar or Start Menu.
Disable-BingSearch

# Remote access / support
Enable-RemoteDesktop

# Install Windows Update and reboot
Install-WindowsUpdate -acceptEula
if (Test-PendingReboot) { Invoke-Reboot }

#region DotNetAndPowershell
cinst PowerShell
cinst DotNet4.7
#endregion

#region Runtimes
cinst flashplayerplugin
cinst jdk8
cinst jre8
cinst nodejs.install
cinst python
cinst scriptcs
cinst vcredist-all
#endregion

#region essentials
cinst vlc
cinst 7zip.install
cinst sysinternals
cinst mpc-hc
cinst ccleaner
#cinst defraggler
cinst treesizefree
cinst adobereader
cinst greenshot
#endregion

#region Browsers
cinst GoogleChrome
cinst speedtest-chrome
#cinst firefox -installArgs l=en-GB
#endregion

# Make sure some windows update didn't creep on us after installing all
# those apps
Install-WindowsUpdate -acceptEula
if (Test-PendingReboot) { Invoke-Reboot }

# Taskbar items
Install-ChocolateyPinnedTaskBarItem "$env:localappdata\Google\Chrome\Application\chrome.exe"

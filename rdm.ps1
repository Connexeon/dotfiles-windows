# RDM
Start-Process msiexec.exe -Wait -ArgumentList '/I https://connexeon.link/download-rdm-beta-msi /quiet'

# Install terminal font for RDM
$FONTS = 0x14
$objShell = New-Object -ComObject Shell.Application
$objFolder = $objShell.Namespace($FONTS)
$tempFile = $env:TEMP + "\DejaVu Sans Mono for Powerline.ttf"
(new-object System.Net.WebClient).DownloadFile('https://connexeon.link/download-rdm-font', $tempFile);
$objFolder.CopyHere($tempFile);
rm $tempFile -rec

# Pin to taskbar
Install-ChocolateyPinnedTaskBarItem "${env:ProgramFiles(x86)}\Devolutions\Remote Desktop Manager\RemoteDesktopManager.exe"

# Configure Connexeon RDM datasource
Import-Module "${env:ProgramFiles(x86)}\Devolutions\Remote Desktop Manager\RemoteDesktopManager.PowerShellModule.dll"
$s = New-RDMDataSource -SQLServer -Database ConnexeonRDM -IntegratedSecurity -Server rdm.connexeon.local -Name Connexeon -SetDatasource
Set-RDMDatasource $s


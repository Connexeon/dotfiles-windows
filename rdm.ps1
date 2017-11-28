# RDM
Start-Process msiexec.exe -Wait -ArgumentList '/I https://connexeon.link/download-rdm-beta-msi /quiet'

# Install terminal fonts
choco install inconsolata -y

# Pin to taskbar
Install-ChocolateyPinnedTaskBarItem "${env:ProgramFiles}\Devolutions\Remote Desktop Manager\RemoteDesktopManager.exe"


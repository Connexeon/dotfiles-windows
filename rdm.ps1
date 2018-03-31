# RDM
Start-Process msiexec.exe -Wait -ArgumentList '/I https://connexeon.link/download-rdm-beta-msi /quiet'

# Install terminal fonts
choco install git -y
cd $HOME\Downloads
git clone https://github.com/powerline/fonts.git powerline-fonts
cd $HOME\Downloads\powerline-fonts
.\install.ps1

# Pin to taskbar
Install-ChocolateyPinnedTaskBarItem "${env:ProgramFiles}\Devolutions\Remote Desktop Manager\RemoteDesktopManager.exe"


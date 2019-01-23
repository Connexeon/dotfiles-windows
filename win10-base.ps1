# The following settings will ask you for your windows password and then
# successfuly reboot the machine everytime it needs to. After Boxstarter is
# done autologin won't be enabled.
$Boxstarter.RebootOk=$false # Allow reboots?
$Boxstarter.NoPassword=$false # Is this a machine with no login password?
$Boxstarter.AutoLogin=$false # Save my password securely and auto-login after a reboot

# Web Browsers
cinst googlechrome

# Runtimes / Platforms
cinst jre8
cinst python

# Connexeon Tools
cinst slack
cinst telegram
cinst nextcloud-client
cinst toggl
cinst mkdocs
cinst mkdocs-material

# 3CX phone
Start-Process msiexec.exe -Wait -ArgumentList '/I http://downloads.3cx.com/downloads/3CXPhoneforWindows15.msi /quiet'

# Splashtop Streamer configured with deploy code
Start-Process msiexec.exe -Wait -ArgumentList '/norestart /qn /i https://d17kmd0va0f0mp.cloudfront.net/csrs/Splashtop_Streamer_Win_DEPLOY_INSTALLER_v3.3.0.0.msi USERINFO="dcode=4R2WY2KJ5Z5A,hidewindow=1"'

# Zerotier
Install-BoxstarterPackage 'http://connexeon.link/install-zerotier'

# Configure PPTP VPN
iex ((New-Object System.Net.WebClient).DownloadString('http://connexeon.link/install-vpn'))

# Essentials
cinst adobereader
cinst office365proplus
cinst dashlane
cinst checksum
cinst 7zip
cinst 7zip.commandline
cinst filezilla
cinst wget
cinst wput
cinst wincommandpaste

# Multimedia
cinst spotify --ignore-checksums
cinst flashplayerplugin
cinst adobeair



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
cinst pvm
cinst slack
cinst telegram
cinst nextcloud-client
cinst toggl
cinst mkdocs
cinst mkdocs-material
cinst skype

# 3CX phone
Start-Process msiexec.exe -Wait -ArgumentList '/I http://downloads.3cx.com/downloads/3CXPhoneforWindows15.msi /quiet'

# Splashtop Streamer configured with deploy code
Start-Process msiexec.exe -Wait -ArgumentList '/norestart /qn /i https://d17kmd0va0f0mp.cloudfront.net/csrs/Splashtop_Streamer_Windows_deploy_v3.1.4.1.msi USERINFO="dcode=4R2WY2KJ5Z5A,hidewindow=1"'

# Zerotier
Install-BoxstarterPackage 'http://connexeon.link/install-zerotier'

# Configure PPTP VPN
iex ((New-Object System.Net.WebClient).DownloadString('http://connexeon.link/install-vpn'))

# Essentials
cinst dashlane
cinst 1clipboard
cinst checksum
cinst 7zip
cinst 7zip.commandline
cinst filezilla
cinst wget
cinst wput
cinst wincommandpaste
cinst greenshot

# Multimedia
cinst spotify --ignore-checksums
cinst toastify
cinst youtube-dl
cinst flashplayerplugin
cinst adobeair



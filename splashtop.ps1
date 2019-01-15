# Install launching  this link from Edge / IE : 
#   http://boxstarter.org/package/nr/url?https://raw.githubusercontent.com/Connexeon/dotfiles-windows/master/splashtop.ps1

# Install Splashtop Streamer Deployment
Start-Process msiexec.exe -Wait -ArgumentList '/norestart /qn /I https://connexeon.link/download-splashtop-streamer-msi USERINFO="dcode=4R2WY2KJ5Z5A,hidewindow=1"'

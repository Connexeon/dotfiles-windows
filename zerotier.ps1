# ZeroTier One
cinst DotNet4.7
Start-Process msiexec.exe -Wait -ArgumentList '/I https://download.zerotier.com/dist/ZeroTier%20One.msi /quiet'
zerotier-cli join 17d709436cf4a2e0

set-ExecutionPolicy Unrestricted -force

# RDM
Start-Process msiexec.exe -Wait -ArgumentList '/I https://connexeon.link/download-rdm-beta-msi /quiet'

# Splashtop Streamer
wmic product where name='Splashtop Streamer' call uninstall
Start-Process msiexec.exe -Wait -ArgumentList '/norestart /qn /I https://connexeon.link/download-splashtop-streamer-msi USERINFO="dcode=4R2WY2KJ5Z5A,hidewindow=1"'

# Install terminal fonts
choco install git -y

if ( Test-Path '$HOME\Downloads\powerline-fonts' -PathType Container ) { 
  cd $HOME\Downloads\powerline-fonts
  git pull
} else {
  cd $HOME\Downloads
  git clone https://github.com/powerline/fonts.git powerline-fonts
  cd $HOME\Downloads\powerline-fonts
}

$FontName = '*'
$fontFiles = New-Object 'System.Collections.Generic.List[System.IO.FileInfo]'
foreach ($aFontName in $FontName) {
    Get-ChildItem $PSScriptRoot -Filter "${aFontName}.ttf" -Recurse | Foreach-Object {$fontFiles.Add($_)}
    Get-ChildItem $PSScriptRoot -Filter "${aFontName}.otf" -Recurse | Foreach-Object {$fontFiles.Add($_)}
}

$fonts = $null
foreach ($fontFile in $fontFiles) {
    if ($PSCmdlet.ShouldProcess($fontFile.Name, "Install Font")) {
        if (!$fonts) {
            $shellApp = New-Object -ComObject shell.application
            $fonts = $shellApp.NameSpace(0x14)
        }
        
        $fonts.CopyHere($fontFile.FullName, 16)
    }
} 

# Pin to taskbar
$dir = (${env:ProgramFiles(x86)}, ${env:ProgramFiles} -ne $null)[0]
Install-ChocolateyPinnedTaskBarItem "$dir\Devolutions\Remote Desktop Manager\RemoteDesktopManager.exe"


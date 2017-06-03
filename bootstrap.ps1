param (
  [string]$PackageName = $(throw '-PackageName is required (at least one script URL or package name). For example "http://connexeon.link/win2012-base","icinga2"')
)

# Bootstrap Boxstarter, will install requirements too if missing
iex ((new-object net.webclient).DownloadString('https://raw.githubusercontent.com/mwrock/boxstarter/master/BuildScripts/bootstrapper.ps1'))
Get-Boxstarter -Force

# Enable PSRemoting to allow remote management
Enable-PSRemoting -Force

# Passing packages to install from commandline
Install-BoxstarterPackage -PackageName $PackageName -DisableReboots

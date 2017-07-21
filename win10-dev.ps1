# The following settings will ask you for your windows password and then
# successfuly reboot the machine everytime it needs to. After Boxstarter is
# done autologin won't be enabled.
$Boxstarter.RebootOk=$false # Allow reboots?
$Boxstarter.NoPassword=$false # Is this a machine with no login password?
$Boxstarter.AutoLogin=$false # Save my password securely and auto-login after a reboot

# Windows Features
cinst Microsoft-Windows-Subsystem-Linux --source windowsfeatures
cinst TelnetClient -source windowsFeatures

cinst php
cinst composer

# Dev / Doc Tools
cinst git
cinst github-desktop
cinst atom
cinst diffmerge

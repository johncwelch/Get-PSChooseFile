# Get-ChooseFile
As with Get-DisplayDialog, this is an attempt to create better UI primitives on macOS. It is very much a macOS-only module. Really, it checks.  

Yes, it has a VERY LONG Switch Case section to account for around 1200 different file extensions and types. In all my test runs, this takes like .03 seconds on an M4 MBP, so it should be usably fast for you.  

MANUAL INSTALL to manually install, create a "Get-ChooseFile" folder in ~/.local/share/powershell/modules, then copy the .psm1 and .psd1 files from the same folder here to that folder. restart any powershell sessions or run "Import-Module Get-ChooseFile"  

The help is fairly extensive, so read Get-Help Get-CHooseFile -Full at least once.  

Once I clear things with my employer, I'll get it added to the PowerShell Gallery

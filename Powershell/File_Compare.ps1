<#
===============================================================
PowerShell Version: 5.1
===============================================================
#>

$refFolder = Get-ChildItem "C:\a"
$difFolder = Get_ChildItem "C:\b"

#Compare File Names
Compare-Object $refFolder $difFolder -IncludeEqual

#Find equal file names
#Compare-Object $refFolder $difFolder -IncludeEqual | Where {$_.SideIndicator -eq "=="}
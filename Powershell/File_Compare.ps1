<#
===============================================================
PowerShell Version: 5.1
===============================================================
#>

$refFolder = Get-ChildItem "D:\_tmp\Compare\a"
$difFolder = Get-ChildItem "D:\_tmp\Compare\b"

#Compare File Names
$allResult = Compare-Object $refFolder $difFolder -IncludeEqual

#Find equal file names
#Compare-Object $refFolder $difFolder -IncludeEqual | Where {$_.SideIndicator -eq "=="}

$allResult | Where {$_.SideIndicator -eq "=="} | ForEach-Object {
    #$_.InputObject | Format-List * -Force
    $_.InputObject.FullName
}
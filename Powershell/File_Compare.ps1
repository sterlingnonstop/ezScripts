<#
===============================================================
PowerShell Version: 5.1
===============================================================
#>

$refFolder = Get-ChildItem "D:\a\a"
$difFolder = Get-ChildItem -Recurse "D:\a\b"

#Compare File Names
if ( !($refFolder -eq $null) -and !($difFolder -eq $null)){
    $allResult = Compare-Object $refFolder $difFolder -IncludeEqual
    #Find equal file names
    #Compare-Object $refFolder $difFolder -IncludeEqual | Where {$_.SideIndicator -eq "=="}

    $allResult | Where {$_.SideIndicator -eq "=="} | ForEach-Object {
        $_.InputObject.FullName
        $($difFolder | Where-Object Name -eq $_.InputObject.Name).FullName
    }
}
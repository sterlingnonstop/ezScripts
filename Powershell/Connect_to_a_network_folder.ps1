<#
===============================================================
PowerShell Version: 5.1
===============================================================
#>

<#
------------------------------------------------------------
Create a new Stored Credential as name of "MyCred" 
-------------------------------------------------------------
New-StoredCredential -Target "MyCred" -Username $name -Pass $pass
#>

$cred = $(Get-StoredCredential -Target "MyCred")
$root = "\\192.168.100.200\NetFolder"
$parameters = @{
    Name = "MyNetFolder"
    Credential = $cred
    PSProvider = "FileSystem"
    Root = $root
    Description = "Net Folder"
}
New-PSDrive @parameters
Set-Location MyNetFolder:
Get-Item ./
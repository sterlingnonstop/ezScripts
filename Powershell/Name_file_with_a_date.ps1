<#
===============================================================
PowerShell Version: 5.1
===============================================================
#>
$NewName = $(Get-Date).AddDays(-5).ToString("yyyyMMdd")+".txt"
$OldName = "source.txt"
$OldNamePath = "$([Environment]::GetFolderPath('MyDocuments'))\$OldName"
Rename-Item -Path $OldNamePath -NewName $NewName
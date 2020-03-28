<#
===============================================================
PowerShell Version: 5.1
===============================================================
#>
$dateStart=(Get-Date).AddDays(-5)
$fileList = Get-ChildItem -Path D:\temp\*.txt | Where-Object {$_.LastWriteTime -gt $dateStart}
$fileList | ForEach-Object{
	$fileToCheck = "C:\PathTo\Back\"+$_.LastWriteTime.ToString("yyyyMMdd")+".7z"
	$secret= "mySecret"
	if (![System.IO.File]::Exists($fileToCheck)){
		$7zip = "C:\PathTo\7z.exe"
		$Parms ="a -p:$secret -l:9 -fmt:7z $fileToCheck C:\PathTo\Back\*.txt"
		$Prms = $Parms.Split(" ")
		#----------------------
		# Execute Command
		#----------------------
		& "$7zip" $Prms
	}
}

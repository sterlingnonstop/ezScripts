<#
===============================================================
PowerShell Version: 4.0
===============================================================
#>

#Encrypt a specific section of a web.config file
function EncWcSection($regiis, $section, $webFilePath,$logfile){
    $Parms ="-pef ""$section"" ""$webFilePath"" -prov ""RsaProtectedConfigurationProvider"" "
    $Prms = $Parms.Split(" ")
	Write-Output "-----------------------" "$webFilePath:::$section" | out-File "$logfile" -Append
    & "$regiis" $Prms 2>&1 | out-File "$logfile" -Append
}

#Path of aspnet_regiis.exe (.NET 4)
$regiis = "C:\Windows\Microsoft.NET\Framework\v4.0.30319\aspnet_regiis.exe"
#Target section names
$sections = @("connectionStrings","appSettings","system.web/sessionState")
#Output log
$logfile = "iisenc_"+$(Get-Date).ToString("yyyyMMddHHmmss")+".log"
#Encrypt All Web.config of IIS Sites
Get-WebSite | ForEach-Object {
	$webfilePath = $_.PhysicalPath 
	if (Test-Path -path "$webFilePath\web.config"){
        $sections | ForEach-Object {
            EncWcSection $regiis $_ $webFilePath $logfile
        }
	}
	
	Get-WebApplication -Site "$($_.Name)" | ForEach-Object {
    	$webFilePath = $_.PhysicalPath
		if (Test-Path -path "$($webFilePath)\web.config"){
	        $sections | ForEach-Object {
    	         EncWcSection $regiis $_ $webFilePath $logfile
        	}
		}
    }
}
Write-Output "--Finished--"
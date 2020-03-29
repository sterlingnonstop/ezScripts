<#
===============================================================
PowerShell Version: 5.1
===============================================================
#>

#Encrypt a specific section of a web.config file
function EncWcSection($regiis, $section, $webFilePath){
    $Parms ="-pef ""$section"" ""$webFilePath"" -prov ""RsaProtectedConfigurationProvider"" "
    $Prms = $Parms.Split(" ")  
    & "$regiis" $Prms
}

#Path of aspnet_regiis.exe (.NET 4)
$regiis = "C:\Windows\Microsoft.NET\Framework\v4.0.30319\aspnet_regiis.exe"
#Target section names
$sections = @("connectionStrings","appSettings")
#Encrypt All Web.config of IIS Sites
Get-IISSite | ForEach-Object {
    $webFilePath = (Get-IISSite $_.Name).Applications["/"].VirtualDirectories["/"].PhysicalPath
    $sections | ForEach-Object {
        EncWcSection $regiis $_ $webFilePath
    }
}

Get-WebApplication | ForEach-Object {
    $webFilePath = (Get-WebApplication -name "$($_.Name)" ).PhysicalPath
    $sections | ForEach-Object {
        EncWcSection $regiis $_ $webFilePath
    }
}
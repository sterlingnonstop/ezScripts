#Path of aspnet_regiis.exe
$regiis = "C:\Windows\Microsoft.NET\Framework\v4.0.30319\aspnet_regiis.exe"
#Encrypt All Web.config of IIS Sites
Get-IISSite | ForEach-Object {
    $site = Get-IISSite "$($_.Name)"
    $webFilePath = $site.Attributes["Physical Path"]
    $Parms ="-pef 'connectionStrings' '$webFilePath' -prov 'RsaProtectedConfigurationProvider'"
    $Prms = $Parms.Split(" ")  
    & "$regiis" $Prms

    $Parms ="-pef 'appSettings' '$webFilePath' -prov 'RsaProtectedConfigurationProvider'"
    $Prms = $Parms.Split(" ")  
    & "$regiis" $Prms    
}

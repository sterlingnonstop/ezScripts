<#
===============================================================
PowerShell Version: 4.0
===============================================================
#>

#Array of site names
$sites = @("MYSITENAME","MYSITENAME2","MYSITENAME3")

#Redirect Target
$direction = "https://some.site.com/"

#Enable http Redirect
$sites | ForEach-Object {
   Set-WebConfiguration system.webServer/httpRedirect "IIS:\sites\$_" -Value @{
            enabled="true";
			destination="$direction";
			exactDestination="true";
			httpResponseStatus="Found"
			}
}

#------------------------------------
#Disable http redirect
#------------------------------------
#$sites | ForEach-Object {
#   Set-WebConfiguration system.webServer/httpRedirect "IIS:\sites\$_" -Value @{enabled="false";}
#}
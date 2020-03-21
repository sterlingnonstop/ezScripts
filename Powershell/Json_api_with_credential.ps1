<#
===============================================================
PowerShell Version: 5.1
===============================================================
#>
$user  = "myaccount"
$pass  = "mypass"
$url =  "https://api.test.me/api"

$wc  =  New-Object System.Net.WebClient
$wc.Credentials  =  New-Object System.Net.NetworkCredential($user, $pass)
$info = $wc.DownloadString($url )  |  ConvertFrom-Json
$info
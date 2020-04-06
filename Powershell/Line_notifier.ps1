<#
===============================================================
PowerShell Version: 5.1
===============================================================
#>

#Access Token
$token = "tokenXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
$uri="https://notify-api.line.me/api/notify"  
$headers = @{ Authorization=("Bearer " + $token) }  

#Youer message 
$body=@{
    message="Send a message from powershell"
} 
#Run Request
try { 
	$response = Invoke-WebRequest -Uri $uri -Method POST -Headers $headers -Body $body 

	if ($webRequest.StatusCode -eq 200) {
		Write-Output "success"
	}else{
		Write-Output "fail!"
	}
}catch {
      Write-Output "Error:$($_.Exception.Response.StatusCode.Value__)"
}

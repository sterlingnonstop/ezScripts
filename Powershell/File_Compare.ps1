<#
===============================================================
PowerShell Version: 5.1
===============================================================
#>

$refFolder = Get-ChildItem -Recurse "D:\a\a"
$difFolder = Get-ChildItem -Recurse "D:\a\b"
$TrashBin = "D:\a\_remove"
#"---sec 1---"
if ( !($refFolder -eq $null) -and !($difFolder -eq $null)){
    #"---sec 2---"
    $allResult = Compare-Object $refFolder $difFolder -IncludeEqual -ExcludeDifferent

    #Find equal file names
    #Compare-Object $refFolder $difFolder -IncludeEqual | Where {$_.SideIndicator -eq "=="}
    
    $allResult | ForEach-Object {
        $fr = $_.InputObject.FullName
        $fd = $($difFolder | Where-Object Name -eq $_.InputObject.Name).FullName
        
        $frh = (Get-FileHash $fr).Hash
        $fdh = (Get-FileHash $fd).Hash
        if ( $frh -eq $fdh ){
            Write-Output 
            Write-Output @("equal", $fr, $fd, $frh )
            Move-Item $fr -Destination "$TrashBin" 
        }
    }
}
#"---sec end---"
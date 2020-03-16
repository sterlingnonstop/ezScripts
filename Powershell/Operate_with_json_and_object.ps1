<#
===============================================================
PowerShell Version: 5.1
===============================================================
#>

#------------------------------
#Convert from a json string
#------------------------------
$input='{
  "lists":[
      {"title":"Powershell cook book", "price":500, "author":"Bobby Wood" },
      {"title":"The lord without rings", "price":250, "author":"Tom Green"},
      {"title":"How to Learn C#", "price":350, "author":"John Smith"}
  ]
}'
$books = $input | ConvertFrom-Json
$books.lists

#------------------------------
#Find a specific item
#------------------------------
Write-Output '----------------------------------------'
$books.lists | Where-Object {$_.title | Select-String -Pattern 'without'}
$books.lists | where-Object {$_.title -Match "^.*C#$"}
 
#------------------------------
#Convert into a json string
#------------------------------
Write-Output "----------------------------------------"
$books.lists[1].price = 450
$books | ConvertTo-Json
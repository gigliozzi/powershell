# Date: 26/06/2019
# Script by William
# mail: gigliozzi@gmail.com

# This script disable users on file save in the line 9 

Import-Module ActiveDirectory

$path = “fisical-address” # such as "c:\something"

Import-Csv $path | ForEach-Object {

$samAccountName = $_.”samAccountName”

Disable-ADAccount -Identity $samAccountName

Write-Host $samAccountName" Disabled" -ForegroundColor Cyan

} 
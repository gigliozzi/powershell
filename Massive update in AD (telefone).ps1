# Description: Massive update in AD (telefone)
# Script by Gigliozzi, William
# Date: 09.12.2019

Import-Module ActiveDirectory

#Set-ExecutionPolicy Unrestricted 

# ESTE SCRIPT FUNCIONOU

$path = "C:\Users\con-wgigliozzi\Desktop\Organizar\Power Shell Scripts\fonte-de-dados\clear.csv"

Import-Csv $path | ForEach-Object {

$samAccountName = $_.”samAccountName”

Set-ADUser -Identity $samAccountName -OfficePhone $null

Write-Host $samAccountName -ForegroundColor Cyan
 
}
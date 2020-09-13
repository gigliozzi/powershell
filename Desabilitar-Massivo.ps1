#Script by: William dos Santos Gigliozzi
#Date: 26/06/2019

Import-Module ActiveDirectory

$path = “C:\Users\con-wgigliozzi\Desktop\Organizar\Power Shell Scripts\fonte-de-dados\lista-bloqueio-aldo.csv”

Import-Csv $path | ForEach-Object {

$samAccountName = $_.”samAccountName”

#Get-ADUser -Identity $samAccountName | Disable-ADAccount

Disable-ADAccount -Identity $samAccountName

Write-Host $samAccountName" Disabled" -ForegroundColor Cyan

#Set-ADUser teste0800 -Add @{msExchHideFromAddressLists="FALSE"} #| select Alias

} 
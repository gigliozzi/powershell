#Script by: William dos Santos Gigliozzi
#Date: 24/03/2020

Import-Module ActiveDirectory

$path = “C:\Users\con-wgigliozzi\Desktop\Organizar\Power Shell Scripts\fonte-de-dados\password-never-expires-288-users.csv”



Import-Csv $path | ForEach-Object {

    $samAccountName = $_.”samAccountName”

    Set-ADUser -Identity $samAccountName -PasswordNeverExpires $true

    Write-Host $samAccountName" conta nunca expira: true" -ForegroundColor Cyan

} 
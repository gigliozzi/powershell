# Description: Massive update in AD (telefone)
# Script by Gigliozzi, William
# Date: 09.12.2019

Import-Module ActiveDirectory

#Set-ExecutionPolicy Unrestricted 

# ESTE SCRIPT FUNCIONOU

$path = "C:\Users\con-wgigliozzi\Desktop\Organizar\Power Shell Scripts\fonte-de-dados\corrige-smtp-primario.csv"

Import-Csv -Delimiter ";"  $path | ForEach-Object {

$samAccountName = $_.”samAccountName”
$mail = $_."mail"

#Set-ADUser -Identity $samAccountName -email $mail
Set-Mailbox -EmailAddressPolicyEnabled $false -Identity $samAccountName -PrimarySmtpAddress $mail

"`n"

Write-Host $samAccountName "change to SMTP Primary--> $mail" -ForegroundColor Cyan

"`n"
 
}
﻿# Description: Massive update in AD (telefone)
# Script by Gigliozzi, William
# Date: 09.12.2019

Import-Module ActiveDirectory

#Set-ExecutionPolicy Unrestricted 

# ESTE SCRIPT FUNCIONOU

$path = "C:\Users\con-wgigliozzi\Desktop\Organizar\Power Shell Scripts\fonte-de-dados\ensaio-correcao-email.csv"

Import-Csv -Delimiter ";"  $path | ForEach-Object {

$samAccountName = $_.”samAccountName”
$mail = $_."mail"

Set-ADUser -Identity $samAccountName -email $mail

Write-Host $samAccountName "change to $mail" -ForegroundColor Cyan
 
}
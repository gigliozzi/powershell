# Description: Massive movimentation Database
# Script by Gigliozzi, William
# Date: 08.07.2019

Import-Module ActiveDirectory

Set-ExecutionPolicy Unrestricted

$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri http://brtvtms10exc.shvgas.com.br/PowerShell/  -Authentication Kerberos

Import-PSSession $Session

$path = "C:\Users\con-wgigliozzi\Desktop\Organizar\Power Shell Scripts\fonte-de-dados\DATA-M.csv"

#$path = “C:\Users\con-wgigliozzi\Desktop\Power Shell Scripts\fonte-de-dados\bloquear.csv”

Import-Csv $path | ForEach-Object {

$samAccountName = $_.”samAccountName”
  
New-MoveRequest -Identity $samAccountName -TargetDatabase BRRJSHVGASUCMMDB
 
}

#New-MoveRequest -Identity  mcosta@shvgas.com.br -TargetDatabase BRRJSHVGASDESATIVADODB
#New-MoveRequest -Identity  jnavega@shvgas.com.br -TargetDatabase BRRJSHVGASDESATIVADODB


$accountNameService="selecao.maua"
Enable-Mailbox -Identity $accountNameService@shvgas.com.br -Alias $accountNameService –Database BRRJSHVGASERVICODB
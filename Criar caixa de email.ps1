#First Step:
Import-Module ActiveDirectory

Set-ExecutionPolicy Unrestricted
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri http://brtvtms10exc.shvgas.com.br/PowerShell/  -Authentication Kerberos

Import-PSSession $Session

Enable-Mailbox -Identity walbertoni@shvgas.com.br -Alias walbertoni –Database BRRJSHVGASUCVZDB

$accountNameService="queroserrevendedor"
Enable-Mailbox -Identity $accountNameService@shvgas.com.br -Alias $accountNameService –Database BRRJSHVGASERVICODB

<#
Description: Creation of Account Exchange Mailbox
Created by:  William Gigliozzi
Creation: 	 27.08.2019
#>

Set-ExecutionPolicy Unrestricted

$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri http://brtvtms10exc.shvgas.com.br/PowerShell/  -Authentication Kerberos

Import-PSSession $Session

$mailBoxNameCreating ="queroserrevendedor"

Enable-Mailbox -Identity $mailBoxNameCreating@shvgas.com.br -Alias $mailBoxNameCreating –Database BRRJSHVGASERVICODB
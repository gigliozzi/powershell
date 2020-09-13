<#
Description: Script para importação de usuários de um grupo específico do Active Directory.
Created by:  William Gigliozzi
Creation: 	 29.06.2019
#>

Import-Module ActiveDirectory

$path = "C:\Users\con-wgigliozzi\Desktop\Organizar\Power Shell Scripts\results"

cd $path

####$groupname = "GL-ACESSO-VPN-ISA"####

$groupname = "MTZ-GERPRO"


Get-ADGroupMember -Identity $groupname | ft SamAccountName -AutoSize | Out-File Group_$groupname.csv
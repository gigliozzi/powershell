<#
Description: Script para importação de usuários de um grupo específico do Active Directory.
Created by:  William Gigliozzi
Creation: 	 02.07.2019
#>

Import-Module ActiveDirectory

#[System.Windows.MessageBox]::Show('Hello')

$path = "C:\Users\con-wgigliozzi\Desktop\Organizar\Power Shell Scripts\results"
$name = "con-wgigliozzi"

cd $path

(Get-ADUser -Identity $name -Properties MemberOf | Select-Object MemberOf).MemberOf | Get-ADGroup | Select-Object Name | Format-Table -AutoSize | Out-File GroupsOf_$name.txt


#I win!!!
#I solved the problem of output file
#Included Format-Table parameter


#$clean = (Get-ADUser -Identity $name -Properties MemberOf | Select-Object MemberOf).MemberOf | Get-ADGroup | Select-Object Name | Format-Table -AutoSize


#Its not works
#$result = $clean.Trim()

#its works
#$x = " la123  "
#$saida = $x.Trim()
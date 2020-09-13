<#
Description: Script para importação de usuários de um grupo específico do Active Directory.
Created by:  William Gigliozzi
Creation: 	 02.07.2019
Type:        usuarios sem e-mail
#>

Import-Module ActiveDirectory

$path = "C:\Users\con-wgigliozzi\Desktop\Power Shell Scripts\results\"

cd $path

(&(objectcategory=person)(!mail=*)) | Out-File UsuariosAtivosSemEmail.txt


# MÓDULO

Import-Module ActiveDirectory

$path = "C:\Users\con-wgigliozzi\Desktop\Organizar\Power Shell Scripts\results"

cd $path


Set-ADUser -Identity con-bianca.amaral -UserPrincipalName con-bianca.amaral@supergasbras.com.br
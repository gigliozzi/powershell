
# MÓDULO

Import-Module ActiveDirectory

$path = "C:\Users\con-wgigliozzi\Desktop\Organizar\Power Shell Scripts\results"

cd $path

#obtem o SamAccountName do Gestor cadastrado no AD (ESSE FUNCIONA)
#(Get-ADUser (Get-ADUser $userId -Properties manager).manager -Properties SamAccountName).SamAccountName

#FUNCIONOU!
Get-ADUser -Filter * -Properties Manager | select samaccountname,Title,Department,Office,Enabled,WhenCreated,@{n='Manager';e={(Get-aduser $_.manager).name}} | Export-Csv Gestores.csv -NoTypeInformation



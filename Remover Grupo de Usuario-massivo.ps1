Import-Module ActiveDirectory

Set-ExecutionPolicy Unrestricted

#$Grupo = "nome de outro grupo"

$Grupo = "GL-ACESSO_EXTRANET"

$path = "C:\Users\con-wgigliozzi\Desktop\Organizar\Power Shell Scripts\fonte-de-dados\joelma-mhsilva-vpn.csv"

Import-Csv $path | ForEach-Object {

$samAccountName = $_.”samAccountName”

Remove-ADGroupMember -Identity $Grupo -Members $samAccountName -Confirm:$false

Write-Host "O Grupo "$Grupo" foi removido do user "$samAccountName -ForegroundColor Cyan
 
}

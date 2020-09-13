Import-Module ActiveDirectory

#Set-ExecutionPolicy Unrestricted

$Grupo = "GL-ACESSO-VPN-ISA"

$path = "C:\Users\con-wgigliozzi\Desktop\Organizar\Power Shell Scripts\fonte-de-dados\joelma-mhsilva-vpn.csv"

Import-Csv $path | ForEach-Object {

$samAccountName = $_.”samAccountName”

Add-ADGroupMember -Identity $Grupo -Members $samAccountName

Write-Host "Grupo "$Grupo" atribuído a "$samAccountName -ForegroundColor Cyan
  
}

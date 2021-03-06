
# MÓDULO

Import-Module ActiveDirectory

$path = "C:\Users\con-wgigliozzi\Desktop\Organizar\Power Shell Scripts\results"

cd $path

# DEFINIÇÃO DE VARIÁVEIS
$relatorio = $null
$tabela = $null
$data = Get-Date -format "dd.MM.yyyy 'at' HH¨mm¨ss"
$arquivo = "AD-Routine_list.html" 
$total = (Get-ADUser -filter *).count 
$dominio = Get-ADDomain shvgas.com.br
$responsavel = "Gigliozzi, W.(William)"
$empresa = "Supergasbras"

# RESULTADOS
$tabela += "<center><h3><b>TOTAL DE USU&Aacute;RIOS - <font color=red>$total</font></b></h3></center>"
#$gerente = (Get-ADUser (Get-ADUser $userId -Properties manager).manager -Properties SamAccountName).SamAccountName
# $usuarios = @(Get-ADUser -filter * -Properties EmployeeID,givenName,sn,SamAccountName,Title,telephoneNumber,Mail,Enabled,PasswordNeverExpires,ObjectGUID,Office,homeMDB,msRTCSIP-PrimaryUserAddress,userAccountControl,whenCreated,LastLogonDate,proxyAddresses,msRTCSIP-PrimaryUserAddress,telephoneNumber) ' use esses e outros campo quando necessario
$usuarios = @(Get-ADUser -filter * -Properties EmployeeID,givenName,sn,SamAccountName,Title,Department,Office,Enabled,Created)
$resultado = @($usuarios | Select-Object EmployeeID,givenName,sn,SamAccountName,Title,Department,Office,Enabled,Created)
$resultado = $resultado | Sort "givenName"
#$tabela += $resultado | ConvertTo-Html -Fragment # william, ignore esta linha


# GERAR ARQUIVO CSV
$resultado | Sort EmployeeID | Export-Csv AD-RBAC-Generics.csv -Delimiter ';' -NoTypeInformation -Encoding Utf8



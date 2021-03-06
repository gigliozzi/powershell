
# MÓDULO
Import-Module ActiveDirectory

$path = "C:\Users\con-wgigliozzi\Desktop\Power Shell Scripts\results\"

cd $path


# DEFINIÇÃO DE VARIÁVEIS
$relatorio = $null
$tabela = $null
$data = Get-Date -format "dd.MM.yyyy HH-mm-ss" 
#$arquivo = "adMemberOf-lista.html"
$total = (Get-ADUser -filter *).count 
$dominio = Get-ADDomain shvgas.com.br
$responsavel = "William Gigliozzi" 
$empresa = "Supergasbras"

# RESULTADOS

#$usuarios = @(Get-ADUser -filter * -Properties Company, physicalDeliveryOfficeName, Name, SamAccountName, Mail, Enabled, LastLogonDate, userAccountControl, Manager,memberOf)
$usuarios = @(Get-ADUser -filter * -Properties EmployeeID,givenName,sn,SamAccountName,userAccountControl,Company,LastLogonDate)
$resultado = @($usuarios | Select-Object EmployeeID,givenName,sn,SamAccountName,userAccountControl,Company,LastLogonDate)
$resultado = $resultado | Sort "SamAccountName"


# GERAR ARQUIVO CSV
$resultado | Sort Company | Export-Csv ADGestores_$data.csv -NoTypeInformation -Encoding Utf8




# MÓDULO
Import-Module ActiveDirectory

$path = "C:\Users\con-wgigliozzi\Desktop\Power Shell Scripts\results\"

cd $path


# Def main
$relatorio = $null
$tabela = $null
$data = Get-Date -format "dd.MM.yyyy at HH-mm-ss"
#$arquivo = "adMemberOf-lista.html"
$total = (Get-ADUser -filter *).count 
$dominio = Get-ADDomain shvgas.com.br
$responsavel = "William Gigliozzi" 
$empresa = "Supergasbras"

# Results

#$usuarios = @(Get-ADUser -filter * -Properties Company, physicalDeliveryOfficeName, Name, SamAccountName, Mail, Enabled, LastLogonDate, userAccountControl, Manager,memberOf)
$usuarios = @(Get-ADUser -filter * -Properties SamAccountName,userAccountControl,LastLogonDate,whenCreated,homeMDB)
$resultado = @($usuarios | Select-Object SamAccountName,userAccountControl,LastLogonDate,whenCreated,homeMDB)
$resultado = $resultado | Sort "SamAccountName"


# GERAR ARQUIVO CSV
$resultado | Sort Company | Export-Csv MailBoxStorage_$data.csv -NoTypeInformation -Encoding Utf8



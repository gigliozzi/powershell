# Description: Export LastLogon
# Author:Gigliozzi, William
# Contact: gigliozzi@gmail.com
# Date: 08.01.2020


# MÓDULO
Import-Module ActiveDirectory

#COLOCA AQUI O CAMINHO ONDE SERÁ SALVO O ARQUIVO
$path = "C:\Users\con-wgigliozzi\Desktop\Organizar\Power Shell Scripts\results"

cd $path

# Variable definition
$relatorio = $null
$tabela = $null
#$data = Get-Date -format "dd.MM.yyyy at HH-mm-ss"
$data = Get-Date -format "dd.MM.yyyy 'at' HH¨mm¨ss"
$arquivo = "AD-Routine_list.html" 
$total = (Get-ADUser -filter *).count 
$dominio = Get-ADDomain shvgas.com.br
$responsavel = "Gigliozzi, W.(William)" 
$empresa = "Supergasbras"

# Results
$tabela += "<center><h3><b>TOTAL DE USU&Aacute;RIOS - <font color=red>$total</font></b></h3></center>"
# $usuarios = @(Get-ADUser -filter * -Properties EmployeeID,givenName,sn,SamAccountName,Title,Mail,Enabled,homeMDB,msRTCSIP-PrimaryUserAddress,userAccountControl,whenCreated,LastLogonDate,proxyAddresses,msRTCSIP-PrimaryUserAddress,telephoneNumber)
$usuarios = @(Get-ADUser -filter * -Properties SamAccountName,LastLogonDate,Enabled)
$resultado = @($usuarios | Select-Object SamAccountName,LastLogonDate,Enabled)
$resultado = $resultado | Sort "SamAccountName"

<#
$formatacao=
"
<html>
<body>
<style>
BODY{font-family: Calibri; font-size: 10pt;}
TABLE{border: 1px solid black; border-collapse: collapse; font-size: 12pt; text-align:center;margin-left:auto;margin-right:auto; width='1000px';}
TH{border: 1px solid black; background: #F9F9F9; padding: 5px;}
TD{border: 1px solid black; padding: 5px;}
H3{font-family: Calibri; font-size: 10pt;}
</style> 
"
$titulo=
"
<table width='100%' border='0' cellpadding='0' cellspacing='0'>
<tr>
<td bgcolor='#F9F9F9'>
<font face='Calibri' size='10px'>Active Directory - Lista de Usu&aacute;rios</font>
<H3 align='center'>Empresa: $empresa - Dom&iacute;nio: $dominio - Relat&oacute;rio: $data - Respons&aacute;vel: $responsavel</H3>
</td>
</tr>
</table>
</body>
</html>
"

$mensagem = "</table><style>"
$mensagem = $mensagem + "BODY{font-family: Calibri;font-size:20;font-color: #000000}"
$mensagem = $mensagem + "TABLE{margin-left:auto;margin-right:auto;width: 800px;border-width: 1px;border-style: solid;border-color: black;border-collapse: collapse;}"
$mensagem = $mensagem + "TH{border-width: 1px;padding: 0px;border-style: solid;border-color: black;background-color: #F9F9F9;text-align:center;}"
$mensagem = $mensagem + "TD{border-width: 1px;padding: 0px;border-style: solid;border-color: black;text-align:center;}"
$mensagem = $mensagem + "</style>"
$mensagem = $mensagem + "<table width='349px' heigth='400px' align='center'>"
$mensagem = $mensagem + "<tr><td bgcolor='#DDEBF7' height='40'>AUDITORIA</td></tr>"
$mensagem = $mensagem + "<tr><td height='80'>Lista completa de todos os <b>usu&aacute;rios</b> do Active Directory</td></tr>"
$mensagem = $mensagem + "<tr><td bgcolor='#DDEBF7' height='40'>SEGURAN&#199;A DA INFORMA&#199;&#195;O</td></tr>"
$mensagem = $mensagem + "</table>"

$relatorio = $formatacao + $titulo + $tabela

#>

# GERAR ARQUIVO HTML
#$relatorio | Out-File $arquivo -Encoding Utf8


# GERAR ARQUIVO CSV
$resultado | Sort EmployeeID | Export-Csv Users_LastLogon_$data.csv -NoTypeInformation -Encoding Utf8



# MÓDULO

Set-ExecutionPolicy -Scope CurrentUser Unrestricted

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
# $usuarios = @(Get-ADUser -filter * -Properties EmployeeID,givenName,sn,SamAccountName,Title,telephoneNumber,Mail,Enabled,PasswordNeverExpires,ObjectGUID,Office,homeMDB,msRTCSIP-PrimaryUserAddress,userAccountControl,whenCreated,whenChanged,LastLogonDate,proxyAddresses,msRTCSIP-PrimaryUserAddress,telephoneNumber) ' use esses e outros campo quando necessario
$usuarios = @(Get-ADUser -filter * -Properties EmployeeID,givenName,sn,SamAccountName,Title,Department,Mail,Enabled,userAccountControl)
$resultado = @($usuarios | Select-Object EmployeeID,givenName,sn,SamAccountName,Title,Department,Mail,Enabled,userAccountControl)
$resultado = $resultado | Sort "givenName"
#$tabela += $resultado | ConvertTo-Html -Fragment # william, ignore esta linha

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
$resultado | Sort EmployeeID | Export-Csv AD-Report-Routine_$data.csv -NoTypeInformation -Encoding Utf8


# CONFIGURAÇÃO DE E-MAIL

#$de = "con-wgigliozzi@supergasbras.com.br" 
#$senha = "senha"
#$smtp = "smtp.supergasbras.com.br"
#$porta = "587"
#$para = "con-wgigliozzi@supergasbras.com.br"

#$EmailBcc = "admin2@dominio.com.br" #Ative essa opção, caso queira enviar esse e-mail para mais um destinatário.

#$assunto = "Usuarios AD - $data"
#$Body = "RELATÓRIO USUÁRIOS - ACTIVE DIRECTORY:`n
#`n GERADOR: $responsavel `n ASSUNTO: Active Directory `n SERVIDOR: NOME DO SEU SERVIDOR`n DATA: $data `n`n`n DESCRIÇÃO: Digite um texto a ser exibido no corpo do e-mail "

# CONFIGURAÇÃO DE MÚLTIPLOS ANEXOS
#$anexo1 = $arquivo #você pode usar uma variável nesse campo.

#$anexo2 = ad-lista.csv #você pode digitar o nome do arquivo, juntamente com a sua extensão.

#$anexo3 = "U:\ad-lista.csv" #Você pode especificar manualmente o caminho onde o arquivo que será enviado por e-mail, encontra-se. 


# ENVIAR E-MAIL
#$Message = New-Object System.Net.Mail.MailMessage
#$Message.Subject = $assunto
#$Message.Body = $Body
#$Message.IsBodyHtml = $false
#$Message.To.Add( $de.ToLower().Split("\")[1] + "@" + $de.Split("{[@|=]}")[1] )
#$Message.CC.Add($EmailCC)
#$Message.BCC.Add($EmailBcc)
#$Message.From = $de.Replace("=", "@") # For providers that use = instead @ to identify username
#$attachment1 = new-object Net.Mail.Attachment($anexo1)
#$attachment2 = new-object Net.Mail.Attachment($anexo2)
#$message.attachments.add($attachment1)
#$message.attachments.add($attachment2)
#$SMTP = New-Object System.Net.Mail.SmtpClient($SMTPServer, $SMTPPort);
#$SMTP.EnableSSL = $false # Caso você utilize 'Gmail', troque esse variável "$false" por "$true".
#$SMTP.Credentials = New-Object System.Net.NetworkCredential($de, $senha);
#$SMTP.Send($Message)

# FIM
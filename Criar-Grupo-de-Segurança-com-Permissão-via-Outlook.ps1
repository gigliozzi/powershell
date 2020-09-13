
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri http://brtvtms11exc.shvgas.com.br/PowerShell/  -Authentication Kerberos

Import-PSSession $Session

#FALTA INCLUIR O TRECHO DE CÓDIGO QUE FAZ O TESTE

#Criar MailBox (PARA CRIAR CONTAS DE EMAIL PARA QUALQUE USUÁRIO - FUNCIONÁRIO OU TERCEIRO)
$mailBoxNameCreating ="lucas.sabino"
Enable-Mailbox -Identity $mailBoxNameCreating@shvgas.com.br -Alias $mailBoxNameCreating –Database BRRJSHVGASUCKLDB

#Conceder permissão para grupo de permissão (grupo de segurança que permite a configuração via outlook)
$ServiceAccount = "sempregas"
$AccessGroup = "BR_SG_S_MAIL_SEMPREGAS"
Add-MailboxPermission $ServiceAccount@shvgas.com.br -User $AccessGroup -AccessRights FullAccess -InheritanceType All

#Executar o PowerShell como Administrador
 
Set-ExecutionPolicy RemoteSigned

$UserCredential = Get-Credential

shv_wgigliozzi@supergasbras.com.br

#con-wgigliozzi@supergasbras.com.br


$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection

Import-PSSession $Session -DisableNameChecking


#Para validar se ja esta com acesso

Get-Mailbox nobreak_uberlandia

Get-DistributionGroup DL-INFRA-TILOCAL

 

#Após realizar as atividades 

Remove-PSSession $Session


#Exemplo: Foi criada a conta Fabio.Oliveira no AD e atribuido um grupo de Office 365 (Licença F1, E3 ou E5)
#...Aguardar a replicação

#Comando para habilitar a mailbox remota 

$samAccountName = con-mjsilva

#Enable-RemoteMailbox con-mjsilva@supergasbras.com.br -RemoteRoutingAddress con-mjsilva.supergasbras.com.br@shvenergy.mail.onmicrosoft.com

Enable-remotemailbox rannieri.oliveira@supergasbras.com.br -RemoteRoutingAddress rannieri.oliveira.supergasbras.com.br@shvenergy.mail.onmicrosoft.com


#Enable-remotemailbox xxxxxsupergasbras.com.br -RemoteRoutingAddress xxxx.supergasbras.com.br@shvenergy.mail.onmicrosoft.com



Enable-remotemailbox $samAccountName@supergasbras.com.br -RemoteRoutingAddress  $samAccountName".supergasbras.com.br@shvenergy.mail.onmicrosoft.com"
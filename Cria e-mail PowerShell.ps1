# \\\\\\\\\\ CONTA DE E-MAIL ////////////
#First:
#Set-ExecutionPolicy Unrestricted

$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri http://brtvtms11exc.shvgas.com.br/PowerShell/  -Authentication Kerberos
Import-PSSession $Session

#Set-ExecutionPolicy UnrestrictedSet-ExecutionPolicy Unrestricted


#Second:
# \\\\\\\\\\ CRIA��O DE CONTA DE E-MAIL ///////////
$mailBoxNameCreating ="con-andresa.pinto"
Enable-Mailbox -Identity $mailBoxNameCreating@supergasbras.com.br -Alias $mailBoxNameCreating -Database BRRJSHVGASUCAADB


Enable-Mailbox -Identity walbertoni@shvgas.com.br -Alias walbertoni -Database BRRJSHVGASXXXX



# \\\\\\\\\ CONTA DE SERVICO //////////

#create account

$accountNameService="trocadetitularidade"
Enable-Mailbox -Identity $accountNameService@shvgas.com.br -Alias $accountNameService -Database BRRJSHVGASERVICODB

Enable-Mailbox -Identity $accountNameService@shvgas.com.br -Alias $accountNameService -Database BRRJSHVGASERVICODB



$ServiceAccount = "pricing"
Add-MailboxPermission $ServiceAccount@supergasbras.com.br -User BR_SG_S_MAIL-PRICING -AccessRights FullAccess -InheritanceType All



Disable-Mailbox -Identity  _kpmg_pt@shvgas.com.br


##  MOVIMENTA��O E CONSULTA DE DATABASES (NORMAL PROCEDURE)

	# - Execute o comando abaixo para ter privilegios de importar ou exportar PSTs:
				
                New-ManagementRoleAssignment -Role "Mailbox Import Export" -User shvgas.com.br\con-wgigliozzi
				
#Movimentação para Database correta
$mailBoxToMove = "alpsilva"
New-MoveRequest -Identity $mailBoxToMove@shvgas.com.br -TargetDatabase BRRJSHVGASUCDDDB


	
#Consulta
$mailBoxToMove = "alpsilva"
Get-MoveRequestStatistics -Identity $mailBoxToMove@shvgas.com.br
	
	
#Movimentação para Database "DESATIVADO" @@@@@@@@@@@@@@@@@@@@
$nameDisable ="con-jefferson.souza"
New-MoveRequest -Identity $nameDisable@shvgas.com.br -TargetDatabase BRRJSHVGASDESATIVADODB
	
	#Consulta	
	Get-MoveRequestStatistics -Identity adilson.silva@shvgas.com.br
	

## TROUBLESHOOTING

	#Movimentação para Database com limite de 1GB - First solution
	New-MoveRequest -Identity $nameDisable -TargetDatabase "BRRJSHVGASDESATIVADODB" -BadItemLimit "1"
	
	#Movimentação para Database - If not work: go to free quota
	Set-Mailbox -Identity $nameDisable -IssueWarningQuota Unlimited -ProhibitSendQuota unlimited -ProhibitSendReceiveQuota unlimited -UseDatabaseQuotaDefaults $false

	#Run again, this time with permission above
	New-MoveRequest -Identity $nameDisable@shvgas.com.br -TargetDatabase BRRJSHVGASDESATIVADODB

Caso apresente o erro : MapiExceptionShutoffQuotaExceeded

Entrar com o comando :

Set-Mailbox -Identity "con-tsobral" -IssueWarningQuota Unlimited -ProhibitSendQuota unlimited -ProhibitSendReceiveQuota unlimited -UseDatabaseQuotaDefaults $false

	
	#Consulta	
	Get-MoveRequestStatistics -Identity $nameDisable@shvgas.com.br

# End #
	
	
(Após isso para finalizar rodar o seguinte comando no Power Shell)
Remove-PSSession $Session
________________________________________
#INCLUS�O DE GRUPO DE SEGURAN�A NA CONTA DE E-MAIL (permitindo o mapeamento da mesma no Microsoft Exchange.)
#Caixa de email com Grupo de Segurança (Follow this steps)

#1th Step
$accountNameService="sempregas"
Enable-Mailbox -Identity $accountNameService@shvgas.com.br -Alias $accountNameService –Database BRRJSHVGASERVICODB

#2th Step
$ServiceAccount = "sempregas"
$AccessGroup = "BR_SG_S_MAIL_SEMPREGAS"
Add-MailboxPermission $ServiceAccount@shvgas.com.br -User $AccessGroup -AccessRights FullAccess -InheritanceType All

_______________________________

#CRIACAO DE UMA LISTA DE DISTRIBUICAO (Follow this steps)
$DistributionList = "DL-CREDITO-VD"
Enable-DistributionGroup -Identity $DistributionList -Alias $DistributionList -DisplayName $DistributionList -PrimarySMTPAddress $DistributionList@supergasbras.com.br

$DistributionList = "DL-TESTE-GI"
Enable-DistributionGroup -Identity $DistributionList -Alias $DistributionList -DisplayName $DistributionList -PrimarySMTPAddress $DistributionList@supergasbras.com.br

$DistributionList = "DL-TRAFEGO-RCC"
Enable-DistributionGroup -Identity $DistributionList -Alias $DistributionList -DisplayName $DistributionList -PrimarySMTPAddress $DistributionList@supergasbras.com.br



Lista de Distribuição com espaço:
Enable-DistributionGroup -Identity "Informativo_Interface SRCC e SAP ECC" -Alias Informativo_Interface_SRCC_e_SAP_ECC -DisplayName "Informativo_Interface SRCC e SAP ECC" -PrimarySMTPAddress Informativo_Interface_SRCC_e_SAP_ECC@supergasbras.com.br



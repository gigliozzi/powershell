
Import-Module ActiveDirectory

#$Radian = "BR_SG_S_"    #used when security's groups
#$GroupName = $Radian + "SPOOL-CELOG"
#$Description = "Grupo de acesso FULL ao path: " + "\\shvb25200\SPOOL\Celog"

$GroupName = "DL-INFRA-TILOCAL"  #group's name
$SamAccount = $GroupName  #samacount receives the same name group
$DisplayName = "TI LOCAL, Supergasbras do Brasil"
$Description = "Lista de distribuição para equipe de TI da Algar"  #short description
$UnitOrg = "OU=Listas de Distribuicao,OU=Groups,OU=Matriz,DC=shvgas,DC=com,DC=br" #created on right path of domain

#This for security group --> comando abaixo obtido através do facilitador de comandos do PowerShell
#New-ADGroup -GroupScope Global -Name $GroupName -Description $Description -GroupCategory Security -Path $UnitOrg -SamAccountName $SamAccount

#This for distributuion list
New-ADGroup -GroupScope Universal -GroupCategory Distribution -Name $GroupName -Description $Description -DisplayName $DisplayName -ManagedBy malima -Path $UnitOrg -SamAccountName $GroupName

Write-Host "O grupo $GroupName foi criado com sucesso." -ForegroundColor Cyan


$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri http://brtvtms11exc.shvgas.com.br/PowerShell/  -Authentication Kerberos
Import-PSSession $Session


$DistributionList = $GroupName
Enable-DistributionGroup -Identity $DistributionList -Alias $DistributionList -DisplayName $DisplayName -PrimarySMTPAddress $DistributionList@supergasbras.com.br


# ==== CAIXA DE E-MAIL DE SERVIÇO (para múltiplos usuários) ==== #

# 1. Criando a conta de serviço no AD que posteriormente vai receber ser habilitada para receber e-mails
#New-ADUser -Name inovaTI -AccountPassword(Read-Host -AsSecureString "Super2020") -Enabled $true -CannotChangePassword $true -ChangePasswordAtLogon $false -City "Rio de Janeiro" -Country "Brasil" -Department "Sd - Supervisao" -DisplayName "Inova TI" -Manager gsoliveira -PasswordNeverExpires $true -Path "OU=Usuarios de Servico,OU=Matriz,DC=shvgas,DC=com,DC=br" -SamAccountName inovaTI -UserPrincipalName inovaTI
New-ADUser -Name "PRICING" -AccountPassword(Read-Host -AsSecureString "Super2020") -Enabled $true -CannotChangePassword $true -ChangePasswordAtLogon $false -PasswordNeverExpires $true -Path "OU=Usuarios de Servico,OU=Matriz,DC=shvgas,DC=com,DC=br" -SamAccountName "PRICING" -UserPrincipalName "PRICING"


# 2. Habilitando a conta para receber e-mail
$accountNameService="PRICING"
Enable-Mailbox -Identity $accountNameService@shvgas.com.br -Alias $accountNameService –Database BRRJSHVGASERVICODB


# 3. Criando o grupo que permite a configuração através de OA pelo outlook
$GroupName = "BR_SG_S_MAIL_INOVATI"
$OU = "OU=Groups,OU=Matriz,DC=shvgas,DC=com,DC=br"
New-ADGroup -GroupScope Global -GroupCategory Security -Name $GroupName -Description "Permissão para a caixa inovaTI@" -ManagedBy gsoliveira -Path $OU -SamAccountName $GroupName
# Depois disso, setar a caixa de para o responsável poder incluir pessoas


# 4. Associando o GRUPO ao e-mail e permintindo a inclusão de usuários nesse grupo
$ServiceAccount = "inovaTI"
$GroupName = "BR_SG_S_MAIL_INOVATI"
Add-MailboxPermission $ServiceAccount@shvgas.com.br -User $GroupName -AccessRights FullAccess -InheritanceType All

# 5. Incluindo o grupo recem-criado no Security Group
#por hora o processo é manual

# 6. Incluindo usuários no grupo de permissão da Caixa
Add-ADGroupMember -Identity BR_SG_S_MAIL_INOVATI -Members SQL01,SQL02

Import-Module ActiveDirectory

$Radian = "BR_SG_S_"    #used when security's groups
$GroupName = $Radian + "SPOOL-CELOG" #input group name
$Description = "Grupo de acesso FULL ao path: " + "\\shvb25200\SPOOL\Celog"
$GroupName = "DL-TRAFEGO-RCC"  #group's name
$SamAccount = $GroupName  #samacount receives the same name of group
$Description = "Lista de distribuição do Tráfego RCC"  #short description
$UnitOrgList = "OU=Listas de Distribuicao,OU=Groups,OU=Matriz,DC=shvgas,DC=com,DC=br" #created on right path of domain
$OU = "OU=Listas de Distribuicao,OU=Groups,OU=Matriz,DC=shvgas,DC=com,DC=br" #created on right path of domain

#This for security group
#New-ADGroup -GroupScope Global -Name $GroupName -Description $Description -GroupCategory Security -Path $UnitOrg -SamAccountName $SamAccount

#This for distributuion list
New-ADGroup -GroupScope Universal -Name $GroupName -Description $Description -DisplayName $GroupName -GroupCategory Distribution -ManagedBy mcaetano -Path $UnitOrg -SamAccountName $GroupName

Write-Host "O grupo $GroupName foi criado com sucesso." -ForegroundColor Cyan


$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri http://brtvtms11exc.shvgas.com.br/PowerShell/  -Authentication Kerberos

Import-PSSession $Session

$DistributionList = "DL-TRAFEGO-RCC"
Enable-DistributionGroup -Identity $DistributionList -Alias $DistributionList -DisplayName $DistributionList -PrimarySMTPAddress $DistributionList@supergasbras.com.br



### Criando CAIXA DE EMAIL/USUÁRIO DE SERVICO para multíplos usuários poderem enviar e receber através dela


# 1. Criando a name de serviço no AD que posteriormente vai receber ser habilitada para receber e-mails

    $name = "trocadetitularidade"
    $displayName = "Troca de Titularidade"
    $manager = "clbarbosa"
    $department = "Atend. Clientes - Supervisao_A"
    $path = "OU=Usuarios de Servico,OU=Matriz,DC=shvgas,DC=com,DC=br"
    $passwd = "super12345678"

New-ADUser -Name $name -DisplayName "Troca de Titularidade" -PasswordNeverExpires $true -Path $path -SamAccountName $name -UserPrincipalName $name

#$$$$ A conta foi criada com esse comando mas nasce desabilitada e precisa setar uma senha inicial

#New-ADUser -Name $name -CannotChangePassword $true -ChangePasswordAtLogon $false -City "Rio de Janeiro" -Country Brasil -Department "Atend. Clientes - Supervisao_A" -DisplayName "Troca de Titularidade" -Manager clbarbosa -PasswordNeverExpires $true -Path $path -SamAccountName $name -UserPrincipalName $name


# 2. Habilitando a name para receber e-mail

Enable-Mailbox -Identity $name@shvgas.com.br -Alias $name –Database BRRJSHVGASERVICODB


# 3. Criando o grupo que permite a configuração através de OA pelo outlook


New-ADGroup -GroupScope Global -Name "BR_SG_S_MAIL_TROCADETITULARIDADE" -Description "Concede permissão à MailBox trocadetitularidade@supergasbras.com.br" -GroupCategory Security -ManagedBy clbarbosa -Path "OU=Groups,OU=Matriz,DC=shvgas,DC=com,DC=br" -SamAccountName BR_SG_S_MAIL_TROCADETITULARIDADE

# 4. Associando o grupo de segurança e habiltando o mapeamento atráves do Microsoft Outlook; permite também que o gerente do grupos possa incluir ou remover usuários da caixa de email;
$ServiceAccount = "trocadetitularidade" #ainda precisa editar o comando abaixo
$AccessGroup = "BR_SG_S_MAIL_TROCADETITULARIDADE"

Add-MailboxPermission $ServiceAccount@supergasbras.com.br -User $AccessGroup -AccessRights FullAccess -InheritanceType All



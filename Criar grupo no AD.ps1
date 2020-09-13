
Import-Module ActiveDirectory

#$Radian = "BR_SG_S_"
#$GroupName = $Radian + "SPOOL-CELOG"
$GroupName = "BR_SG_S_MAIL-SELECAO-MAUA"
$SamAccount = $GroupName
#$Description = "Grupo de acesso FULL ao path: " + "\\shvb25200\SPOOL\Celog"
$Description = "Grupo que concede acesso ao e-mail"
$UnitOrg = "OU=Groups,OU=Matriz,DC=shvgas,DC=com,DC=br"



New-ADGroup -GroupScope Global -Name $GroupName -Description $Description -GroupCategory Security -Path $UnitOrg -SamAccountName $SamAccount

Write-Output "O grupo $GroupName foi criado com sucesso."



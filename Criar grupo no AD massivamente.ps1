
Import-Module ActiveDirectory

#$Radian = "BR_SG_S_"
#$GroupName = $Radian + "SPOOL-CELOG"
#$GroupName = "BR_SG_S_MAIL-SELECAO-MAUA"
#$SamAccount = $GroupName
#$Description = "Grupo de acesso FULL ao path: " + "\\shvb25200\SPOOL\Celog"
#$Description = "Grupo que concede acesso ao e-mail"
$UnitOrg = "OU=Groups,OU=Matriz,DC=shvgas,DC=com,DC=br"

$path = "C:\Users\con-wgigliozzi\Desktop\Organizar\Power Shell Scripts\fonte-de-dados\DL-Celog-desabilitar.csv"

Import-Csv $path | ForEach-Object {

    $groupName = $_.”groupName”

    $SamAccount = $GroupName

    $group

    #New-ADGroup -GroupScope Global -Name $groupName -Description $Description -GroupCategory Security -Path $UnitOrg -SamAccountName $SamAccount

    #CRIAÇÃO
    New-ADGroup -GroupScope Global -Name $groupName -Description $Description -GroupCategory Security -Path $UnitOrg -SamAccountName $SamAccount

    Write-Host "O grupo $GroupName foi criado com sucesso." -ForegroundColor Cyan

}


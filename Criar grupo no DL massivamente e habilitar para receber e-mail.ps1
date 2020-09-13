
Import-Module ActiveDirectory

#$Radian = "BR_SG_S_"
#$GroupName = $Radian + "SPOOL-CELOG"
#$GroupName = "BR_SG_S_MAIL-SELECAO-MAUA"
#$SamAccount = $GroupName
#$Description = "Grupo de acesso FULL ao path: " + "\\shvb25200\SPOOL\Celog"
#$Description = "Grupo que concede acesso ao e-mail"
$UnitOrg = "OU=Groups,OU=Matriz,DC=shvgas,DC=com,DC=br"


$path = "C:\Users\con-wgigliozzi\Desktop\Organizar\Power Shell Scripts\fonte-de-dados\grupos-que-se-tornaram-DLs.csv"

Import-Csv $path | ForEach-Object {

    #$groupName = $_.”groupName”

    $groupName = "DL_SGB_CELOG_1132" ### fiz avulso para terminar, depois não esquece de arrumar, senão vai se perder

    $SamAccount = $groupName

    New-ADGroup -GroupScope Universal -Name $groupName -GroupCategory Distribution -SamAccountName $SamAccount

    #Write-Host "O grupo $GroupName foi convertido em Distributin List com sucesso." -ForegroundColor Cyan

    #sleep -Seconds 5
  
    # enable newly created group
    $DistributionList = $groupName    
    Enable-DistributionGroup -Identity $DistributionList -Alias $DistributionList  -PrimarySMTPAddress $DistributionList@supergasbras.com.br

    Write-Host "Hablitado $DistributionList@@supergasbras.com.br" -ForegroundColor Cyan

}


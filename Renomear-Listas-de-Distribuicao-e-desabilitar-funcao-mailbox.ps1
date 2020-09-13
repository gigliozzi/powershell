Import-Module ActiveDirectory


Rename-ADObject -Identity "BR_SG_S_WISEIT-MONITORIA-CELOG-1011" -NewName "DL_SGB_CELOG_1011"

#Testando...acho que isso é o 3º passo (Aqui é o NAME)
Get-ADGroup -identity “DL_SGB_CELOG_1011” | %{set-adgroup -samaccountname “DL_SGB_CELOG_1011”; $_ | rename-adobject -newname DL_SGB_CELOG_1011 }


#Funcionou (mudando apenas alguns atributos no AD, ex: SamAccount, etc)
Set-ADGroup -Identity BR_SG_S_WISEIT-MONITORIA-CELOG-1011 -Description DL_SGB_CELOG_1011 -DisplayName DL_SGB_CELOG_1011 -SamAccountName DL_SGB_CELOG_1011

#Funcionou (Desabilita o grupo como Distribution List - DL)
Disable-DistributionGroup -Identity DL_SGB_CELOG_1011

#teste para ver pára de pedir confirmação
Rename-ADObject -Identity BR_SG_S_WISEIT-MONITORIA-CELOG-1012 -NewName DL_SGB_CELOG_1012

#==========================

#Feito de forma avulsa funcionou
#Falta testar se funciona com via script (devido ao delay que pode haver na propagação)
#Falta o 4º PASSO: habilitar novamente a DL via script (devido ao delay que pode haver na propagação)

#(1o passo) Funcionou a mudança do "NAME"
Get-ADGroup BR_SG_S_WISEIT-MONITORIA-CELOG-1012 | Rename-ADObject -NewName DL_SGB_CELOG_1012

$novoNome = "DL_SGB_CELOG_1012"

#(2o PASSO) Funcionou  (mudando apenas alguns atributos no AD, ex: SamAccount, etc)
Set-ADGroup -Identity BR_SG_S_WISEIT-MONITORIA-CELOG-1012 -Description $novoNome -DisplayName $novoNome -SamAccountName $novoNome

#(3o PASSO) Funcionou  (Desabilita o grupo como Distribution List - DL)
Disable-DistributionGroup -Identity $novoNome -Confirm:$false



#(4o PASSO)
Enable-DistributionGroup -Identity $novoNome -Alias $novoNome -PrimarySMTPAddress $novoNome@supergasbras.com.br



#=========== EXCECUÇÃO FRACIONADA =================
#Foi necessário devido ao delay


#=============== 1o PRIMEIRO DESABILITAR DL'S =========================


Import-Module ActiveDirectory


$path = "C:\Users\con-wgigliozzi\Desktop\Organizar\Power Shell Scripts\fonte-de-dados\DL-Celog-desabilitar.csv"

Import-Csv $path -Delimiter ';' | ForEach-Object {

    $groupName = $_.”groupName”
        
    Disable-DistributionGroup -Identity $GroupName -Confirm:$false

    Write-Host "O grupo $GroupName foi criado com sucesso." -ForegroundColor DarkMagenta

}


#======================= 2o SEGUNDO RENAME SAM, DESCRIPTION, DISPLAYNAME ======================

Import-Module ActiveDirectory

$path = "C:\Users\con-wgigliozzi\Desktop\Organizar\Power Shell Scripts\fonte-de-dados\rename-celog-grupos.csv"

Import-Csv $path -Delimiter ';' | ForEach-Object {

    $antigoNome = $_.”antigoNome”

    $novoNome = $_.”novoNome”
        
    Set-ADGroup -Identity $antigoNome -Description $novoNome -DisplayName $novoNome -SamAccountName $novoNome

    Write-Host "O grupo $antigoNome foi alterado para $novoNome ." -ForegroundColor Cyan

}


#===================== 3o TERCEIRO CHANGE "NAME"
# Não posso esquecer que leva um tempo para replicação !!!!!!!!!!


$path = "C:\Users\con-wgigliozzi\Desktop\Organizar\Power Shell Scripts\fonte-de-dados\rename-celog-grupos.csv"

Import-Csv $path -Delimiter ';' | ForEach-Object {

    $antigoNome = $_.”antigoNome”

    $novoNome = $_.”novoNome”
        
    Get-ADGroup $novoNome | Rename-ADObject -NewName $novoNome

    Write-Host "O grupo $antigoNome foi alterado para $novoNome ;) " -ForegroundColor Cyan

}


#===================== 4o HABILITAR A DISTRIBUTION LIST "
# Não posso esquecer que leva um tempo para replicação !!!!!!!!!!

#cuidado que as vezes vc mesmo muda o arquivo para diferentes propósitos
$path = "C:\Users\con-wgigliozzi\Desktop\Organizar\Power Shell Scripts\fonte-de-dados\rename-celog-grupos.csv"

Import-Csv $path -Delimiter ';' | ForEach-Object {

    $antigoNome = $_.”antigoNome”

    $novoNome = $_.”novoNome”
        
    Enable-DistributionGroup -Identity $novoNome -Alias $novoNome -PrimarySMTPAddress $novoNome@supergasbras.com.br

    Write-Host "A DL $novoNome foi habilitada para recebimento de e-mails :) " -ForegroundColor Cyan

}
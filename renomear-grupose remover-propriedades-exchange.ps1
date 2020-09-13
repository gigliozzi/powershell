Import-Module ActiveDirectory


Rename-ADObject -Identity "BR_SG_S_WISEIT-MONITORIA-CELOG-1011" -NewName "DL_SGB_CELOG_1011"

#Testando...acho que isso é o 3º passo
Get-ADGroup -identity “DL_SGB_CELOG_1011” | %{set-adgroup -samaccountname “DL_SGB_CELOG_1011”; $_ | rename-adobject -newname DL_SGB_CELOG_1011 }


#Funcionou
Set-ADGroup -Identity BR_SG_S_WISEIT-MONITORIA-CELOG-1011 -Description DL_SGB_CELOG_1011 -DisplayName DL_SGB_CELOG_1011 -SamAccountName DL_SGB_CELOG_1011

#Funcionou
Disable-DistributionGroup -Identity DL_SGB_CELOG_1011
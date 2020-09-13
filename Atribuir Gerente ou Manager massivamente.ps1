# Description: Corrige os atributos do Exchange e movimenta para a database correta
# Author: Gigliozzi, W. (William)
# Created in:  15.06.2020
# Improved in: 

#Script faz atribuição massiva de gerente para cada usuário no arquivo via samAccountName
#Neste script o gerente não está no arquivo, mas poderia estar. Como neste momento quero atribuir apenas 4 usuários, 
#não foi necessário um source muito elaborado

Import-Module ActiveDirectory

$path = “C:\Users\con-wgigliozzi\Desktop\Organizar\Power Shell Scripts\fonte-de-dados\set-manager-massive.csv”

Import-Csv $path -Delimiter ";" | ForEach-Object {

    $samAccountName = $_.”samAccountName”
    
    Set-ADUser -Identity $samAccountName -Manager nomeGerente

    Write-Host "O gerente arcorrea foi associado ao login $samAccountName" -ForegroundColor Cyan
}
            
      



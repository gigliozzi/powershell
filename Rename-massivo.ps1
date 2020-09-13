Import-Module ActiveDirectory

$path = "C:\Users\con-wgigliozzi\Desktop\Organizar\Power Shell Scripts\fonte-de-dados\rename-celog-grupos.csv"

Import-Csv $path -Delimiter ';' | ForEach-Object {

    $antigoNome = $_.”antigoNome”

    $novoNome = $_.”novoNome”
        
    Set-ADGroup -Identity $antigoNome -Description $novoNome -DisplayName $novoNome -SamAccountName $novoNome

    Write-Host "O grupo $antigoNome foi alterado para $novoNome ." -ForegroundColor Cyan

}
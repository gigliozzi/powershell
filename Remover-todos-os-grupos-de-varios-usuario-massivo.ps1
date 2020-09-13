Import-Module ActiveDirectory

$path = "C:\Users\con-wgigliozzi\Desktop\Organizar\Power Shell Scripts\fonte-de-dados\remocao-de-todos-grupos.csv"

Import-Csv $path | ForEach-Object {

$samAccountName = $_.”samAccountName”

    #avulso
    #$samAccountName = "ffaria"

    Get-ADUser -Identity $samAccountName -Properties MemberOf | ForEach-Object {
      $_.MemberOf | Remove-ADGroupMember -Members $_.DistinguishedName -Confirm:$false
    }

     Write-Host "O login $samAccountName teve todos os seus grupos removidos" -ForegroundColor Cyan 
}

Import-Module ActiveDirectory

$path = "C:\Users\con-wgigliozzi\Desktop\Organizar\Power Shell Scripts\results"


Get-ADGroup -Server shvgas.com.br -Filter * | Select @{N=”Nome do Grupo”;E={$_.Name}} | Export-csv $path\GuposAD.csv
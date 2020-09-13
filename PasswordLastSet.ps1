
Import-Module ActiveDirectory
$data = Get-Date -format "dd.MM.yyyy 'at' HH¨mm¨ss"
$path = "C:\Users\con-wgigliozzi\Desktop\Organizar\Power Shell Scripts\results\passwordLastSet'$data'.csv"


Get-ADUser -filter * -properties passwordlastset, passwordneverexpires | sort-object SamAccountName | select-object SamAccountName, passwordlastset, passwordneverexpires, Enable | Export-csv -path $path
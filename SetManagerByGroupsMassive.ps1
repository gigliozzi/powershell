Import-Module ActiveDirectory

$path = “C:\Users\con-wgigliozzi\Desktop\Organizar\Power Shell Scripts\ManagerGroups.csv”

Import-Csv $path | ForEach-Object {

    #Write-Output "O grupo"$_.GroupName"sera gerenciado por" $_.SamAccountName "`n"
    
    Set-ADGroup -Identity $_.GroupName -ManagedBy $_.SamAccountName
}
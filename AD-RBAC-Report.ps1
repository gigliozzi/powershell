
Import-Module ActiveDirectory
$data = Get-Date -format "dd.MM.yyyy 'at' HH¨mm¨ss"
$path = "C:\Users\con-wgigliozzi\Desktop\Organizar\Power Shell Scripts\results"
cd $path

$date1 = "20200501000000.0Z" # A PARTIR DE 
$date2 = "20200531000000.0Z" # ATÉ A DATA x

#(&(&(objectCategory=User)(WhenCreated>=20200301000000.0Z)(WhenCreated<=20200331000000.0Z)))

#Get-ADUser -Filter {Enabled -eq $True} -Property Created,LastLogonDate | Select-Object -Property EmployeeID,givenName,sn,SAMAccountName,Created,LastLogonDate | Export-Csv AD-RBAC-Report_$data.csv

#Get-ADUser -Filter {Created -gt $date1 -and Created -le $date2} -Property Created | Select-Object EmployeeID,givenName,sn,SamAccountName,Title,Department,Office,Enabled,Created | Export-Csv AD-RBAC-GENERICS.csv

Get-ADUser -Filter {Created -gt $date1 -and Created -le $date2} -Property Created | Select-Object EmployeeID,givenName,sn,SamAccountName,Title,Department,Office,Enabled,Created | Export-Csv AD-RBAC-GENERICS_$data.csv


#obtem o SamAccountName do Gestor cadastrado no AD
#(Get-ADUser (Get-ADUser $userId -Properties manager).manager -Properties SamAccountName).SamAccountName
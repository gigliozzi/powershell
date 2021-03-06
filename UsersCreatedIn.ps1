

# MÓDULO
Import-Module ActiveDirectory


$path = "C:\Users\con-wgigliozzi\Desktop\Power Shell Scripts\results"

cd $path

$Start = Get-Date -Day 12 -Month 07 -Year 2019 -Hour 00
$End = Get-Date -Day 13 -Month 07 -Year 2019 -Hour 18 -Minute 59
$resultado = Get-ADUser -Filter * -Properties SamAccountName, whenCreated | ? { ($_.whenCreated -gt $Start) -and ($_.whenCreated -le $End) } | Format-Table SamAccountName,WhenCreated -Autosize -Wrap

$resultado | Export-Csv UsersCreatedIn-20190712.csv -NoTypeInformation -Encoding Utf8
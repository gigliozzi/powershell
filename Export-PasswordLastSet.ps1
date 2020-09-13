
#Script extrai password last set

prazo de seha 45dd


Get-ADUser -Filter * -Properties passwordlastset, passwordneverexpires | Select-Object samaccountname, passwordlastset, passwordneverexpires | Export-Csv XIpassword.csv -NoTypeInformation -Encoding Utf8
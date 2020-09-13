Import-Module ActiveDirectory

$path = "C:\Users\con-wgigliozzi\Desktop\Organizar\Power Shell Scripts\results"

cd $path

$OUpath = 'OU=Users,OU=T-SYSTEMS,DC=shvgas,DC=com,DC=br'

Get-ADUser -Filter * -SearchBase $OUpath | Select-object Name,SamAccountName,DistinguishedName | Export-Csv OU-Users.csv -NoTypeInformation -Encoding Utf8


# Esse script exporta os usuários de uma OU específica, neste caso definida na variável $OUpath

<# OUTPUT

Name	              SamAccountName   	DistinguishedName
Amit Raingh Goswami	  CON-AGOSWAMI	    CN=Amit Raingh Goswami,OU=Users,OU=T-SYSTEMS,DC=shvgas,DC=com,DC=br


#>
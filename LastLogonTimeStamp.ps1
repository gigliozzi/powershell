$path = "C:\Users\con-wgigliozzi\Desktop\Organizar\Power Shell Scripts\results"

cd $path

Get-ADUser -Filter * -ResultPageSize 0 -Prop CN,lastLogonTimestamp | Select CN,@{n="lastLogonDate";e={[datetime]::FromFileTime($_.lastLogonTimestamp)}} | Export-CSV -NoType last.csv
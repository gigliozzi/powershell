# MÓDULO

Import-Module ActiveDirectory

$path = "C:\Users\con-wgigliozzi\Desktop\Organizar\Power Shell Scripts\results"

$path1 = "C:\Users\con-wgigliozzi\Desktop\Organizar\Power Shell Scripts\results\proxyAddresses.csv"


<# cd $path

Get-ADUser -Filter * -Properties proxyaddresses | Select-Object Name | Export-Csv ";" -Path $path1 -NoTypeInformation -Encoding Utf8

# Get-ADUser -Identity con-wgigliozzi -Properties proxyaddresses | select proxy*  #>

Get-ADUser -Filter * -Properties proxyaddresses | select SamAccountName, @{L='ProxyAddress_1'; E={$_.proxyaddresses[0]}}, @{L='ProxyAddress_2’;E={$_.ProxyAddresses[1]}} |

Export-Csv -Path $path1 -NoTypeInformation




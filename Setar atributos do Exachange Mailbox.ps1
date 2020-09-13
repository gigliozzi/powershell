Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

Set-ExecutionPolicy Unrestricted

$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri http://brtvtms11exc.shvgas.com.br/PowerShell/  -Authentication Kerberos

Import-PSSession $Session


#$sam = New-Object Windows.Forms.TextBox

$sam = "zelandia.freire"

Set-Mailbox -EmailAddressPolicyEnabled $true -Identity $sam -MaxReceiveSize unlimited -MaxSendSize unlimited
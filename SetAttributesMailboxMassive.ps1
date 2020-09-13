# Description: Corrige os atributos do Exchange
# Author: Gigliozzi, W. (William)
# Date: 09.12.2019


### CHECK SERVER ###

 If ( $Session.State -eq "Opened" ){
        Write-Host "Status_session: open" -Foregroundcolor green
                
    } else {

        $Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri http://brtvtms11exc.shvgas.com.br/PowerShell/  -Authentication Kerberos

        Import-PSSession $Session
}

$path = “C:\Users\con-wgigliozzi\Desktop\Organizar\Power Shell Scripts\fonte-de-dados\charge10012020.csv”

Import-Csv $path | ForEach-Object {

$sam = $_.”samaccountname”

    Set-Mailbox -EmailAddressPolicyEnabled $true -Identity $sam -MaxReceiveSize unlimited -MaxSendSize unlimited

    Write-Output "`nAtributos da conta $sam setados com sucesso."

    Start-Sleep -Seconds 5
}
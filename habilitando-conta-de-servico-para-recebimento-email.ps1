if ( $Session.State -eq "Opened" ){
        
        #Write-Output "Status_session: open" `n

        Write-Host -foregroundcolor green "Status_session: open`n"

        #Set-Mailbox -EmailAddressPolicyEnabled $true -Identity $sam -MaxReceiveSize unlimited -MaxSendSize unlimited

        #Write-Output "`nAtributos da conta $sam setados com sucesso."

        
} else {

        Write-Output "not-open-session"
        
        Set-ExecutionPolicy Unrestricted  

        $Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri http://brtvtms11exc.shvgas.com.br/PowerShell/  -Authentication Kerberos

        Import-PSSession $Session

        #Set-Mailbox -EmailAddressPolicyEnabled $true -Identity $sam -MaxReceiveSize unlimited -MaxSendSize unlimited

        #Write-Output "`nAtributos da conta $sam setados com sucesso."
        }

        #>

#CRIAÇÃO DE UMA LISTA DE DISTRIBUIÇÃO (Follow this steps)
$DistributionList = "Gestores_Unidade_Canoas"
Enable-DistributionGroup -Identity $DistributionList -Alias $DistributionList -DisplayName $DistributionList -PrimarySMTPAddress $DistributionList@supergasbras.com.br
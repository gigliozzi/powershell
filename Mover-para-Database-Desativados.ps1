# CHECK CONNECTION SERVER

if ( $Session.State -eq "Opened" ){
        
        Write-Host "Status_session: open" -ForegroundColor Green

        #Set-Mailbox -EmailAddressPolicyEnabled $true -Identity $sam -MaxReceiveSize unlimited -MaxSendSize unlimited

        #Write-Output "`nAtributos da conta $sam setados com sucesso."

        
} else {

        Write-Host "not-open-session" -ForegroundColor Red

        Write-Host "opening now ..." -ForegroundColor Cyan
        
        #Set-ExecutionPolicy Unrestricted  

        $Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri http://brtvtms11exc.shvgas.com.br/PowerShell/  -Authentication Kerberos

        Import-PSSession $Session

        #Remove-PSSession $Session

        }


New-MoveRequest -Identity con-mjsilva -TargetDatabase BRRJSHVGASUCMMDB -BadItemLimit "1"

Set-Mailbox -Identity con-mjsilva -IssueWarningQuota Unlimited -ProhibitSendQuota unlimited -ProhibitSendReceiveQuota unlimited -UseDatabaseQuotaDefaults $false
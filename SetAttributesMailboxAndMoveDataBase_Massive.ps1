# Description: Corrige os atributos do Exchange e movimenta para a database correta
# Author: Gigliozzi, W. (William)
# Contact: gigliozzi@gmail.com
# Created in:  09.12.2019
# Improved in: 03.01.2020

#common databases
$data_AA = "BRRJSHVGASUCAADB"
$data_BB = "BRRJSHVGASUCBBDB"
$data_CC = "BRRJSHVGASUCCCDB"
$data_DD = "BRRJSHVGASUCDDDB"
$data_EE = "BRRJSHVGASUCEEDB"
$data_FF = "BRRJSHVGASUCFFDB"
$data_GH = "BRRJSHVGASUCGHDB"
$data_II = "BRRJSHVGASUCIIDB"
$data_JJ = "BRRJSHVGASUCJJDB"
$data_KL = "BRRJSHVGASUCKLDB"
$data_MM = "BRRJSHVGASUCMMDB"
$data_NQ = "BRRJSHVGASUCNQDB"
$data_RR = "BRRJSHVGASUCRRDB"
$data_SS = "BRRJSHVGASUCSSDB"
$data_TU = "BRRJSHVGASUCTUDB"
$data_VZ = "BRRJSHVGASUCVZDB"

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

        #Set-Mailbox -EmailAddressPolicyEnabled $true -Identity $sam -MaxReceiveSize unlimited -MaxSendSize unlimited

        #Write-Output "`nAtributos da conta $sam setados com sucesso."
        }

        

#CHARGE FILE #There is two ways to charge data: import or inline

$path = “C:\Users\con-wgigliozzi\Desktop\Organizar\Power Shell Scripts\fonte-de-dados\move-today.csv”

#$path = @("con-thiago.paz")

Import-Csv $path | ForEach-Object { # o erro era as variaveis: chamei de $sam e depois chamei $login ':( '

    $sam = $_.samaccountname
    
    if ( $sam.Substring(0,4) -eq "con-" ) {

        Set-Mailbox -EmailAddressPolicyEnabled $true -Identity $sam -MaxReceiveSize unlimited -MaxSendSize unlimited

        Write-Host "`nAtributos da conta $sam setados com sucesso." -ForegroundColor Cyan

        $primeira_letra = $sam.Substring(4,1)

        Start-Sleep -Seconds 2
        
    Switch ($primeira_letra) {
        
        'a' { New-MoveRequest -Identity $sam -TargetDatabase $data_AA; "`nConta $sam movimentada para $data_AA."; break }
        'b' { New-MoveRequest -Identity $sam -TargetDatabase $data_BB; "`nConta $sam movimentada para $data_BB."; break }
        'c' { New-MoveRequest -Identity $sam -TargetDatabase $data_CC; "`nConta $sam movimentada para $data_CC."; break }
        'd' { New-MoveRequest -Identity $sam -TargetDatabase $data_DD; "`nConta $sam movimentada para $data_DD."; break }
        'e' { New-MoveRequest -Identity $sam -TargetDatabase $data_EE; "`nConta $sam movimentada para $data_EE."; break }
        'f' { New-MoveRequest -Identity $sam -TargetDatabase $data_FF; "`nConta $sam movimentada para $data_FF."; break }
        'g' { New-MoveRequest -Identity $sam -TargetDatabase $data_GH; "`nConta $sam movimentada para $data_GH."; break }
        'h' { New-MoveRequest -Identity $sam -TargetDatabase $data_GH; "`nConta $sam movimentada para $data_GH."; break }
        'i' { New-MoveRequest -Identity $sam -TargetDatabase $data_II; "`nConta $sam movimentada para $data_II."; break }
        'j' { New-MoveRequest -Identity $sam -TargetDatabase $data_JJ; "`nConta $sam movimentada para $data_JJ."; break }
        'k' { New-MoveRequest -Identity $sam -TargetDatabase $data_KL; "`nConta $sam movimentada para $data_KL."; break }
        'l' { New-MoveRequest -Identity $sam -TargetDatabase $data_KL; "`nConta $sam movimentada para $data_KL."; break }
        'm' { New-MoveRequest -Identity $sam -TargetDatabase $data_MM; "`nConta $sam movimentada para $data_MM."; break }
        'n' { New-MoveRequest -Identity $sam -TargetDatabase $data_NQ; "`nConta $sam movimentada para $data_NQ."; break }
        'o' { New-MoveRequest -Identity $sam -TargetDatabase $data_NQ; "`nConta $sam movimentada para $data_NQ."; break }
        'q' { New-MoveRequest -Identity $sam -TargetDatabase $data_NQ; "`nConta $sam movimentada para $data_NQ."; break }
        'r' { New-MoveRequest -Identity $sam -TargetDatabase $data_RR; "`nConta $sam movimentada para $data_RR."; break }
        's' { New-MoveRequest -Identity $sam -TargetDatabase $data_SS; "`nConta $sam movimentada para $data_SS."; break }
        't' { New-MoveRequest -Identity $sam -TargetDatabase $data_TU; "`nConta $sam movimentada para $data_TU."; break }
        'u' { New-MoveRequest -Identity $sam -TargetDatabase $data_TU; "`nConta $sam movimentada para $data_TU."; break }
        'v' { New-MoveRequest -Identity $sam -TargetDatabase $data_VZ; "`nConta $sam movimentada para $data_VZ."; break }
        'x' { New-MoveRequest -Identity $sam -TargetDatabase $data_VZ; "`nConta $sam movimentada para $data_VZ."; break }
        'z' { New-MoveRequest -Identity $sam -TargetDatabase $data_VZ; "`nConta $sam movimentada para $data_VZ."; break }
        default {"Conta Nao movimentada"; break}        
    } 


    } else {

        Set-Mailbox -EmailAddressPolicyEnabled $true -Identity $sam -MaxReceiveSize unlimited -MaxSendSize unlimited

        Write-Host "`nAtributos da conta $sam setados com sucesso." -ForegroundColor Cyan
        
        $primeira_letra = $sam.Substring(0,1)

        Start-Sleep -Seconds 2

        Switch ($primeira_letra) {
        
        'a' { New-MoveRequest -Identity $sam -TargetDatabase $data_AA; "`nConta $sam movimentada para $data_AA."; break }
        'b' { New-MoveRequest -Identity $sam -TargetDatabase $data_BB; "`nConta $sam movimentada para $data_BB."; break }
        'c' { New-MoveRequest -Identity $sam -TargetDatabase $data_CC; "`nConta $sam movimentada para $data_CC."; break }
        'd' { New-MoveRequest -Identity $sam -TargetDatabase $data_DD; "`nConta $sam movimentada para $data_DD."; break }
        'e' { New-MoveRequest -Identity $sam -TargetDatabase $data_EE; "`nConta $sam movimentada para $data_EE."; break }
        'f' { New-MoveRequest -Identity $sam -TargetDatabase $data_FF; "`nConta $sam movimentada para $data_FF."; break }
        'g' { New-MoveRequest -Identity $sam -TargetDatabase $data_GH; "`nConta $sam movimentada para $data_GH."; break }
        'h' { New-MoveRequest -Identity $sam -TargetDatabase $data_GH; "`nConta $sam movimentada para $data_GH."; break }
        'i' { New-MoveRequest -Identity $sam -TargetDatabase $data_II; "`nConta $sam movimentada para $data_II."; break }
        'j' { New-MoveRequest -Identity $sam -TargetDatabase $data_JJ; "`nConta $sam movimentada para $data_JJ."; break }
        'k' { New-MoveRequest -Identity $sam -TargetDatabase $data_KL; "`nConta $sam movimentada para $data_KL."; break }
        'l' { New-MoveRequest -Identity $sam -TargetDatabase $data_KL; "`nConta $sam movimentada para $data_KL."; break }
        'm' { New-MoveRequest -Identity $sam -TargetDatabase $data_MM; "`nConta $sam movimentada para $data_MM."; break }
        'n' { New-MoveRequest -Identity $sam -TargetDatabase $data_NQ; "`nConta $sam movimentada para $data_NQ."; break }
        'o' { New-MoveRequest -Identity $sam -TargetDatabase $data_NQ; "`nConta $sam movimentada para $data_NQ."; break }
        'q' { New-MoveRequest -Identity $sam -TargetDatabase $data_NQ; "`nConta $sam movimentada para $data_NQ."; break }
        'r' { New-MoveRequest -Identity $sam -TargetDatabase $data_RR; "`nConta $sam movimentada para $data_RR."; break }
        's' { New-MoveRequest -Identity $sam -TargetDatabase $data_SS; "`nConta $sam movimentada para $data_SS."; break }
        't' { New-MoveRequest -Identity $sam -TargetDatabase $data_TU; "`nConta $sam movimentada para $data_TU."; break }
        'u' { New-MoveRequest -Identity $sam -TargetDatabase $data_TU; "`nConta $sam movimentada para $data_TU."; break }
        'v' { New-MoveRequest -Identity $sam -TargetDatabase $data_VZ; "`nConta $sam movimentada para $data_VZ."; break }
        'x' { New-MoveRequest -Identity $sam -TargetDatabase $data_VZ; "`nConta $sam movimentada para $data_VZ."; break }
        'z' { New-MoveRequest -Identity $sam -TargetDatabase $data_VZ; "`nConta $sam movimentada para $data_VZ."; break }
        default {"Conta Nao movimentada"; break}        
    } 
    
    }

    #Write-Output "Primeira letra $primeira_letra do $sam"

}


<#

if ($result -eq [System.Windows.Forms.DialogResult]::OK) {
    $sam = $textBox.Text

    $primeira_letra = $sam.Substring(0,1)

    Write-Output $primeira_letra

    
    if ( $Session.State -eq "Opened" ){
        
        Write-Output "Status_session: open"

        Set-Mailbox -EmailAddressPolicyEnabled $true -Identity $sam -MaxReceiveSize unlimited -MaxSendSize unlimited

        Write-Output "`nAtributos da conta $sam setados com sucesso."

        
    } else {

        # --- Write-Output "not-open-session"
        
        Set-ExecutionPolicy Unrestricted  

        $Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri http://brtvtms11exc.shvgas.com.br/PowerShell/  -Authentication Kerberos

        Import-PSSession $Session

        Set-Mailbox -EmailAddressPolicyEnabled $true -Identity $sam -MaxReceiveSize unlimited -MaxSendSize unlimited

        Write-Output "`nAtributos da conta $sam setados com sucesso."

    }
      

    <# $primeira_letra = $sam.Substring(0,1)

    Switch ($primeira_letra) {
        
        'r' { New-MoveRequest -Identity $sam -TargetDatabase $database  }
        'e' {$login + " movido para database EEE"}
        'w' {$login + " movido para database VZZ"}
        'g' {$login + " movido para database GGG"}
    }

    #tentando ver se é mais vantagem construir com ifs aninhados
    
    if ($primeira_letra -eq "a") {
            $databasealvo = $database where $letter -eq 'a'  
        } else { $primeira_letra -eq "b" $database where $letter -eq 'b' }

     if ($primeira_letra -eq "b") {
        $database = "BRRJSHVGASUCBBDB"
     } else {
        else if ($primeira_letra -eq "b") {$database = "BRRJSHVGASUCAADB"}
        else if ($primeira_letra -eq "b") {$database = "BRRJSHVGASUCAADB"}

    }


    Start-Sleep -Seconds 5

    $samAccountName = $_.”samAccountName”

    $database #>
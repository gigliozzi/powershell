#CHARGE FILE

$path = “C:\Users\con-wgigliozzi\Desktop\Organizar\Power Shell Scripts\fonte-de-dados\charge10012020.csv”

Import-Csv $path | ForEach-Object { # parece que o método Substring funciona apenas com o ForEach-Object

    $sam = $_.samaccountname

    Write-Output $login

    
    if ( $sam.Substring(0,4) -eq "con-" ) {

        $primeira_letra = $sam.Substring(4,1)

        Write-Output $primeira_letra


    } else {
        
        $primeira_letra = $login.Substring(0,1)

        Write-Output $primeira_letra        
    
    }

    #Write-Output "Primeira letra $primeira_letra do $login"

}
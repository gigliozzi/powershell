<# New-ADUser 
-GivenName $_.PrimeiroNome 
-Surname $_.Sobrenome 
-Name $_.Exibicao 
-Office $_.escritorio
-streetAddress $_.streetAddress
 
-SamAccountName $_.SamAccountName 
-UserPrincipalName $_.UserPrincipalName 
 -AccountPassword (ConvertTo-SecureString Super@123. -AsPlainText -Force)  
 -ChangePasswordAtLogon $true
 -Enabled $true


 New-ADUser -GivenName "Lucas" -Surname "Pereira Caetano" -DisplayName "Caetano, L. (Caetano)" -SamAccountName "con-lucas.caetano" -UserPrincipalName "con-lucas.caetano" -Office #>


 New-ADUser -Name "Lucas" -Surname "Pereira Caetano" -City "Rio de Janeiro" -Company "Leggio" -Country "Brazil" -Department "Suporte Tecnico - Staff" -DisplayName "Caetano, L. (Lucas)" -Division "Escritorio Rj | 840 - Infra-estrutura" -EmployeeID "13589585722" -Enabled $true -GivenName "Lucas" -SamAccountName "con-lucas.caetano" -Title "Consultor" -UserPrincipalName "con-lucas.caetano"
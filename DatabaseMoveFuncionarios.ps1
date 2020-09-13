# Description: Corrige os atributos do Exchange e movimenta para a database correta
# Author: Gigliozzi, W. (William)
# Created in:  09.12.2019
# Improved in: 03.01.2020

<# Import-Csv exchange-database.csv
$letter = $_.”letter”
$database = $_."database"
$database[1]  #>
#$samAccountName = $_.”samAccountName”

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

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$form = New-Object System.Windows.Forms.Form
$form.Text = 'Form de correção de login'
$form.Size = New-Object System.Drawing.Size(300,200)
$form.StartPosition = 'CenterScreen'

$OKButton = New-Object System.Windows.Forms.Button
$OKButton.Location = New-Object System.Drawing.Point(75,120)
$OKButton.Size = New-Object System.Drawing.Size(75,23)
$OKButton.Text = 'OK'
$OKButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
$form.AcceptButton = $OKButton
$form.Controls.Add($OKButton)

$CancelButton = New-Object System.Windows.Forms.Button
$CancelButton.Location = New-Object System.Drawing.Point(150,120)
$CancelButton.Size = New-Object System.Drawing.Size(75,23)
$CancelButton.Text = 'Cancel'
$CancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
$form.CancelButton = $CancelButton
$form.Controls.Add($CancelButton)

$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(10,20)
$label.Size = New-Object System.Drawing.Size(280,20)
$label.Text = 'Por favor, informe o login'
$form.Controls.Add($label)

$textBox = New-Object System.Windows.Forms.TextBox
$textBox.Location = New-Object System.Drawing.Point(10,40)
$textBox.Size = New-Object System.Drawing.Size(260,20)
$form.Controls.Add($textBox)

$form.Topmost = $true

$form.Add_Shown({$textBox.Select()})
$result = $form.ShowDialog()

if ($result -eq [System.Windows.Forms.DialogResult]::OK) {
    $sam = $textBox.Text
    
    $primeira_letra = $sam.Substring(4,1) #No caso de terceiro (contas que tem radical "CON-")
            
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

}
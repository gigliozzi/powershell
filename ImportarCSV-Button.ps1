function Read-OpenFileDialog ([string]$WindowTitle, [string]$InitialDirectory, [string]$Filter = "All files (*.*)|*.*", [switch]$AllowMultiSelect)
{  
    Add-Type -AssemblyName System.Windows.Forms
    $openFileDialog = New-Object System.Windows.Forms.OpenFileDialog
    $openFileDialog.Title = $WindowTitle
    if (![string]::IsNullOrWhiteSpace($InitialDirectory)) { $openFileDialog.InitialDirectory = $InitialDirectory }
    $openFileDialog.Filter = $Filter
    if ($AllowMultiSelect) { $openFileDialog.MultiSelect = $true }
    $openFileDialog.ShowHelp = $true    # Without this line the ShowDialog() function may hang depending on system configuration and running from console vs. ISE.
    $openFileDialog.ShowDialog() > $null
    if ($AllowMultiSelect) { return $openFileDialog.Filenames } else { return $openFileDialog.Filename }
}

$filePath = Read-OpenFileDialog -WindowTitle "Seleziona il file CSV" -InitialDirectory 'C:\' -Filter "Text files (*.csv)|*.csv"  # Puoi anche forzare la selezione di un solo tipo "Text files (*.txt)|*.txt" 
if (![string]::IsNullOrEmpty($filePath)) { Write-Host "Selezionato il file: $filePath" 
$outputBox.text= "Selezionato il file $filepath"}
else { "Non hai selezionato un file csv."
$outputBox.text = "Non hai selezionato un file csv." }


$Button = New-Object System.Windows.Forms.Button 
$Button.Location = New-Object System.Drawing.Size(20,30) 
$Button.Size = New-Object System.Drawing.Size(110,80) 
$Button.Text = "CSV" 
$Button.BackColor = "Lightblue"

$Button.Add_Click({Read-OpenFileDialog}) 

$Form.Controls.Add($Button) 
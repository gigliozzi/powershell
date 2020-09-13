Add-Type -AssemblyName System.Windows.Forms

$Form = New-Object system.Windows.Forms.Form

$Form.Text = "CAPTURE USER"

$Form.Width = 200

$Form.Height = 200

$Form.AutoScroll = $False

$label = New-Object Windows.Forms.Label

$label.Location = New-Object Drawing.Point 50,30

$label.Size = New-Object Drawing.Point 250,30

$label.text = "Informe o login"

$Form.Controls.Add($label)

$textfield = New-Object Windows.Forms.TextBox

$textfield.Location = New-Object Drawing.Point 50,60

$textfield.Size = New-Object Drawing.Point 150,20

$Form.Controls.Add($textfield)

$OKbutton = New-Object Windows.Forms.Button

$OKbutton.text = "OK"

$OKbutton.Location = New-Object Drawing.Point 40,120

$Form.Controls.Add($OKbutton)

$OKButton.Add_Click({$x=$textfield.Text;$Form.Close()})

$Form.Controls.Add($OKButton)

$Cancelbutton = New-Object Windows.Forms.Button

$Cancelbutton.text = "Cancel"

$Cancelbutton.Location = New-Object Drawing.Point 120,120

$Form.Controls.Add($Cancelbutton)

$CancelButton.Add_Click({$Form.Close()})

$Form.Controls.Add($CancelButton)

$Form.ShowDialog()

Write-Host $x


[void][System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
[void][System.Reflection.Assembly]::LoadWithPartialName("System.Drawing")

$Form1 = New-Object System.Windows.Forms.Form
$Form1.ClientSize = New-Object System.Drawing.Size(407, 390)
$form1.topmost = $true


$computerNames = @("BRRJSHVGASUCAADB","BRRJSHVGASUCBBDB","BRRJSHVGASUCCCDB")
$comboBox1 = New-Object System.Windows.Forms.ComboBox
$comboBox1.Location = New-Object System.Drawing.Point(25, 55)
$comboBox1.Size = New-Object System.Drawing.Size(350, 310)
foreach($computer in $computerNames)
{
  $comboBox1.Items.add($computer)
}
$Form1.Controls.Add($comboBox1)

$Button = New-Object System.Windows.Forms.Button
$Button.Location = New-Object System.Drawing.Point(25, 20)
$Button.Size = New-Object System.Drawing.Size(98, 23)
$Button.Text = "Output"
$Button.add_Click({$label.Text = $comboBox1.SelectedItem.ToString()})
$Form1.Controls.Add($Button)

$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(70, 90)
$label.Size = New-Object System.Drawing.Size(98, 23)
$label.Text = ""
$Form1.Controls.Add($label)

[void]$form1.showdialog()
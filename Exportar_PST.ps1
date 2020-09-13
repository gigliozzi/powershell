
$boxName = "lcmenezes"
$path = "\\Brtvtms11exc\pst_gi\$boxName.pst"

New-MailboxExportRequest -FilePath \\Brtvtms11exc\pst_gi\lcmenezes.pst -Mailbox lcmenezes

New-MailboxExportRequest -FilePath $path -Mailbox $boxName


#Check status
Get-MailboxExportRequestStatistics -Identity lcmenezes\MailboxExport | Fl PercentComplete
<# PowerShell one-liner: Get AD user groups
Posted on July 31, 2017 by Pawel Janowicz
Starting from today we will add new series of articles describing one-liner scripts. In this post I would like to show you how to get group names that user is a member of using just one-liner script.

Get-ADUser allows you to list all information for Active Directory user account.
This command is a part of ActiveDirectory module where you can also see other commands.

Check available modules on your PC: #>

#1
Get-Module –ListAvailable 
If ActiveDirectory module is present you can import it using:

1
Import-Module -Name ActiveDirectory 
To get all commands available in this module run the following command:

1
Get-Command -Module ActiveDirectory
If ActiveDirectory module is not present please follow this guide – link.

If AD Module is installed and imported we can start getting user information.
Get general user information based on user account name:

1
Get-ADuser -Identity Pawel.Janowicz
This command returned only 10 basic user properties:

– DistinguishedName
– Enabled
– GivenName
– Name
– ObjectClass
– ObjectGUID
– SamAccountName
– SID
– Surname
– UserPrincipalName

To display all available attributes just run the following command:

1
Get-ADuser -Identity Pawel.Janowicz -Properties *
If you want to display groups we have to put our command into () and add “.memberof” at the end.

1
(Get-ADuser -Identity Pawel.Janowicz -Properties memberof).memberof
This command returns DistinguishedName of user’s direct group membership.
One way of getting names instead of DistinguishedName and sort them in alphabetic order is first creating $Groups variable:

1
$Groups = (Get-ADuser -Identity Pawel.Janowicz -Properties memberof).memberof
After that for all DistingushedNames from $Groups pass it to another commands (Get-ADGroup, Select-Object, Sort-Object) after pipeline. All together should look like this:

1
2
$Groups = (Get-ADuser -Identity Pawel.Janowicz -Properties memberof).memberof 
$Groups | Get-ADGroup | Select-Object name | Sort-Object name
Or you can do it in one-liner script:

1
(Get-ADuser -Identity Pawel.Janowicz -Properties memberof).memberof | Get-ADGroup | Select-Object name | Sort-Object name
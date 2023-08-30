$ADUser = Read-Host "Enter user name"
Import-Module -Name ActiveDirectory
Get-ADUser -Identity $ADUser
Set-ADAccountPassword -Identity $ADUser -NewPassword (ConvertTo-SecureString -AsPlainText 'P@ssword') -Reset
Set-ADUser -Identity $ADUser -ChangePasswordAtLogon $true
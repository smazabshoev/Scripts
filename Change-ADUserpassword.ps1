<#
.SYNOPSIS
Change-ADUserpassword changes user account password by querying user first and last name.
.DESCRIPTION
Change-ADUserpassword uses user acocunt First and Last name to 
query Active Directory for required user account and changes its password.
.PARAMETER Givenname
The first name of requested user account to query.
.PARAMETER Surname
The last name of requested user account to query.
.EXAMPLE
Change-ADUserpassword -Givenname Shavkat -Lastname Mazabshoev
.EXAMPLE
Change-ADUserpassword Shavkat Mazabshoev
#>

[CmdletBinding()]
param (
    [Parameter(Mandatory=$True,ValueFromPipeline)]
    [Alias ('Firstname')]
    [string]$Givenname,

    [Parameter(Mandatory=$true,ValueFromPipeline)]
    [Alias ('Lastname')]
    [string]$Surname
)

# Get user account by quering they are First and Last name.
Get-ADUser -Filter "Name -eq '$($Givenname && $Surname)'" | 
# Change user account password.
Set-ADAccountPassword -Reset -NewPassword (ConvertTo-SecureString -AsPlainText "P@ssword" -Force) |
# Set user account password be changed at first logon.
Set-ADUser -ChangePasswordAtLogon $true
# Exit code 
Write-Host $LASTEXITCODE
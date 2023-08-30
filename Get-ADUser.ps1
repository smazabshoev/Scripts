<#
.SYNOPSIS
Get-ADUser retrieves user account details by querying user first and last name.
.DESCRIPTION
Get-ADUser uses user acocunt First and Last name to 
query Active Directory for required user account.
.PARAMETER Givenname
The first name of requested user account to query.
.PARAMETER Surname
The last name of requested user account to query.
.EXAMPLE
Get-ADUser -Givenname Shavkat -Lastname Mazabshoev
.EXAMPLE
Get-ADUser Shavkat Mazabshoev
#>

[CmdletBinding()]
param (
    [Parameter(Mandatory=$True,ValueFromPipeline)]
    [Alias ('Firstname')]
    [SupportsWildcards()]
    [string]$Givenname,

    [Parameter(Mandatory=$true,ValueFromPipeline)]
    [Alias ('Lastname')]
    [SupportsWildcards()]
    [string]$Surname
)

# Provide status report on screen.
Get-ADUser -Filter "Name -eq '$($Givenname && $Surname)'" 
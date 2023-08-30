<#
.SYNOPSIS
Enable-ADUser enables user account by querying user first and last name.
.DESCRIPTION
Enable-ADUser uses  user acocunt First and Last name to 
query Active Directory for required user account and enables it.
.PARAMETER Givenname
The first name of requested user account to query.
.PARAMETER Surname
The last name of requested user account to query.
.EXAMPLE
Enable-ADUser -Givenname Shavkat -Lastname Mazabshoev
.EXAMPLE
Enable-ADUser Shavkat Mazabshoev
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

# Enable user account by quering they are First and Last name.
Get-ADUser -Filter "Name -eq '$($Givenname && $Surname)'" | Enable-ADAccount 


# Print at result message on screen.
Write-Host "$Givenname $Surname user account is enabled"

# Provide status report on screen.
Get-ADUser -Filter "Name -eq '$($Givenname && $Surname)'" | Select-Object Name, Enabled
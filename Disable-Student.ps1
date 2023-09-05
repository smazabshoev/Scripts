<#
.SYNOPSIS
Disable-Student disable student's user account as part of Poor Financial Standing by querying user first and last name.
.DESCRIPTION
Disable-Student uses user acocunt First and Last name to 
query Active Directory for required student's user account and disabling it.
.PARAMETER Givenname
The first name of requested user account to query.
.PARAMETER Surname
The last name of requested user account to query.
.EXAMPLE
Disable-Student -Givenname Shavkat -Lastname Mazabshoev
.EXAMPLE
Disable-Student Shavkat Mazabshoev
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

# Disable student's user account by quering they are First and Last name.
Get-ADUser -Filter "Name -eq '$($Givenname && $Surname)'" | Disable-ADAccount 


# Print at result message on screen.
Write-Host "$Givenname $Surname user account is disabled"

# Provide status report on screen.
Get-ADUser -Filter "Name -eq '$($Givenname && $Surname)'" | Select-Object Name, Enabled


Get-ADcomputer  -Filter "Description -like '$($Givenname && $Surname +'*')'" 
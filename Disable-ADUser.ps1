<#
.SYNOPSIS
Disable-ADUser disables user account by querying user first and last name
and removes any group membership except Domain Users.
.DESCRIPTION
Disable-ADUser uses user acocunt First and Last name to 
query Active Directory for required user account and disabling it.
Also this script removes the user from any grop membership except
Domain Users. Additionally this script sets the Manager attribute 
of the user to blank.
.PARAMETER Givenname
The first name of requested user account to query.
.PARAMETER Surname
The last name of requested user account to query.
.EXAMPLE
Disable-ADUser -Givenname Shavkat -Lastname Mazabshoev
.EXAMPLE
Disable-ADUser Shavkat Mazabshoev
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

# Disable user account by quering they are First and Last name.
Get-ADUser -Filter "Name -eq '$($Givenname && $Surname)'" | Disable-ADAccount |

# Remove the usre from all domain groups except 'Domain Users'.
Get-ADUser -Properties MemberOf | ForEach-Object {$_.MemberOf | Remove-ADGroupMember -Members $_.DistinguishedName -Confirm:$false} |

# Set the Manager property of the user account to blank.
Set-ADUser -Manager $null

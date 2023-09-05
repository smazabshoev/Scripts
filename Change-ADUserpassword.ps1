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
$Identity = (Get-ADUser -Filter "Name -eq '$($Givenname && $Surname)'" )


# Change user account password.
Set-ADAccountPassword -Identity $Identity -Reset -NewPassword (ConvertTo-SecureString -AsPlainText "P@ssword" -Force)


# Exit code 
if ($LASTEXITCODE -eq 0) 
{
    Write-Host "$Givenname $Surname password changed successfully"
}else { 
    Write-Host "Failed to change $Givenname $Surname password"
}


# Set user account password be changed at first logon.
Set-ADUser $Identity -ChangePasswordAtLogon $true


# Exit code 
if ($LASTEXITCODE -eq 0) 
{
    Write-Host "$Givenname $Surname prompted to change their password at next logon"
}
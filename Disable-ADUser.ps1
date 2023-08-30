[CmdletBinding()]
param (
    [Parameter(Mandatory,ValueFromPipeline)]
    [ValidateLength(5,20)]
    [string]$ADUser
)

# Disable AD user account.
Disable-ADAccount -Identity $ADUser

# Remove the usre from all domain groups except 'Domain Users'.
Get-ADUser -Identity $ADUser -Properties MemberOf | ForEach-Object {$_.MemberOf | Remove-ADGroupMember -Members $_.DistinguishedName -Confirm:$false}

# Set the Manager property of the user account to blank.
Set-ADUser -Identity $ADUser -Manager $null

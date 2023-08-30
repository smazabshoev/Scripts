

$SearchBase = "OU=Users,OU=Khorog Campus,DC=UCA,DC=corp" 
Get-ADUser -Filter * -Properties * -SearchBase $SearchBase | Where-Object {$_.PasswordNeverExpires -eq $true} | Select-Object Name

$Users = Get-ADUser -Filter * -Properties * -SearchBase $SearchBase | Where-Object {$_.PasswordNeverExpires -eq $true} 

foreach ($User in $Users)
        {
        Set-ADUser -Identity $User -PasswordNeverExpires $false
        }

    
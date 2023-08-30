$Faculty = Get-ADUser -Filter * -Properties * | Where-Object {$_.manager -like '*Murodbek*'}

foreach ($teacher in $Faculty) {
        Set-ADUser -Identity $teacher -Manager 'stanislav.zagorodnye'
        }
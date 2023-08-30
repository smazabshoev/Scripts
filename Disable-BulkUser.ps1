
$Students = Import-Csv 'C:\Users\shavkat.mazabshoev\OneDrive - University of Central Asia\Desktop\Students.csv' 

foreach ($Student in $Students)
	{
		Get-ADUser -Filter "Name -eq '$($Student.Givenname && $Student.Surname)'" |
		Disable-ADAccount |
		Write-Host "$Student.Givenname && $Student.Surname is disabled"
	}


$Students = Import-Csv 'C:\Users\shavkat.mazabshoev\OneDrive - University of Central Asia\Desktop\Students.csv' 

foreach ($Student in $Students)
	{
		Get-ADUser -Filter "Name -eq '$($Student.Givenname && $Student.Surname)'" 
	}

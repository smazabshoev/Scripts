for ($i = 0; $i -le 10; $i=$i+5) {$i}

for ($i = 1000; $i -gt 0; $i=$i-200) {$i}

for ($i = 10; $i -le 20; $i++)
{
    $IP = "192.168.0.$i"
    Write-Host $IP
}

$a = Read-Host 'Enter string value'
$a
for ($i = 0; $i -lt $a.Length; $i++)
{
    #$a[$i]
    $text = ''
    for ($j = 0; $j -lt $i;$j++) 
    {
        $text += $a[$j]
    }
    $text += "[" + $a[$i] + "]"
    $text
}


$a = Read-Host 'Enter string value'
$a
for ($i = 0; $i -lt $a.Length; $i++)
{
    #$a[$i]
    $text = ''
    for ($j = 0; $j -lt $i;$j++) 
    {
        $text += $a[$j]
    }
    $text += "[" + $a[$i] + "]"
    
    for ($j = $i+1; $j -lt $a.Length; $j++)
    {
        $text +=$a[$j]
    }
    $text
}

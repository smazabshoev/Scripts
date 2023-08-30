<#
.SYNOPSIS
Get-DiskFreeSpace retrieves logical disk information from one or
more computers.
.DESCRIPTION
Get-DiskFreeSpace uses CIM to retrieve the Win32_LogicalDisk
instances from one or more computers. It displays each disk's
drive letter, free space, total size, and percentage of free
space.
.PARAMETER computername
The computer name, or names, to query. Default: Localhost.
.PARAMETER freespace
The drive free space in per cent. See Win32_LogicalDisk documentation
for values. 10 per cent is the default.
.EXAMPLE
Get-DiskFreeSpace -computername SRV02 -FreeSpace 10
#>

param (
    $computername = 'localhost',
    $MinFreePercent = 10
)
$FreeSpace = $MinFreePercent / 100
Get-CimInstance -classname Win32_LogicalDisk -ComputerName $computername `
-filter "drivetype=3" |
    Where-Object { ($_.FreeSpace / $_.Size) -lt $FreeSpace } |
    Select-Object -Property DeviceID,FreeSpace,Size
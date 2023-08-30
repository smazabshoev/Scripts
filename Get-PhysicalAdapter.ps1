
<#
.SYNOPSIS
Get-PhysicalAdapters retrieves logical disk information from one or
more computers.
.DESCRIPTION
Get-PhysicalAdapters uses CIM to retrieve the Win32_NetworkAdapter
instances from one or more computers. It displays each adapter's
MAC Address, AdapterType, DeviceID, Name, Speed.
.PARAMETER computername
The computer name, or names, to query. Default: Localhost.
.EXAMPLE
Get-PhysicalAdapters -ComputerName SRV02 
#>

[CmdletBinding()]
param (
    [Parameter(Mandatory=$True)]
    [Alias('hostname')]
    [string]$ComputerName
)
Write-Verbose "Connecting to $ComputerName"
Write-Verbose "Looking for Network Adapter"

Get-CimInstance win32_networkadapter -ComputerName $ComputerName |
    Where-Object { $_.PhysicalAdapter } |
        Select-Object MACAddress,AdapterType,DeviceID,Name,Speed
        
Write-Verbose "Finished running command"
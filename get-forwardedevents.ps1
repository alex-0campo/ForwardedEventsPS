[CmdletBinding()]
param()

Clear-Host

Push-Location
[string] $path = Split-Path -Parent $PSCommandPath
cd $path
    
$xpath = "*[System[TimeCreated[timediff(@SystemTime) <= 600000]]]"
$logName = "Security"
# $xpath = "*[System[band(keywords,4503599627370496) and TimeCreated[timediff(@SystemTime) <= 84600000]]]"
$svr = "192.168.56.156" # Get-Content .\svr.txt

Invoke-Command -ComputerName $svr -ArgumentList $logName,$xpath -ScriptBlock { Get-WinEvent -LogName $args[0] -FilterXPath $args[1] | ft } # -UseSSL

Pop-location

Write-Host "end of script!`r`n"

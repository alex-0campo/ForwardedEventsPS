[CmdletBinding()]
param()

Clear-Host
    
$xpath = "*[System[TimeCreated[timediff(@SystemTime) <= 84600000]]]"
# $xpath = "*[System[band(keywords,4503599627370496) and TimeCreated[timediff(@SystemTime) <= 84600000]]]"
$svr = "192.168.56.156"

Invoke-Command -ComputerName $svr -ArgumentList $xpath -ScriptBlock { Get-WinEvent -LogName 'Application' -FilterXPath $args[0] } -UseSSL

Write-Host "end of script!`r`n"

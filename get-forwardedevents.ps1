[CmdletBinding()]
param()
    
$xpath = "*[System[band(keywords,4503599627370496) and TimeCreated[timediff(@SystemTime) <= 84600000]]]"
$svr = "10.0.0.25"

if (Test-Connection -ComputerName $svr -Count 1 -Quiet) {

    Write-Host "$svr is online."
    Invoke-Command -ComputerName $svr -ScriptBlock { Get-WinEvent -LogName 'Application'  -FilterXPath $xpath } # -MaxEvents 10

}

Write-Host "end of script!`r`n"

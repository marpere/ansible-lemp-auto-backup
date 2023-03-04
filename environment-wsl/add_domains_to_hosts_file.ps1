function Add-DomainToHostsFile{
    #Requires -RunAsAdministrator
    param(
        [string]$DesiredIP = "127.0.0.1"
        ,[string]$Hostname = "localhost"
        ,[bool]$CheckHostnameOnly = $false
    )

    $hostsFilePath = "$($Env:WinDir)\System32\drivers\etc\hosts"
    $hostsFile = Get-Content $hostsFilePath

    Write-Host "About to add $desiredIP for $Hostname to hosts file" -ForegroundColor Gray

    $escapedHostname = [Regex]::Escape($Hostname)
    $patternToMatch = if ($CheckHostnameOnly) { ".*\s+$escapedHostname.*" } else { ".*$DesiredIP\s+$escapedHostname.*" }
    if (($hostsFile) -match $patternToMatch)  {
        Write-Host $desiredIP.PadRight(20," ") "$Hostname - not adding; already in hosts file" -ForegroundColor DarkYellow
    } 
    else {
        Write-Host $desiredIP.PadRight(20," ") "$Hostname - adding to hosts file... " -ForegroundColor Yellow -NoNewline
        Add-Content -Encoding UTF8  $hostsFilePath ("$DesiredIP".PadRight(20, " ") + "$Hostname")
        Write-Host " done"
    }
}

Add-DomainToHostsFile -Hostname local.app.com -DesiredIP 127.0.0.1
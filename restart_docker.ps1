if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "requesting administrator rights..."
    Start-Process powershell.exe -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
    Exit
}

Get-Process *docker* | Stop-Process -Force
Get-Process *wsl* | Stop-Process -Force
Restart-Service com.docker.service
wsl --shutdown
& "C:\Program Files\Docker\Docker\Docker Desktop.exe"
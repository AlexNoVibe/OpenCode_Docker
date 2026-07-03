Get-Process *docker* | Stop-Process -Force
Get-Process *wsl* | Stop-Process -Force
Restart-Service com.docker.service
wsl --shutdown
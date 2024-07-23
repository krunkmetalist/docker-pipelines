# Use the official Windows Server Core image
FROM mcr.microsoft.com/windows/servercore:ltsc2022

# Install necessary components for RDP
RUN powershell -Command \
    Add-WindowsFeature Remote-Desktop-Services; \
    Add-WindowsFeature RDS-RD-Server; \
    Add-WindowsFeature RDS-Licensing-UI; \
    Add-WindowsFeature RDS-Licensing-Role; \
    Add-WindowsFeature RDS-Web-Access; \
    Add-WindowsFeature RDS-Gateway; \
    Add-WindowsFeature RDS-Session-Collection-UI

# Configure the RDP server
RUN powershell -Command \
    Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server\' -Name 'fDenyTSConnections' -Value 0; \
    Enable-NetFirewallRule -DisplayGroup 'Remote Desktop'

# Set the entry point to cmd.exe
ENTRYPOINT ["cmd.exe"]

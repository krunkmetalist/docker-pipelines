# Ensure script is running as an administrator
if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Host "Please run this script as an administrator." -ForegroundColor Red
    exit
}

# Install OpenSSH Server
Write-Host "Installing OpenSSH Server..."
Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0

# Start the OpenSSH Server service
Write-Host "Starting OpenSSH Server service..."
Start-Service -Name sshd

# Set the OpenSSH Server service to start automatically
Write-Host "Setting OpenSSH Server service to start automatically..."
Set-Service -Name sshd -StartupType 'Automatic'

# Configure the firewall to allow SSH traffic
Write-Host "Configuring firewall to allow SSH traffic..."
New-NetFirewallRule -Name sshd -DisplayName 'OpenSSH Server (sshd)' -Enabled True -Direction Inbound -Protocol TCP -Action Allow -LocalPort 22

Write-Host "SSH configuration complete. You can now connect to this machine using SSH."

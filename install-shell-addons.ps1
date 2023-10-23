# windows-install-scripts

# Util includes
. "util\file-util.ps1"

# Constants
$POWERSHELL_PROFILE_DIR="$HOME\Documents\PowerShell"
$POWERSHELL_PROFILE_NAME="Microsoft.PowerShell_profile.ps1"

$STARSHIP_CONFIG_DIR="$HOME\.starship"
$STARSHIP_CONFIG_NAME="starship.toml"

$CLINK_CONFIG_DIR="$($env:LOCALAPPDATA)\clink"
$CLINK_CONFIG_NAME="starship.tua"

$INSTALL_FOLDER="$PSScriptRoot\install-shell-addons"

# Install powershell profile
File-Util-Create-Directory "$POWERSHELL_PROFILE_DIR"
File-Util-Create-Symbolic-Link "$POWERSHELL_PROFILE_DIR\$POWERSHELL_PROFILE_NAME" "$INSTALL_FOLDER\$POWERSHELL_PROFILE_NAME"

# Install starship config for powershell
File-Util-Create-Directory "$STARSHIP_CONFIG_DIR"
File-Util-Create-Symbolic-Link "$STARSHIP_CONFIG_DIR\$STARSHIP_CONFIG_NAME" "$INSTALL_FOLDER\$STARSHIP_CONFIG_NAME"

# Install clink config for cmd (with starship support)
File-Util-Create-Directory "$CLINK_CONFIG_DIR"
File-Util-Create-Symbolic-Link "$CLINK_CONFIG_DIR\$CLINK_CONFIG_NAME" "$INSTALL_FOLDER\$CLINK_CONFIG_NAME"

# Install nerd font (Mono font needed for cmd)
Copy-Item -Path "$INSTALL_FOLDER\fonts\FiraCodeNerdFont-Regular.ttf" -Destination "$($env:WINDIR)\Fonts" -Force
Copy-Item -Path "$INSTALL_FOLDER\fonts\FiraCodeNerdFontMono-Regular.ttf" -Destination "$($env:WINDIR)\Fonts" -Force

New-ItemProperty -Path "HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Fonts" -Name "FiraCode Nerd Font Reg (TrueType)" -Value "FiraCodeNerdFont-Regular.ttf" -PropertyType String -Force
New-ItemProperty -Path "HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Fonts" -Name "FiraCode Nerd Font Mono Reg (TrueType)" -Value "FiraCodeNerdFontMono-Regular.ttf" -PropertyType String -Force

# Install ZLocation (similar to autojump)
Install-Module ZLocation -Scope CurrentUser
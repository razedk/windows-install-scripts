# windows-install-scripts

# Util includes
. "util\file-util.ps1"

# Constants
$POWERSHELL_PROFILE_DIR="$HOME\Documents\PowerShell"
$POWERSHELL_PROFILE_NAME="Microsoft.PowerShell_profile.ps1"

$STARSHIP_CONFIG_DIR="$HOME\.starship"
$STARSHIP_CONFIG_NAME="starship.toml"

$INSTALL_FOLDER="$PSScriptRoot\install-shell-addons"

# Install powershell profile
# xcopy /ye install-shell-addons\Documents %USERPROFILE%\Documents
File-Util-Create-Directory "$POWERSHELL_PROFILE_DIR"
File-Util-Create-Symbolic-Link "$POWERSHELL_PROFILE_DIR\$POWERSHELL_PROFILE_NAME" "$INSTALL_FOLDER\$POWERSHELL_PROFILE_NAME"

# Install starship config
File-Util-Create-Directory "$STARSHIP_CONFIG_DIR"
File-Util-Create-Symbolic-Link "$STARSHIP_CONFIG_DIR\$STARSHIP_CONFIG_NAME" "$INSTALL_FOLDER\$STARSHIP_CONFIG_NAME"

# Install nerd font
# copy /y install-shell-addons\fonts\FiraCodeNerdFont-Regular.ttf %WINDIR%\Fonts
# reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "FiraCode Nerd Font Reg (TrueType)" /t REG_SZ /d FiraCodeNerdFont-Regular.ttf

# Install ZLocation (similar to autojump)
Install-Module ZLocation -Scope CurrentUser
Set-Alias edit "C:\Program Files\Notepad++\notepad++.exe"
Set-Alias showenv Show-Environment-Variables
Set-Alias j Invoke-ZLocation
Set-Alias home "cd $HOME"

# Method to show all environment variables
function Show-Environment-Variables {
  param ($filter)
  Get-ChildItem -Path Env:\$filter*
}

# Enable Starship
#$ENV:STARSHIP_CONFIG = "$HOME\.starship\starship.toml"
Invoke-Expression (&starship init powershell)

# Load ZLocation (similar to autojump)
Import-Module ZLocation

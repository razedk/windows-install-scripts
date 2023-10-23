# windows-install-scripts

function File-Util-Create-Directory {
	Param($DirectoryName)
	
	Write-Host "Creating dir: Dir=<$DirectoryName>"
	
	if (!(Test-Path -Path "$DirectoryName")) {
       New-Item -ItemType Directory -Force -Path "$DirectoryName"
	   Write-Host "Created new dir: Dir=<$DirectoryName>"
	}
	
	Write-Host "Done: Dir=<$DirectoryName>"
}

function File-Util-Create-Symbolic-Link {
	Param($SymbolicPath, $RealPath)
	
	Write-Host "Creating symbolic link: SymbolicPath=<$SymbolicPath>, RealPath=<$RealPath>"
	
	# Delete existing file or symbolic link 
	if ((Test-Path -Path "$SymbolicPath")) {
		Remove-Item -Path "$SymbolicPath" -Force
	}
	
	# Create new symbolic link
	if (!(Test-Path -Path "$SymbolicPath")) {
       New-Item -Path "$SymbolicPath" -ItemType SymbolicLink -Value "$RealPath"
	   Write-Host "Created symbolic link: SymbolicPath=<$SymbolicPath>, RealPath=<$RealPath>"
	}
	
	Write-Host "Done: SymbolicPath=<$SymbolicPath>, RealPath=<$RealPath>"
}


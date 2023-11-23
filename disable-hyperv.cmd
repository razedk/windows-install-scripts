@echo off

REM # Disable hyper-v 
bcdedit /set {current} hypervisorlaunchtype off
timeout /t 5
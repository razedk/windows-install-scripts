@echo off

REM # Enable hyper-v
bcdedit /set {current} hypervisorlaunchtype auto
timeout /t 5
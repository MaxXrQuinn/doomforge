@echo off
:: Double-click me to install DOOMFORGE.
:: This just runs install.ps1 (PowerShell is built into Windows).
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0install.ps1"
pause

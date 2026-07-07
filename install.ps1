# DOOMFORGE installer — no admin rights, no downloads.
# Installs the game into %LOCALAPPDATA%\DOOMFORGE and creates shortcuts.

$ErrorActionPreference = "Stop"
$src  = Split-Path -Parent $MyInvocation.MyCommand.Definition
$dest = Join-Path $env:LOCALAPPDATA "DOOMFORGE"

Write-Host ""
Write-Host "  ============================================" -ForegroundColor DarkYellow
Write-Host "     D O O M F O R G E   -   S E T U P"        -ForegroundColor Yellow
Write-Host "  ============================================" -ForegroundColor DarkYellow
Write-Host ""
Write-Host "  Installs DOOMFORGE as an app launchable from the"
Write-Host "  Start Menu and Desktop. Uses the browser engine"
Write-Host "  already on Windows - nothing to download."
Write-Host ""
Write-Host "  Install location: $dest"
Write-Host ""

# copy files
New-Item -ItemType Directory -Force -Path $dest | Out-Null
Copy-Item (Join-Path $src "doomforge.html") (Join-Path $dest "doomforge.html") -Force
Copy-Item (Join-Path $src "doomforge.ico")  (Join-Path $dest "doomforge.ico")  -Force
Copy-Item (Join-Path $src "launch.vbs")     (Join-Path $dest "launch.vbs")     -Force

# shortcuts (Start Menu + Desktop)
$vbs = Join-Path $dest "launch.vbs"
$ico = Join-Path $dest "doomforge.ico"
$sh  = New-Object -ComObject WScript.Shell
foreach ($lnk in @(
    (Join-Path ([Environment]::GetFolderPath("Programs")) "DOOMFORGE.lnk"),
    (Join-Path ([Environment]::GetFolderPath("Desktop"))  "DOOMFORGE.lnk"))) {
  $s = $sh.CreateShortcut($lnk)
  $s.TargetPath       = "wscript.exe"
  $s.Arguments        = '"' + $vbs + '"'
  $s.WorkingDirectory = $dest
  $s.IconLocation     = $ico
  $s.Description       = "DOOMFORGE - Retro FPS Construction Kit"
  $s.Save()
}

# uninstaller
$uninst = @"
`$dest = "$dest"
Write-Host "Removing DOOMFORGE..."
Remove-Item (Join-Path ([Environment]::GetFolderPath('Programs')) 'DOOMFORGE.lnk') -ErrorAction SilentlyContinue
Remove-Item (Join-Path ([Environment]::GetFolderPath('Desktop'))  'DOOMFORGE.lnk') -ErrorAction SilentlyContinue
Start-Process powershell -ArgumentList '-NoProfile','-Command',"Start-Sleep 1; Remove-Item -Recurse -Force '`$dest'"
Write-Host "Done."
"@
Set-Content -Path (Join-Path $dest "Uninstall.ps1") -Value $uninst -Encoding UTF8

Write-Host "  Installed. Look for DOOMFORGE on your Desktop and Start Menu." -ForegroundColor Green
Write-Host "  To remove it later: run Uninstall.ps1 in $dest"
Write-Host ""
$go = Read-Host "  Launch DOOMFORGE now? [Y/N]"
if ($go -eq "Y" -or $go -eq "y") { Start-Process "wscript.exe" -ArgumentList ('"' + $vbs + '"') }

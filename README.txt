DOOMFORGE - Windows App Kit
===========================

Three ways to run DOOMFORGE. Pick one - the first is easiest.


OPTION 1 - INSTALL IT (recommended)
-----------------------------------
Double-click  Install-DOOMFORGE.bat

This installs DOOMFORGE like a real program:
  - copies it into your account (%LOCALAPPDATA%\DOOMFORGE)
  - adds a DOOMFORGE icon to your Desktop and Start Menu
  - launches in its own clean app window (no tabs, no address bar)

No admin rights, no downloads, nothing to build. It uses the Edge
browser engine that's already part of Windows 10/11.

If Windows SmartScreen warns about the .bat, click "More info" >
"Run anyway" (it's unsigned because it's a plain local script - you
can open it in Notepad to read exactly what it does).

To uninstall later: run Uninstall.ps1 inside %LOCALAPPDATA%\DOOMFORGE
(right-click > Run with PowerShell), which removes the shortcuts and
app files.


OPTION 2 - PORTABLE, NO INSTALL
-------------------------------
Keep DOOMFORGE.bat and doomforge.html together in a folder and
double-click DOOMFORGE.bat. It opens the game in an app window
without copying anything or making shortcuts. Good for a USB stick.


OPTION 3 - BUILD THE .EXE
---------------------------------------
The electron\ folder builds a standalone DOOMFORGE.exe. Requires
Node.js (free, nodejs.org):

  1. Open the electron\ folder in a terminal
  2. npm install
  3. npm run dist
  4. Find electron\dist\DOOMFORGE.exe

That .exe is fully self-contained - copy it to any Windows PC.
For a Start-Menu installer instead, run:  npm run dist-installer


NOTES
-----
- Level .json files you export from the editor work in every version
  (browser, installed app, portable, or .exe) interchangeably.
- To update the game, replace doomforge.html and re-run the installer
  (or rebuild the exe).

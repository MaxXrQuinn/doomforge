DOOMFORGE - Windows App Kit Instalation Guide
=============================================

There are 3 ways to run DOOMFORGE.


OPTION 1 - INSTALL IT (recommended)
-----------------------------------
"Double-click"  "Install-DOOMFORGE.bat"

This installs DOOMFORGE as a program:
  - copies it into your account (%LOCALAPPDATA%\DOOMFORGE)
  - adds a DOOMFORGE icon to your Desktop and Start Menu
  - launches in its own app window

No admin rights, downloads, or software to build is needed. It uses the Edge
browser engine that's already part of Windows 10/11.

If the Windows SmartScreen warns you about the .bat, click "More info" >
"Run anyway" ("It's unsigned because it's a plain local script, you
can open it in Notepad to read exactly what it does").

To uninstall: run Uninstall.ps1 inside %LOCALAPPDATA%\DOOMFORGE
"right-click" > "Run with PowerShell", which removes the shortcuts and
app files.


OPTION 2 - PORTABLE, NO INSTALL
-------------------------------
Keep DOOMFORGE.bat and doomforge.html together in a folder and
"double-click" DOOMFORGE.bat. It opens the game in a app window
without copying anything or making shortcuts. ("Safe to use with a USB stick / thumb drive").


OPTION 3 - BUILD A .EXE
---------------------------------------
The electron\ folder builds a standalone DOOMFORGE.exe. Requires
Node.js which is free from "nodejs.org":

  1. Open the electron\ folder in a terminal
  2. npm install
  3. npm run dist
  4. Find electron\dist\DOOMFORGE.exe

That .exe is fully self-contained. Copy it to any Windows Computer.
For a Start-Menu installer, run:  npm run dist-installer


EXTRA NOTES
-----------
- Level .json files you export from the editor work in every version
  (browser, installed app, portable, or .exe) interchangeably.
- To update the game, replace doomforge.html and re-run the installer
  (or rebuild the exe).

' DOOMFORGE launcher — opens the game in its own app window (no console, no URL bar)
Option Explicit
Dim fso, sh, game, url, edge, p1, p2
Set fso = CreateObject("Scripting.FileSystemObject")
Set sh  = CreateObject("WScript.Shell")

game = fso.GetParentFolderName(WScript.ScriptFullName) & "\doomforge.html"
url  = "file:///" & Replace(game, "\", "/")

' Prefer Microsoft Edge in --app mode (present on all Windows 10/11)
edge = ""
p1 = sh.ExpandEnvironmentStrings("%ProgramFiles(x86)%") & "\Microsoft\Edge\Application\msedge.exe"
p2 = sh.ExpandEnvironmentStrings("%ProgramFiles%")      & "\Microsoft\Edge\Application\msedge.exe"
If fso.FileExists(p1) Then edge = p1
If edge = "" And fso.FileExists(p2) Then edge = p2

If edge <> "" Then
  sh.Run """" & edge & """ --app=""" & url & """ --window-size=1120,780", 1, False
Else
  ' Fallback: open in the default browser
  sh.Run """" & url & """", 1, False
End If

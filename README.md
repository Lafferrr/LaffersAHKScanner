# LaffersAHKScanner

A screensharing tool used to verify the integrity of players meant for detecting macros and script.

# Usage
Run the following command in PowerShell or Command Prompt:
```powershell
powershell -Command "Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass; Invoke-Expression (Invoke-RestMethod 'https://raw.githubusercontent.com/Lafferrr/LaffersAHKScanner/main/LaffersAHKScanner.ps1')"
```
# Features
-  Scans users drives for files with the extension of .ahk.
-  Outputs a .txt file into the C: Drive with the results.

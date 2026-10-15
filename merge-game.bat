@echo off
setlocal
cd /d "%~dp0"
copy /b "game-part1.bin"+"game-part2.bin" "game.zip" >nul
if errorlevel 1 (
  echo Merge failed. Keep both part files in this folder and try again.
  pause
  exit /b 1
)
powershell -NoProfile -Command "Expand-Archive -LiteralPath 'game.zip' -DestinationPath 'game' -Force"
if errorlevel 1 (
  echo Extraction failed. Make sure both parts finished downloading.
  pause
  exit /b 1
)
echo Done. Open the game folder and double-click start-game.bat.
pause
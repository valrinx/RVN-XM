@echo off
setlocal
cd /d "%~dp0"

echo ==============================================
echo  TRADE XM - Starting full local stack
echo ==============================================
echo.

if not exist node_modules (
  echo [1/4] Installing dependencies...
  call npm install
  if errorlevel 1 goto :fail
)

echo [2/4] Starting web + api...
start "TRADE XM Web" cmd /k "cd /d \"%~dp0\" && npm run dev --workspace @trade-xm/web"
start "TRADE XM API" cmd /k "cd /d \"%~dp0\" && npm run dev --workspace @trade-xm/api"

echo [3/4] Optional bot check...
if defined TELEGRAM_BOT_TOKEN (
  start "TRADE XM Bot" cmd /k "cd /d \"%~dp0\" && npm run dev --workspace @trade-xm/bot"
) else (
  echo TELEGRAM_BOT_TOKEN not set. Bot will not start.
)

echo.
echo [4/4] Opening the app in your browser...
start http://localhost:3000

echo.
echo Done. Keep the opened windows running.
pause
exit /b 0

:fail
echo.
echo Failed to start TRADE XM.
pause
exit /b 1

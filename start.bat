@echo off
setlocal EnableExtensions EnableDelayedExpansion
cd /d "%~dp0"

echo ==============================================
echo  TRADE XM - One-click setup and start
echo ==============================================
echo.

if not exist ".env" (
  echo [1/5] Creating .env from .env.example...
  if exist ".env.example" (
    copy /y ".env.example" ".env" >nul
  ) else (
    echo .env.example not found.
    pause
    exit /b 1
  )
) else (
  echo [1/5] .env already exists.
)

where npm >nul 2>nul
if errorlevel 1 (
  echo npm was not found. Please install Node.js 20+ first.
  pause
  exit /b 1
)

if not exist node_modules (
  echo [2/5] Installing dependencies...
  call npm install
  if errorlevel 1 goto :fail
) else (
  echo [2/5] Dependencies already installed.
)

echo [3/5] Starting API...
start "TRADE XM API" cmd /k "cd /d \"%~dp0\" && npm run dev --workspace @trade-xm/api"

echo [4/5] Starting Web...
start "TRADE XM Web" cmd /k "cd /d \"%~dp0\" && npm run dev --workspace @trade-xm/web"

if exist "apps\bot\src\index.ts" (
  findstr /c:"TELEGRAM_BOT_TOKEN=" ".env" | findstr /v /c:"TELEGRAM_BOT_TOKEN=$" >nul
  if not errorlevel 1 (
    echo [5/5] Starting Telegram Bot...
    start "TRADE XM Bot" cmd /k "cd /d \"%~dp0\" && npm run dev --workspace @trade-xm/bot"
  ) else (
    echo [5/5] Telegram token not set, bot skipped.
  )
)

timeout /t 2 /nobreak >nul
start http://localhost:3000

echo.
echo Setup complete. Keep the opened windows running.
pause
exit /b 0

:fail
echo.
echo Failed to install dependencies or start services.
pause
exit /b 1

@echo off
setlocal
cd /d "%~dp0"

echo ==============================================
echo  TRADE XM - Starting via Docker Compose
echo ==============================================
echo.

if not exist docker-compose.yml (
  echo docker-compose.yml not found.
  pause
  exit /b 1
)

docker compose up --build
if errorlevel 1 (
  echo.
  echo Docker Compose failed.
  pause
  exit /b 1
)

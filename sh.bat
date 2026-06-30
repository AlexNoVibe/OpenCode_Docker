@echo off
chcp 65001 > nul

:: Get the name of the current directory
for %%I in (.) do set "CURRENT_DIR=%%~nxI"

echo Searching for container matching pattern: "%CURRENT_DIR%-opencode-run-*"
echo.

:: Find the container using the folder name as part of the filter
for /f "tokens=*" %%i in ('docker ps --filter "name=%CURRENT_DIR%-opencode-run-" --format "{{.Names}}"') do set "CONTAINER_NAME=%%i"

:: Check if the container was found
if "%CONTAINER_NAME%"=="" (
    echo [ERROR] Container starting with "%CURRENT_DIR%-opencode-run-" not found.
    echo.
    pause
    exit /b
)

echo Connecting to container: "%CONTAINER_NAME%"
echo To exit the container, type 'exit'
echo --------------------------------------------------

:: Start an interactive shell session inside the container
docker exec -it "%CONTAINER_NAME%" sh

echo --------------------------------------------------
echo Container session ended.
echo.
pause
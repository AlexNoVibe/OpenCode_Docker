@echo off
chcp 65001 > nul

for /f "tokens=*" %%i in ('docker ps --filter "name=-opencode-run-" --format "{{.Names}}"') do set "CONTAINER_NAME=%%i"

if "%CONTAINER_NAME%"=="" (
    echo [ERROR] Container with name *-opencode-run-* not found or not running.
    echo.
    pause
    exit /b
)

echo Connecting to container %CONTAINER_NAME%...
echo To exit the container, type 'exit'
echo --------------------------------------------------

:: 3. Start an interactive sh session inside the found container
docker exec -it %CONTAINER_NAME% sh

:: 4. This block runs immediately after you exit the container
echo --------------------------------------------------
echo Container session ended.
echo.
pause
@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

cd /d "%~dp0"

echo ============================================
echo   Kapuzinho 3D - Git Commit ^& Push
echo ============================================
echo.

git status
echo.

set /p MSG="Mensagem do commit (deixe vazio pra usar data/hora): "
if "%MSG%"=="" (
    for /f "tokens=1-4 delims=/ " %%a in ('date /t') do set DATAHOJE=%%a-%%b-%%c
    set HORAAGORA=%time%
    set MSG=Atualizacao catalogo - !DATAHOJE! !HORAAGORA!
)

echo.
echo ----------------------------------------------
echo git add -A
echo ----------------------------------------------
git add -A

echo.
echo ----------------------------------------------
echo git commit -m "!MSG!"
echo ----------------------------------------------
git commit -m "!MSG!"

if errorlevel 1 (
    echo.
    echo Nada pra commitar ou commit falhou. Nao vou tentar o push.
    goto FIM
)

echo.
echo ----------------------------------------------
echo git push
echo ----------------------------------------------
git push

echo.
echo ----------------------------------------------
echo Concluido.
echo ----------------------------------------------

:FIM
echo.
pause

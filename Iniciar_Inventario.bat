@echo off
title Robô de Inventário E-Estado v1.0 - by Izabel Galvao <3

cls
color 0F

echo.
echo      db    db    db    db    db    db    db    db    db    db
echo    .d88b .d88b .d88b .d88b .d88b .d88b .d88b .d88b .d88b .d88b
echo    8888888888888888888888888888888888888888888888888888888888
echo    `Y8888888888888888888888888888888888888888888888888888888P'
echo      `Y888888888888888888888888888888888888888888888888888P'
echo        `Y88888888888888888888888888888888888888888888888P'
echo          `Y8888888888888888888888888888888888888888888P'
echo            `Y888888888888888888888888888888888888888P'
echo              `Y88888888888888888888888888888888888P'
echo                `Y8888888888888888888888888888888P'
echo                  `Y888888888888888888888888888P'
echo                    `Y88888888888888888888888P'
echo                      `Y8888888888888888888P'
echo                        `Y888888888888888P'
echo                          `Y88888888888P'
echo                            `Y8888888P'
echo                              `Y888P'
echo                                `Y'
echo.
echo               RECLASSIFICACAO E CONFERENCIA
echo                    Feito com ^<3 por Izabel Galvao
echo.
echo ---------------------------------------------------------
echo.

SETLOCAL

:: Define o caminho para o executável do Chrome/Edge.
SET CHROME_PATH="C:\Program Files\Google\Chrome\Application\chrome.exe"
SET DEBUG_PORT=9222
SET EXECUTAVEL_ROBO="RoboInventario.exe"

:: 1. Tenta fechar o Chrome para garantir que a porta de depuração esteja livre.
echo [1/4] Tentando encerrar instancias antigas do Chrome...
taskkill /IM chrome.exe /F 2>nul
timeout /t 2 /nobreak >nul

:: 2. Inicia o Chrome no modo de depuração (debug) em uma nova janela.
echo [2/4] Iniciando Google Chrome no modo de depuracao (Porta %DEBUG_PORT%...
start "" %CHROME_PATH% --remote-debugging-port=%DEBUG_PORT% --user-data-dir="C:\temp_playwright"

:: Pausa de 5 segundos para o Chrome iniciar completamente
timeout /t 5 /nobreak >nul

:: 3. Executa o robô (RoboInventario.exe)
echo.
echo [3/4] Robô Iniciado. Por favor, faca o login no navegador.
echo =========================================================
%EXECUTAVEL_ROBO%

:: 4. Se o robô terminar, fecha a instância de depuração do Chrome.
echo.
echo [4/4] Automacao encerrada. Fechando o navegador de depuracao...
taskkill /IM chrome.exe /F 2>nul

echo.
echo ---------------------------------------------------------
echo Fim da execucao. Pressione qualquer tecla para fechar a janela...
pause >nul

ENDLOCAL
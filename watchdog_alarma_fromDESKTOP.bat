@echo off
setlocal

:: Ruta del archivo
set URL="C:\Users\ovm\Desktop\ALARMA FV.html"

:loop
echo Verificando estado...

:: Verificar si Edge esta corriendo
tasklist /FI "IMAGENAME eq msedge.exe" | find /I "msedge.exe" >nul
if errorlevel 1 (
    echo Edge no esta abierto =D abriendo alarma
    start msedge %URL%
    goto wait
)

:: Verificar si la ventana de la alarma esta abierta (por título)
tasklist /V /FI "IMAGENAME eq msedge.exe" | find /I "ALARMA FV" >nul
if errorlevel 1 (
    echo Edge abierto pero alarma no =D abriendo
    start msedge %URL%
) else (
    echo Alarma ya esta abierta, se subira el volumen

    :: Ajustar volumen a ~80%, sube 40 pasos
    for /l %%i in (1,1,40) do (
        powershell -command "(New-Object -ComObject WScript.Shell).SendKeys([char]175)"
    )

)

:wait
:: Espera 20 minutos (1200 segundos)
timeout /t 480 /nobreak >nul
goto loop



::view-source:http://172.20.51.120/SVIMA/web/web_arriba_hj.html
::view-source:http://172.20.51.120/SVIMA/otros/web/tr_vaac_smet120.html
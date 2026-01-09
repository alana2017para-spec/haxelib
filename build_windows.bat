@echo off
title Build HaxeFlixel EXE
cls

echo ===============================
echo  VERIFICANDO HAXE
echo ===============================

where haxe >nul 2>nul
if errorlevel 1 (
    echo Haxe nao encontrado.
    echo Instalando Haxe automaticamente...
    winget install --id HaxeFoundation.Haxe -e --silent
)

:: Recarrega PATH
set "PATH=%PATH%;C:\Program Files\HaxeToolkit\haxe"

echo ===============================
echo  CONFIGURANDO HAXELIB
echo ===============================

if not exist "%USERPROFILE%\haxelib" (
    mkdir "%USERPROFILE%\haxelib"
)

haxelib setup "%USERPROFILE%\haxelib"

echo ===============================
echo  INSTALANDO LIBS (FLIXEL)
echo ===============================

haxelib install lime --quiet
haxelib install openfl --quiet
haxelib install flixel --quiet
haxelib install flixel-addons --quiet
haxelib install flixel-ui --quiet
haxelib install hxcpp --quiet

echo ===============================
echo  SETUP OPENFL / LIME
echo ===============================

haxelib run lime setup -y
haxelib run openfl setup -y

echo ===============================
echo  BUILD WINDOWS (.EXE)
echo ===============================

lime build windows -release

echo ===============================
echo  FINALIZADO
echo ===============================
echo EXE EM: export\windows\bin\
pause
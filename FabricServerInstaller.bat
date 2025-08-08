@echo off
setlocal

REM Set base paths
set "BASE=C:\Users\%USERNAME%\FabricServer"
set "JAVA=%BASE%\java"
set "SERVER=%BASE%\MinecraftServer"
set "MODS=%SERVER%\mods"

REM 1. Create folders if they don't exist
if not exist "%BASE%" mkdir "%BASE%"
cd /d "%BASE%"

if not exist "%JAVA%" mkdir "%JAVA%"
if not exist "%SERVER%" mkdir "%SERVER%"
if not exist "%MODS%" mkdir "%MODS%"


if not exist "%JAVA%\javainstaller.msi" (  
    echo Downloading Java 
    powershell -Command "Invoke-WebRequest -Uri https://download.oracle.com/java/23/archive/jdk-23.0.2_windows-x64_bin.msi -OutFile '%JAVA%\javainstaller.msi'"
)

REM 5. Run Java setup
echo Running Java setup...
if not exist "%JAVA%\jdk-8u341-windows-x64." (
cd /d "%JAVA%"

)
REM 6. Download FabricServer.jar if not exist
if not exist "%SERVER%\fabric.jar" (
    echo Downloading FabricServer.jar...
    powershell -Command "Invoke-WebRequest -Uri https://lucgei231.github.io/Minecraft-Server-Data/FabricServer.jar -OutFile '%SERVER%\fabric.jar'"
)

REM 7. Download Geyser mod if not exist
if not exist "%MODS%\geyser.jar" (
    echo Downloading Geyser mod...
    powershell -Command "Invoke-WebRequest -Uri https://lucgei231.github.io/Minecraft-Server-Data/mods/geyser.jar -OutFile '%MODS%\geyser.jar'"
)

REM 8. Download Floodgate mod if not exist
if not exist "%MODS%\floodgate.jar" (
    echo Downloading Floodgate mod...
    powershell -Command "Invoke-WebRequest -Uri https://lucgei231.github.io/Minecraft-Server-Data/mods/floodgate.jar -OutFile '%MODS%\floodgate.jar'"
)

REM 9. Download ViaFabric mod if not exist
if not exist "%MODS%\ViaFabric-0.4.19+116-main.jar" (
    echo Downloading ViaFabric mod...
    powershell -Command "Invoke-WebRequest -Uri https://lucgei231.github.io/Minecraft-Server-Data/mods/viafabric.jar -OutFile '%MODS%\ViaFabric-0.4.19+116-main.jar'"
)

REM 10. Download ViaVersion mod if not exist
if not exist "%MODS%\ViaVersion-5.5.0-SNAPSHOT.jar" (
    echo Downloading ViaVersion mod...
    powershell -Command "Invoke-WebRequest -Uri https://lucgei231.github.io/Minecraft-Server-Data/mods/viaversion.jar -OutFile '%MODS%\ViaVersion-5.5.0-SNAPSHOT.jar'"
)

REM 11. Download ViaBackwards mod if not exist
if not exist "%MODS%\ViaBackwards-5.4.3-SNAPSHOT.jar" (
    echo Downloading ViaBackwards mod...
    powershell -Command "Invoke-WebRequest -Uri https://lucgei231.github.io/Minecraft-Server-Data/mods/viabackwards.jar -OutFile '%MODS%\ViaBackwards-5.4.3-SNAPSHOT.jar'"
)

REM Download Fabric API if not exist
if not exist "%MODS%\fabric-api-0.129.0+1.21.7.jar" (
    echo Downloading Fabric API...
    powershell -Command "Invoke-WebRequest -Uri https://lucgei231.github.io/Minecraft-Server-Data/mods/fabricapi.jar -OutFile '%MODS%\fabric-api-0.129.0+1.21.7.jar'"
)

REM 12. Change directory to server folder
cd /d "%SERVER%"
echo Starting server...
REM 13. Run server
%JAVA%\jdk-8u341-windows-x64.exe -Xmx3000M -jar fabric.jar
if errorlevel 1 (
    echo eula=true > eula.txt
)

endlocal

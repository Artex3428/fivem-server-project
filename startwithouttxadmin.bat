@echo off
cd /d "%~dp0server-data"
"..\cfx-server.exe" +exec server.cfg
pause
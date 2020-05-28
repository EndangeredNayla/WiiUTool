@echo off
rmdir bin /s /q
pyinstaller --onefile --icon="icon.ico" src/WiiUTool.py
rmdir build /s /q
REN dist bin
cd depends
COPY "decrypt.bat" "../bin"
COPY "decrypt.exe" "../bin"
COPY "libeay32.dll" "../bin"
COPY "msvcr120d.dll" "../bin"
PAUSE
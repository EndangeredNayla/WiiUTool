@echo off
:Select Directory
setlocal
set "psCommand="(new-object -COM 'Shell.Application')^
.BrowseForFolder(0,'Please choose a folder.',0,0).self.path""
for /f "usebackq delims=" %%I in (`powershell %psCommand%`) do set "folder=%%I"

:Stage Decrypter
COPY "decrypt.exe" "%folder%"
COPY "libeay32.dll" "%folder%"
COPY "msvcr120d.dll" "%folder%"

:Decrypt
cd %folder%
decrypt.exe title.tmd title.tik

:Clean Directory
mkdir out
MOVE "code" "out/code"
MOVE "content" "out/content"
MOVE "meta" "out/meta"

:Remove Decrypter
DEL "decrypt.exe"
DEL "libeay32.dll"
DEL "msvcr120d.dll"
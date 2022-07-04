@ECHO off
rem
rem Batch file to combine BASIC and assembly code into a single binary
rem
DEL mindscape-protection-basic.bas mindscape-protection-drivecode.bin mindscape-protection-installer.prg mindscape-protection-installer.d64
64tass -a -b mindscape-protection-drivecode.asm -o mindscape-protection-drivecode.bin
IF %ERRORLEVEL% GEQ 1 EXIT /B 1
COPY /a /y mindscape-protection-basic-head.bas mindscape-protection-basic.bas
IF %ERRORLEVEL% GEQ 1 EXIT /B 1
file2data 700 mindscape-protection-drivecode.bin >> mindscape-protection-basic.bas
IF %ERRORLEVEL% GEQ 1 EXIT /B 1
CAT mindscape-protection-basic.bas
petcat -w2 -o mindscape-protection-installer.prg -- mindscape-protection-basic.bas
IF %ERRORLEVEL% GEQ 1 EXIT /B 1
makedisk mindscape-protection-installer.d64 mindscape-protection-installer.seq "MINDSCAPE-FIXER!  -TCE-" 10
DEL mindscape-protection-basic.bas mindscape-protection-drivecode.bin mindscape-protection-installer.prg

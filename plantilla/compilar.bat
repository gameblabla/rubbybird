@echo off
cd src
echo Compilando...
..\..\bennu-win\bgdc -D -g plantilla.prg -a
move plantilla.dcb ..
pause
cd ..
..\bennu-win\bgdi plantilla.dcb -a

pause
exit
@echo off
cd src
echo Compilando...
..\..\bennu-win\bgdc plantilla.prg
move plantilla.dcb ..
cd ..

echo Exportando...
mkdir export
mkdir export\fpg
mkdir export\ogg
mkdir export\wav

copy fpg\*.fpg export\fpg
copy ogg\*.ogg export\ogg
copy ogg\*.s3m export\ogg
copy wav\*.wav export\wav
copy ..\bennu-win\*.dll export
copy ..\bennu-win\bgdi.exe export\plantilla.exe
copy plantilla.dcb export
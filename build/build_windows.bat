cd ..
mkdir binaries
cd binaries
mkdir KappaKappaShakeItUp
cd ..

tar -a -c -f KappaKappaShakeItUp.zip main.lua resource
move KappaKappaShakeItUp.zip binaries/KappaKappaShakeItUp/KappaKappaShakeItUp.love

cd binaries/KappaKappaShakeItUp

copy "C:\Program Files\LOVE\love.exe" .
copy "C:\Program Files\LOVE\license.txt" .
copy "C:\Program Files\LOVE\love.dll" .
copy "C:\Program Files\LOVE\lua51.dll" .
copy "C:\Program Files\LOVE\mpg123.dll" .
copy "C:\Program Files\LOVE\msvcp120.dll" .
copy "C:\Program Files\LOVE\msvcr120.dll" .
copy "C:\Program Files\LOVE\OpenAL32.dll" .
copy "C:\Program Files\LOVE\SDL2.dll" .

copy /b love.exe+KappaKappaShakeItUp.love KappaKappaShakeItUp.exe

del KappaKappaShakeItUp.love love.exe

explorer .

cd ../../build
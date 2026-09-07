cd ..
mkdir binaries
cd binaries
mkdir KappaKappaShakeItUp_Windows
cd ..

tar -a -c -f KappaKappaShakeItUp_Windows.zip main.lua resource
move KappaKappaShakeItUp_Windows.zip binaries/KappaKappaShakeItUp_Windows/KappaKappaShakeItUp_Windows.love

cd binaries/KappaKappaShakeItUp_Windows

copy "C:\Program Files\LOVE\love.exe" .
copy "C:\Program Files\LOVE\license.txt" .
copy "C:\Program Files\LOVE\love.dll" .
copy "C:\Program Files\LOVE\lua51.dll" .
copy "C:\Program Files\LOVE\mpg123.dll" .
copy "C:\Program Files\LOVE\msvcp120.dll" .
copy "C:\Program Files\LOVE\msvcr120.dll" .
copy "C:\Program Files\LOVE\OpenAL32.dll" .
copy "C:\Program Files\LOVE\SDL2.dll" .

copy /b love.exe+KappaKappaShakeItUp_Windows.love KappaKappaShakeItUp_Windows.exe

del KappaKappaShakeItUp_Windows.love love.exe

explorer .

cd ../../build
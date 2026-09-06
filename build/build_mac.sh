mkdir ../binaries
cp -r /Applications/love.app ../binaries/KappaKappaShakeItUp.app
cd ..
zip -9 -r binaries/KappaKappaShakeItUp.app/Contents/Resources/KappaKappaShakeItUp.love main.lua resource
cd build
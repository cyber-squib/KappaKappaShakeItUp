mkdir ../binaries
cp -r /Applications/love.app ../binaries/KappaKappaShakeItUp_Macintosh.app
cd ..
zip -9 -r binaries/KappaKappaShakeItUp_Macintosh.app/Contents/Resources/KappaKappaShakeItUp.love main.lua conf.lua resource
cd binaries
cp KappaKappaShakeItUp_Macintosh.app/Contents/Resources/KappaKappaShakeItUp.love .
open .
cd ../build
mkdir ../binaries
cp -r /Applications/love.app ../binaries/KappaKappaShakeItUp_Macintosh.app
cd ..
zip -9 -r binaries/KappaKappaShakeItUp_Macintosh.app/Contents/Resources/KappaKappaShakeItUp_Macintosh.love main.lua resource
cd binaries
open .
cd ../build
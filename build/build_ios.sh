xcodebuild -project love-11.5-ios-source/platform/xcode/love.xcodeproj -scheme love-ios build

open /Users/peterhodgden/Library/Developer/Xcode/DerivedData/love-emkhzukmpfhogygonfkqwruhpign/Build/Products/Debug-iphoneos

#sudo npm install -g ios-deploy
#ios-deploy --debug --bundle /Users/peterhodgden/Library/Developer/Xcode/DerivedData/love-emkhzukmpfhogygonfkqwruhpign/Build/Products/Debug-iphoneos/love.app

#xcrun devicectl list devices
xcrun devicectl device install app --device CD09C94C-711B-5FDA-AEF4-2439749A0847 /Users/peterhodgden/Library/Developer/Xcode/DerivedData/love-emkhzukmpfhogygonfkqwruhpign/Build/Products/Debug-iphoneos/love.app

xcrun devicectl device process launch --device CD09C94C-711B-5FDA-AEF4-2439749A0847 com.kappakappashakeitup.cybersquib

xcrun devicectl device info processes --device CD09C94C-711B-5FDA-AEF4-2439749A0847 | grep "love"

echo "xcrun devicectl device process terminate --device CD09C94C-711B-5FDA-AEF4-2439749A0847 --kill --pid <PID>"

echo -e "\a"
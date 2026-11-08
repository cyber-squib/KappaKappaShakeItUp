xcodebuild -project love-11.5-ios-source/platform/xcode/love.xcodeproj -scheme love-ios build

#sudo npm install -g ios-deploy
#ios-deploy --debug --bundle /Users/peterhodgden/Library/Developer/Xcode/DerivedData/love-emkhzukmpfhogygonfkqwruhpign/Build/Products/Debug-iphoneos/love.app

#xcrun devicectl list devices
xcrun devicectl device install app --device CD09C94C-711B-5FDA-AEF4-2439749A0847 /Users/peterhodgden/Library/Developer/Xcode/DerivedData/love-emkhzukmpfhogygonfkqwruhpign/Build/Products/Debug-iphoneos/love.app
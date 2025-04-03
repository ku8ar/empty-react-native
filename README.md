1. Create bundle and assets

npx react-native bundle \
  --platform ios \
  --dev false \
  --entry-file index.js \
  --bundle-output empty.bundle/main.jsbundle \
  --assets-dest empty.bundle

2. Compile RN dependencies as .xcframework [check -workspace]

chmod +x build_xcframework.sh
./build_xcframework.sh

3. Create entry point for iOS app

see ios/native/EmptyViewController.h
see ios/native/EmptyViewController.m

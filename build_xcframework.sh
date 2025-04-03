#!/bin/bash

# Path to the output folder for the generated .xcframeworks
OUTPUT_DIR="./ios/deps"

# App xcworkspace name
WORKSPACE="empty.xcworkspace"

mkdir -p "$OUTPUT_DIR"
cd ios

# Function that builds a single archive and corresponding .xcframework
build_framework() {
  SCHEME=$1
  ARCHIVE_PATH="build/${SCHEME}.xcarchive"
  FRAMEWORK_NAME=$2

  echo "\n Archiving ${SCHEME}..."
  xcodebuild archive \
    -workspace "$WORKSPACE" \
    -scheme "$SCHEME" \
    -destination "generic/platform=iOS" \
    -archivePath "$ARCHIVE_PATH" \
    SKIP_INSTALL=NO \
    BUILD_LIBRARY_FOR_DISTRIBUTION=YES

  echo "📦 Creating ${FRAMEWORK_NAME}.xcframework..."
  xcodebuild -create-xcframework \
    -framework "$ARCHIVE_PATH/Products/Library/Frameworks/${FRAMEWORK_NAME}.framework" \
    -output "$OUTPUT_DIR/${FRAMEWORK_NAME}.xcframework"
}

# List of frameworks to build (format: SchemeName:FrameworkFolderName)
declare -a FRAMEWORKS=(
  "React-Core:React_Core"
  "React-RCTBridge:React_RCTBridge"
  "React-RCTText:React_RCTText"
  "React-CoreModules:React_CoreModules"
  "ReactCommon:ReactCommon"
  # "RCT-Folly:RCTFolly"
  # "glog:glog"
  # "DoubleConversion:DoubleConversion"
)

# Loop through each framework entry and build it
for entry in "${FRAMEWORKS[@]}"; do
  IFS=":" read -r SCHEME FRAMEWORK <<< "$entry"
  build_framework "$SCHEME" "$FRAMEWORK"
done

echo "All .xcframeworks built in: $OUTPUT_DIR"

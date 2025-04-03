Pod::Spec.new do |s|
  s.name         = "empty"
  s.version      = "1.0.0"
  s.summary      = "Reusable screen built with React Native 0.75.5"
  s.description  = "Fully self-contained React Native screen delivered as a CocoaPod."
  s.homepage     = "https://github.com/your-org/empty"
  s.license      = "MIT"
  s.author       = { "Your Name" => "you@example.com" }
  s.source       = { :git => "https://github.com/your-org/empty.git", :tag => s.version }
  s.platform     = :ios, "12.0"
  s.static_framework = true

  # Main source code (Objective-C/Swift) if any
  s.source_files = "ios/native/**/*.{h,m,mm,swift}"

  # React Native JS bundle and assets
  # s.resources = [
  #   "ios/Resources/main.jsbundle",
  #   "ios/assets/**/*"
  # ]
  # s.resources = ['ios/Resources/main.jsbundle']
  s.resources = ['empty.bundle/**/*']


  # Precompiled .xcframework dependencies (React Native Core)
  s.vendored_frameworks = [
    "ios/deps/React-Core.xcframework",
    "ios/deps/React-RCTBridge.xcframework",
    "ios/deps/React-RCTText.xcframework",
    "ios/deps/React-CoreModules.xcframework",
    "ios/deps/ReactCommon.xcframework"
  ]

  s.vendored_libraries = [
    "ios/deps/libglog.a",
    "ios/deps/libDoubleConversion.a",
    "ios/deps/libRCT-Folly.a"
  ]
  s.header_mappings_dir = 'ios/headers'
  s.public_header_files = 'ios/headers/**/*.h'
end

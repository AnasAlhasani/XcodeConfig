Pod::Spec.new do |s|
  s.name         = "XcodeConfig"
  s.version      = "1.0.0"
  s.summary      = "Property wrapper that allows you to access build settings values through the `infoDictionary` property of Foundation’s `Bundle` API."
  s.homepage     = "https://github.com/AnasAlhasani/XcodeConfig"
  s.license      = "Apache"
  s.author       = "Anas Alhasani"
  s.source       = { :git => "https://github.com/AnasAlhasani/XcodeConfig.git", :tag => "#{s.version}" }
  s.source_files  = "Sources/**/*.swift"
  s.swift_version = '5.5'
end
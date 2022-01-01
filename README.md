# @XcodeConfig

Property wrapper that allows you to access build settings values through the `infoDictionary` property of Foundation’s `Bundle` API.

Create a build configuration file i.e `Development.xcconfig`:
```xcconfig
HOST = localhost
TIMEOUT = 15.0
```

In your `Info.plist` you can reference build settings values using the following syntax `$(BUILD_SETTING_NAME)`:
```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
    <dict>
        <key>HOST</key>
        <string>$(HOST)</string>
        <key>TIMEOUT</key>
        <string>$(TIMEOUT)</string>
    </dict>
</plist>
```

For example, adding `@XcodeConfig` like this:
```swift
enum API {
    @XcodeConfig(key: "HOST")
    static var host: String

    @XcodeConfig(key: "TIMEOUT")
    static var timeout: TimeInterval
}
```

will access build settings values: `"localhost"` and `15.0` which are defined in `Development.xcconfig`.

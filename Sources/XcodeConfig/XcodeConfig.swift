//
//  XcodeConfig.swift
//
//  Created by Anas Alhasani on 01/01/2022.
//

import Foundation

/// Property wrapper that allows you to access build settings values
/// through the `infoDictionary` property of Foundation’s `Bundle` API.
///
/// Create a build configuration file i.e `Development.xcconfig`:
/// ```xcconfig
/// HOST = localhost
/// TIMEOUT = 15.0
/// ```
///
/// In your `Info.plist` you can reference build settings values using the following syntax `$(BUILD_SETTING_NAME)`:
/// ```xml
/// <?xml version="1.0" encoding="UTF-8"?>
/// <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
/// <plist version="1.0">
/// <dict>
///     <key>HOST</key>
///     <string>$(HOST)</string>
///     <key>TIMEOUT</key>
///     <string>$(TIMEOUT)</string>
/// </dict>
/// </plist>
/// ```
///
/// For example, adding `@XcodeConfig` like this:
/// ```swift
/// enum API {
///     @XcodeConfig(key: "HOST")
///     static var host: String
///
///     @XcodeConfig(key: "TIMEOUT")
///     static var timeout: TimeInterval
/// }
/// ```
/// will access build settings values: `"localhost"` and `15.0`
/// which are defined in `Development.xcconfig`.
/// 
@propertyWrapper
public struct XcodeConfig<Value: LosslessStringConvertible> {
    
    // MARK: Private Properties
    
    private let key: String
    private let bundle: Bundle
    
    // MARK: Public Properties
    
    public var wrappedValue: Value { value(for: key) }
    
    // MARK: Init
    
    public init(key: String, bundle: Bundle = .main) {
        self.key = key
        self.bundle = bundle
    }
    
    // MARK: Implementation
    
    private func value(for key: String) -> Value {
        guard let object = bundle.object(forInfoDictionaryKey: key) else {
            fatalError("Missing key: \(key)")
        }

        switch object {
        case let value as Value:
            return value
            
        case let string as String:
            guard let value = Value(string) else { fallthrough }
            return value
            
        default:
            fatalError("Invalid Value")
        }
    }
}

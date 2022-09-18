//
//  BundleProvider.swift
//
//  Created by Anas Alhasani on 18/09/2022.
//

import Foundation

/// An abstraction for Foundation’s `Bundle` API.
public protocol BundleProvider {

    /// Returns the value associated with the specified key in the receiver's information property list.
    /// - Parameter key: A key in the receiver's property list.
    /// - Returns: The value associated with key in the receiver's property list (Info.plist). The localized value of a key is returned when one is available.
    func object(forInfoDictionaryKey key: String) -> Any?
}

public extension BundleProvider where Self == Bundle {
    /// Returns the bundle object that contains the current executable.
    static var main: Self {
        .main
    }
}

extension Bundle: BundleProvider {}

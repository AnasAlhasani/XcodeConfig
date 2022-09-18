//
//  MockBundle.swift
//
//  Created by Anas Alhasani on 18/09/2022.
//

import Foundation
import XcodeConfig

struct MockBundle: BundleProvider {
    private(set) var dictionary: [String: Any]

    init(dictionary: [String: Any]) {
        self.dictionary = dictionary
    }

    func object(forInfoDictionaryKey key: String) -> Any? {
        dictionary[key]
    }
}

extension BundleProvider where Self == MockBundle {
    static var mock: MockBundle {
        .init(dictionary: [
            "STRING_KEY": "Hello, world!",
            "INT_KEY": 1,
            "DOUBLE_KEY": 10.0,
            "BOOL_KEY": true
        ])
    }
}

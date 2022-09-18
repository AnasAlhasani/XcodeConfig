//
//  XcodeConfigTests.swift
//
//  Created by Anas Alhasani on 18/09/2022.
//

import Foundation
import XcodeConfig
import XCTest

final class XcodeConfigTests: XCTestCase {
    func testConfigs() {
        @XcodeConfig(key: "STRING_KEY", bundle: .mock)
        var string: String
        @XcodeConfig(key: "INT_KEY", bundle: .mock)
        var int: Int
        @XcodeConfig(key: "DOUBLE_KEY", bundle: .mock)
        var double: Double
        @XcodeConfig(key: "BOOL_KEY", bundle: .mock)
        var bool: Bool

        XCTAssertEqual(string, "Hello, world!")
        XCTAssertEqual(int, 1)
        XCTAssertEqual(double, 10.0)
        XCTAssertEqual(bool, true)
    }
}

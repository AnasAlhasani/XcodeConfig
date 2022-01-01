// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "XcodeConfig",
    products: [
        .library(name: "XcodeConfig", targets: ["XcodeConfig"])
    ],
    targets: [
        .target(name: "XcodeConfig"),
        .testTarget(
            name: "XcodeConfigTests",
            dependencies: ["XcodeConfig"]
        )
    ]
)

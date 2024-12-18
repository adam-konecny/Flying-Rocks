// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Modules",
    defaultLocalization: "en",
    platforms: [.iOS(.v18)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Helpers",
            targets: ["Helpers"]),
        .library(
            name: "Location",
            targets: ["Location"]),
        .library(
            name: "Design",
            targets: ["Design"])
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Helpers",
            resources: [
                .process("Localizable.xcstrings")
            ]
        ),
        .testTarget(
            name: "HelpersTests",
            dependencies: ["Helpers"]
        ),
        .target(
            name: "Location"
        ),
        .target(
            name: "Design"
        )
    ]
)

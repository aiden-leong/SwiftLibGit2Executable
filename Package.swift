// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftLibGit2Executable",
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/andy1247008998/Clibgit2.git", from: "1.0.9")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "SwiftLibGit2Executable",
            dependencies: []),
        .testTarget(
            name: "SwiftLibGit2ExecutableTests",
            dependencies: ["SwiftLibGit2Executable"]),
    ]
)

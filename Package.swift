// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "ITViewKit",
    products: [
        .library(name: "ITViewKit", targets: ["ITViewKit"]),
    ],
    dependencies: [],
    targets: [
        .target(name: "ITViewKit", dependencies: []),
        .testTarget(name: "ITViewKitTests", dependencies: ["ITViewKit"]),
    ]
)

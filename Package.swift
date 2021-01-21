// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "ITViewKit",
    platforms: [.iOS(.v11)],
    products: [
        .library(name: "ITViewKit", targets: ["ITViewKit"]),
    ],
    dependencies: [],
    targets: [
        .target(name: "ITViewKit", dependencies: []),
        .testTarget(name: "ITViewKitTests", dependencies: ["ITViewKit"]),
    ]
)

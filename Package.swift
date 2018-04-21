// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "SwiftResources",
    products: [
        .library(name: "SwiftResources", targets: ["SwiftResources"])
    ],
    dependencies: [],
    targets: [
        .target(
            name: "SwiftResources",
            dependencies: []
        )
    ]
)

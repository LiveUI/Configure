// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "Configure",
    products: [
        .library(name: "Configure", targets: ["Configure"])
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Configure",
            dependencies: []
        )
    ]
)

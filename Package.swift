// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ExperienceServices",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(name: "ExperienceServices", targets: ["ExperienceServices"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(name: "ExperienceServices", dependencies: [], path: "Sources/Source"),
        .testTarget(name: "ExperienceServicesTests", dependencies: ["ExperienceServices"]),
    ]
)

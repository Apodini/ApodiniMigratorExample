// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ApodiniMigratorExampleClientGRPC",
    platforms: [
        .macOS(.v12), .iOS(.v15)
    ],
    products: [
        .library(name: "ApodiniMigratorExampleClientGRPC", targets: ["ApodiniMigratorExampleClientGRPC"])
    ],
    dependencies: [
        .package(url: "https://github.com/grpc/grpc-swift.git", .exact("1.6.0-async-await.1")),
        .package(url: "https://github.com/Apodini/ApodiniMigrator.git", .upToNextMinor(from: "0.3.0"))
    ],
    targets: [
        .target(
            name: "ApodiniMigratorExampleClientGRPC",
            dependencies: [
                .product(name: "GRPC", package: "grpc-swift"),.product(name: "ApodiniMigratorClientSupport", package: "ApodiniMigrator")
            ],
            resources: [
                .process("Resources")
            ]
        )
    ]
)

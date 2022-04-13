// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.
//
// This source file is part of the Apodini open source project
//
// SPDX-FileCopyrightText: 2019-2021 Paul Schmiedmayer and the Apodini project authors (see CONTRIBUTORS.md) <paul.schmiedmayer@tum.de>
//
// SPDX-License-Identifier: MIT
//


import PackageDescription

let package = Package(
    name: "ApodiniMigratorExampleClient",
    platforms: [
        .macOS(.v11), .iOS(.v13)
    ],
    products: [
        .library(name: "ApodiniMigratorExampleClient", targets: ["ApodiniMigratorExampleClient"])
    ],
    dependencies: [
        .package(url: "https://github.com/Apodini/ApodiniMigrator.git", .upToNextMinor(from: "0.2.0"))
    ],
    targets: [
        .executableTarget(
            name: "ExampleClient",
            dependencies: [
                .target(name: "ApodiniMigratorExampleClient")
            ]
        ),
        .target(
            name: "ApodiniMigratorExampleClient",
            dependencies: [
                .product(name: "ApodiniMigratorClientSupport", package: "ApodiniMigrator")
            ],
            resources: [
                .process("Resources")
            ]
        ),
        .testTarget(
            name: "ApodiniMigratorExampleClientTests",
            dependencies: [
                .target(name: "ApodiniMigratorExampleClient")
            ]
        )
    ]
)

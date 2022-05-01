// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.
//
// This source file is part of the Apodini open source project
//
// SPDX-FileCopyrightText: 2019-2022 Paul Schmiedmayer and the Apodini project authors (see CONTRIBUTORS.md) <paul.schmiedmayer@tum.de>
//
// SPDX-License-Identifier: MIT
//

import PackageDescription

let package = Package(
    name: "ApodiniMigratorExampleClientREST",
    platforms: [
        .macOS(.v11), .iOS(.v13)
    ],
    products: [
        .library(name: "ApodiniMigratorExampleClientREST", targets: ["ApodiniMigratorExampleClientREST"])
    ],
    dependencies: [
        .package(url: "https://github.com/Apodini/ApodiniMigrator.git", .upToNextMinor(from: "0.3.0"))
    ],
    targets: [
        .target(
            name: "ApodiniMigratorExampleClientREST",
            dependencies: [
                .product(name: "ApodiniMigratorClientSupport", package: "ApodiniMigrator")
            ],
            resources: [
                .process("Resources")
            ]
        ),
        .testTarget(
            name: "ApodiniMigratorExampleClientRESTTests",
            dependencies: [
                .target(name: "ApodiniMigratorExampleClientREST")
            ]
        )
    ]
)

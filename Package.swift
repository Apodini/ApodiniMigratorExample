// swift-tools-version:5.5

//
// This source file is part of the Apodini open source project
//
// SPDX-FileCopyrightText: 2019-2021 Paul Schmiedmayer and the Apodini project authors (see CONTRIBUTORS.md) <paul.schmiedmayer@tum.de>
//
// SPDX-License-Identifier: MIT
//

import PackageDescription


private let dependencies: [Target.Dependency] = [
    .product(name: "Apodini", package: "Apodini"),
    .product(name: "ApodiniREST", package: "Apodini"),
    .product(name: "ApodiniGRPC", package: "Apodini"),
    .product(name: "ApodiniMigration", package: "Apodini"),
    .target(name: "Shared")
]

let package = Package(
    name: "ApodiniMigratorExample",
    platforms: [
        .macOS(.v11)
    ],
    dependencies: [
        .package(url: "https://github.com/Apodini/Apodini.git", .upToNextMinor(from: "0.9.0"))
    ],
    targets: [
        .executableTarget(
            name: "QONECTIQV1",
            dependencies: dependencies,
            resources: [
                .process("Resources")
            ]
        ),
        .executableTarget(
            name: "QONECTIQV2",
            dependencies: dependencies,
            resources: [
                .process("Resources")
            ]
        ),
        .target(
            name: "Shared",
            dependencies: [
                .product(name: "Apodini", package: "Apodini"),
                .product(name: "ApodiniMigration", package: "Apodini")
            ]
        )
    ]
)

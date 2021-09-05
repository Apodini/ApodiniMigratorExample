//
// This source file is part of the Apodini open source project
//
// SPDX-FileCopyrightText: 2019-2021 Paul Schmiedmayer and the Apodini project authors (see CONTRIBUTORS.md) <paul.schmiedmayer@tum.de>
//
// SPDX-License-Identifier: MIT
//

import Foundation
import Apodini
import ApodiniMigrator

public protocol MigratorContent: Content, ApodiniMigratorCodable {}

public extension MigratorContent {
    static func instance(or apodiniError: ApodiniError) throws -> Self {
        do {
            return try defaultValue()
        } catch {
            throw apodiniError
        }
    }
}

public extension ApodiniMigratorEncodable {
    static var encoder: JSONEncoder {
        .init()
    }
}

public extension ApodiniMigratorDecodable {
    static var decoder: JSONDecoder {
        .init()
    }
}

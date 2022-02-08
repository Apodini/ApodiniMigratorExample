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
    /// Create an instance using `defaultValue` or return the given `ApodiniError`.
    static func instance(or apodiniError: ApodiniError) throws -> Self {
        do {
            return try defaultValue()
        } catch {
            throw apodiniError
        }
    }
}

public extension ApodiniMigratorEncodable {
    /// The encoder
    static var encoder: JSONEncoder {
        .init()
    }
}

public extension ApodiniMigratorDecodable {
    /// The decoder
    static var decoder: JSONDecoder {
        .init()
    }
}

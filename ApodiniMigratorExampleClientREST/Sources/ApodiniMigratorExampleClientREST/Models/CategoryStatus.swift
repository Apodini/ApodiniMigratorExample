//
// This source file is part of the Apodini open source project
//
// SPDX-FileCopyrightText: 2019-2022 Paul Schmiedmayer and the Apodini project authors (see CONTRIBUTORS.md) <paul.schmiedmayer@tum.de>
//
// SPDX-License-Identifier: MIT
//

import Foundation

// MARK: - Model
@available(*, message: "This enum is not used in the new version anymore!")
public enum CategoryStatus: String, Codable, CaseIterable {
    case available
    case unavailable
    
    // MARK: - Deprecated
    private static let deprecatedCases: [Self] = []
    
    // MARK: - Encodable
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        try container.encode(try encodableValue().rawValue)
    }
    
    // MARK: - Decodable
    public init(from decoder: Decoder) throws {
        self = Self(rawValue: try decoder.singleValueContainer().decode(RawValue.self)) ?? .available
    }
    
    // MARK: - Utils
    private func encodableValue() throws -> Self {
        let deprecated = Self.deprecatedCases
        guard deprecated.contains(self) else {
            return self
        }
        throw ApodiniError(code: 404, message: "The web service does not support the cases of this enum anymore")
    }
}

// MARK: - CustomStringConvertible
extension CategoryStatus: CustomStringConvertible {
    /// Textual representation
    public var description: String {
        rawValue.description
    }
}

// MARK: - LosslessStringConvertible
extension CategoryStatus: LosslessStringConvertible {
    /// Instantiates an instance of the conforming type from a string representation.
    public init?(_ description: String) {
        self.init(rawValue: description)
    }
}

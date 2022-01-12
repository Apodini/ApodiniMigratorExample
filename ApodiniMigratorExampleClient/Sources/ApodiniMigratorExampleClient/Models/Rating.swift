//
//  Created by ApodiniMigrator on 12.01.22
//  Copyright © 2022 TUM LS1. All rights reserved.
//

import Foundation

// MARK: - Model
public enum Rating: String, Codable, CaseIterable {
    case exceedsExpectation
    case meetsExpectation
    case needsImprovement
    case outstanding
    case unacceptable = "terrible"
    case undefined
    
    // MARK: - Deprecated
    private static let deprecatedCases: [Self] = [.undefined]
    
    // MARK: - Encodable
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        try container.encode(try encodableValue().rawValue)
    }
    
    // MARK: - Decodable
    public init(from decoder: Decoder) throws {
        self = Self(rawValue: try decoder.singleValueContainer().decode(RawValue.self)) ?? .exceedsExpectation
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
extension Rating: CustomStringConvertible {
    /// Textual representation
    public var description: String {
        rawValue.description
    }
}

// MARK: - LosslessStringConvertible
extension Rating: LosslessStringConvertible {
    /// Instantiates an instance of the conforming type from a string representation.
    public init?(_ description: String) {
        self.init(rawValue: description)
    }
}

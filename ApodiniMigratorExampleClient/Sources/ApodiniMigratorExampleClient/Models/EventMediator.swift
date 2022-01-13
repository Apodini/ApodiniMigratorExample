//
// This source file is part of the Apodini open source project
//
// SPDX-FileCopyrightText: 2019-2021 Paul Schmiedmayer and the Apodini project authors (see CONTRIBUTORS.md) <paul.schmiedmayer@tum.de>
//
// SPDX-License-Identifier: MIT
//

import Foundation

// MARK: - Model
public struct EventMediator: Codable {
    // MARK: - CodingKeys
    private enum CodingKeys: String, CodingKey {
        case date
        case duration
        case maxParticipants
    }
    
    // MARK: - Properties
    public var date: Date?
    public var duration: UInt?
    public var maxParticipants: UInt?
    
    // MARK: - Initializer
    public init(
        date: Date?,
        duration: UInt?,
        maxParticipants: UInt?
    ) {
        self.date = date
        self.duration = duration
        self.maxParticipants = maxParticipants
    }
    
    // MARK: - Encodable
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encodeIfPresent(date, forKey: .date)
        try container.encodeIfPresent(duration, forKey: .duration)
        try container.encode(maxParticipants ?? (try UInt.instance(from: 0)), forKey: .maxParticipants)
    }
    
    // MARK: - Decodable
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        date = try container.decodeIfPresent(Date.self, forKey: .date)
        duration = try container.decodeIfPresent(UInt.self, forKey: .duration)
        maxParticipants = try container.decodeIfPresent(UInt.self, forKey: .maxParticipants)
    }
}

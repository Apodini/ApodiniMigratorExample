//
// This source file is part of the Apodini open source project
//
// SPDX-FileCopyrightText: 2019-2022 Paul Schmiedmayer and the Apodini project authors (see CONTRIBUTORS.md) <paul.schmiedmayer@tum.de>
//
// SPDX-License-Identifier: MIT
//

import Foundation

// MARK: - Model
public struct UserStatistic: Codable {
    // MARK: - CodingKeys
    private enum CodingKeys: String, CodingKey {
        case badge
        case createdEventsCount
        case participatingEventsCount
        case registeredSince
        case topCategory
        case userID
    }
    
    // MARK: - Properties
    public var badge: UserBadge
    public var createdEventsCount: UInt
    public var participatingEventsCount: UInt
    public var registeredSince: Date
    public var topCategory: EventCategory
    public var userID: UUID
    
    // MARK: - Initializer
    public init(
        badge: UserBadge,
        createdEventsCount: UInt,
        participatingEventsCount: UInt,
        registeredSince: Date,
        topCategory: EventCategory,
        userID: UUID
    ) {
        self.badge = badge
        self.createdEventsCount = createdEventsCount
        self.participatingEventsCount = participatingEventsCount
        self.registeredSince = registeredSince
        self.topCategory = topCategory
        self.userID = userID
    }
    
    // MARK: - Encodable
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(badge, forKey: .badge)
        try container.encode(createdEventsCount, forKey: .createdEventsCount)
        try container.encode(participatingEventsCount, forKey: .participatingEventsCount)
        try container.encode(registeredSince, forKey: .registeredSince)
        try container.encode(topCategory, forKey: .topCategory)
        try container.encode(userID, forKey: .userID)
    }
    
    // MARK: - Decodable
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        badge = try container.decode(UserBadge.self, forKey: .badge)
        createdEventsCount = try container.decode(UInt.self, forKey: .createdEventsCount)
        participatingEventsCount = try container.decode(UInt.self, forKey: .participatingEventsCount)
        registeredSince = try container.decode(Date.self, forKey: .registeredSince)
        topCategory = try container.decode(EventCategory.self, forKey: .topCategory)
        userID = try container.decode(UUID.self, forKey: .userID)
    }
}

//
// This source file is part of the Apodini open source project
//
// SPDX-FileCopyrightText: 2019-2021 Paul Schmiedmayer and the Apodini project authors (see CONTRIBUTORS.md) <paul.schmiedmayer@tum.de>
//
// SPDX-License-Identifier: MIT
//

import Foundation

// MARK: - Model
public struct HomeFeedEvent: Codable {
    // MARK: - CodingKeys
    private enum CodingKeys: String, CodingKey {
        case eventID
        case eventsCount
        case imageURL
        case subtitle = "secondaryTitle"
        case title
    }
    
    // MARK: - Properties
    public var eventID: UUID
    public var eventsCount: UInt
    public var imageURL: URL
    public var subtitle: String
    public var title: String
    
    // MARK: - Initializer
    public init(
        eventID: UUID,
        eventsCount: UInt,
        imageURL: URL,
        subtitle: String,
        title: String
    ) {
        self.eventID = eventID
        self.eventsCount = eventsCount
        self.imageURL = imageURL
        self.subtitle = subtitle
        self.title = title
    }
    
    // MARK: - Encodable
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(eventID, forKey: .eventID)
        try container.encode(eventsCount, forKey: .eventsCount)
        try container.encode(try String.from(imageURL, script: 26), forKey: .imageURL)
        try container.encode(subtitle, forKey: .subtitle)
        try container.encode(title, forKey: .title)
    }
    
    // MARK: - Decodable
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        eventID = try container.decode(UUID.self, forKey: .eventID)
        eventsCount = try container.decode(UInt.self, forKey: .eventsCount)
        imageURL = try URL.from(try container.decode(String.self, forKey: .imageURL), script: 27)
        subtitle = try container.decode(String.self, forKey: .subtitle)
        title = try container.decode(String.self, forKey: .title)
    }
}

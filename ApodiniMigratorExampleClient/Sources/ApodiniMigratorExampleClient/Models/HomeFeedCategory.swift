//
// This source file is part of the Apodini open source project
//
// SPDX-FileCopyrightText: 2019-2021 Paul Schmiedmayer and the Apodini project authors (see CONTRIBUTORS.md) <paul.schmiedmayer@tum.de>
//
// SPDX-License-Identifier: MIT
//

import Foundation

// MARK: - Model
public struct HomeFeedCategory: Codable {
    // MARK: - CodingKeys
    private enum CodingKeys: String, CodingKey {
        case categoryID
        case eventsCount = "eventsAmount"
        case imageURL
        case title
    }
    
    // MARK: - Properties
    public var categoryID: UUID
    public var eventsCount: UInt
    public var imageURL: URL
    public var title: String
    
    // MARK: - Initializer
    public init(
        categoryID: UUID,
        eventsCount: UInt,
        imageURL: URL,
        title: String
    ) {
        self.categoryID = categoryID
        self.eventsCount = eventsCount
        self.imageURL = imageURL
        self.title = title
    }
    
    // MARK: - Encodable
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(categoryID, forKey: .categoryID)
        try container.encode(eventsCount, forKey: .eventsCount)
        try container.encode(imageURL, forKey: .imageURL)
        try container.encode(title, forKey: .title)
    }
    
    // MARK: - Decodable
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        categoryID = try container.decode(UUID.self, forKey: .categoryID)
        eventsCount = try container.decode(UInt.self, forKey: .eventsCount)
        imageURL = try container.decode(URL.self, forKey: .imageURL)
        title = try container.decode(String.self, forKey: .title)
    }
}

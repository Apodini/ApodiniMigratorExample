//
// This source file is part of the Apodini open source project
//
// SPDX-FileCopyrightText: 2019-2021 Paul Schmiedmayer and the Apodini project authors (see CONTRIBUTORS.md) <paul.schmiedmayer@tum.de>
//
// SPDX-License-Identifier: MIT
//

import Foundation

// MARK: - Model
public struct HomeFeed: Codable {
    // MARK: - CodingKeys
    private enum CodingKeys: String, CodingKey {
        case categories
        case events
        case greeting
        case id
        case searchBarText
        case subtitle
        case theme
        case userID
    }
    
    // MARK: - Properties
    public var categories: [HomeFeedCategory]
    public var events: [HomeFeedEvent]
    public var greeting: String
    public var id: UUID
    public var searchBarText: String
    public var subtitle: String
    public var theme: HomeFeedTheme
    public var userID: UUID
    
    // MARK: - Initializer
    public init(
        categories: [HomeFeedCategory],
        events: [HomeFeedEvent],
        greeting: String,
        id: UUID,
        searchBarText: String,
        subtitle: String,
        theme: HomeFeedTheme = try! HomeFeedTheme.instance(from: 1),
        userID: UUID
    ) {
        self.categories = categories
        self.events = events
        self.greeting = greeting
        self.id = id
        self.searchBarText = searchBarText
        self.subtitle = subtitle
        self.theme = theme
        self.userID = userID
    }
    
    // MARK: - Encodable
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(try [HomeFeedCategory].from(categories, script: 14), forKey: .categories)
        try container.encode(try [HomeFeedEvent].from(events, script: 12), forKey: .events)
        try container.encode(greeting, forKey: .greeting)
        try container.encode(id, forKey: .id)
        try container.encode(searchBarText, forKey: .searchBarText)
        try container.encode(subtitle, forKey: .subtitle)
        try container.encode(theme, forKey: .theme)
        try container.encode(userID, forKey: .userID)
    }
    
    // MARK: - Decodable
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        categories = try [HomeFeedCategory].from(try container.decode([HomeFeedCategory].self, forKey: .categories), script: 15)
        events = try [HomeFeedEvent].from(try container.decode([HomeFeedEvent].self, forKey: .events), script: 13)
        greeting = try container.decode(String.self, forKey: .greeting)
        id = try container.decode(UUID.self, forKey: .id)
        searchBarText = try container.decode(String.self, forKey: .searchBarText)
        subtitle = try container.decode(String.self, forKey: .subtitle)
        theme = try container.decode(HomeFeedTheme.self, forKey: .theme)
        userID = try container.decode(UUID.self, forKey: .userID)
    }
}

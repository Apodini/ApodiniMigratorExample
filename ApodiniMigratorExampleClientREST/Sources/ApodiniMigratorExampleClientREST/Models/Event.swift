//
// This source file is part of the Apodini open source project
//
// SPDX-FileCopyrightText: 2019-2021 Paul Schmiedmayer and the Apodini project authors (see CONTRIBUTORS.md) <paul.schmiedmayer@tum.de>
//
// SPDX-License-Identifier: MIT
//

import Foundation

// MARK: - Model
public struct Event: Codable {
    // MARK: - CodingKeys
    private enum CodingKeys: String, CodingKey {
        case category
        case date
        case duration
        case id
        case imagePath
        case location
        case maxParticipants
        case organizer
        case reviews
        case summary
        case tags
        case title
    }
    
    // MARK: - Properties
    public var category: EventCategory
    public var date: Date
    public var duration: UInt
    public var id: UUID
    public var imagePath: URL
    public var location: String
    public var maxParticipants: UInt?
    public var organizer: UUID
    public var reviews: [Review]
    public var summary: String
    public var tags: [String]
    public var title: String
    
    // MARK: - Initializer
    public init(
        category: EventCategory,
        date: Date,
        duration: UInt,
        id: UUID,
        imagePath: URL,
        location: String = try! String.instance(from: 2),
        maxParticipants: UInt?,
        organizer: UUID,
        reviews: [Review],
        summary: String,
        tags: [String],
        title: String
    ) {
        self.category = category
        self.date = date
        self.duration = duration
        self.id = id
        self.imagePath = imagePath
        self.location = location
        self.maxParticipants = maxParticipants
        self.organizer = organizer
        self.reviews = reviews
        self.summary = summary
        self.tags = tags
        self.title = title
    }
    
    // MARK: - Encodable
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(category, forKey: .category)
        try container.encode(date, forKey: .date)
        try container.encode(duration, forKey: .duration)
        try container.encode(id, forKey: .id)
        try container.encode(imagePath, forKey: .imagePath)
        try container.encode(location, forKey: .location)
        try container.encode(maxParticipants ?? (try UInt.instance(from: 3)), forKey: .maxParticipants)
        try container.encode(organizer, forKey: .organizer)
        try container.encode(try [Review].from(reviews, script: 16), forKey: .reviews)
        try container.encode(summary, forKey: .summary)
        try container.encode(tags, forKey: .tags)
        try container.encode(title, forKey: .title)
    }
    
    // MARK: - Decodable
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        category = try container.decode(EventCategory.self, forKey: .category)
        date = try container.decode(Date.self, forKey: .date)
        duration = try container.decode(UInt.self, forKey: .duration)
        id = try container.decode(UUID.self, forKey: .id)
        imagePath = try container.decode(URL.self, forKey: .imagePath)
        location = try container.decode(String.self, forKey: .location)
        maxParticipants = try container.decodeIfPresent(UInt.self, forKey: .maxParticipants)
        organizer = try container.decode(UUID.self, forKey: .organizer)
        reviews = try [Review].from(try container.decode([Review].self, forKey: .reviews), script: 17)
        summary = try container.decode(String.self, forKey: .summary)
        tags = try container.decode([String].self, forKey: .tags)
        title = try container.decode(String.self, forKey: .title)
    }
}

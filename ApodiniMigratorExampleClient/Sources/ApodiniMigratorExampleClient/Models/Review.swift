//
//  Created by ApodiniMigrator on 12.01.22
//  Copyright © 2022 TUM LS1. All rights reserved.
//

import Foundation

// MARK: - Model
public struct Review: Codable {
    // MARK: - CodingKeys
    private enum CodingKeys: String, CodingKey {
        case content
        case displayReviewerName
        case eventID
        case id
        case rating
        case reviewerID
        case summary
        case title
    }
    
    // MARK: - Properties
    public var content: String
    public var displayReviewerName: Bool
    public var eventID: UUID
    public var id: UUID
    public var rating: Rating
    public var reviewerID: UUID
    public var summary: String
    public var title: String
    
    // MARK: - Initializer
    public init(
        content: String,
        displayReviewerName: Bool = try! Bool.instance(from: 4),
        eventID: UUID,
        id: UUID,
        rating: Rating,
        reviewerID: UUID,
        summary: String,
        title: String
    ) {
        self.content = content
        self.displayReviewerName = displayReviewerName
        self.eventID = eventID
        self.id = id
        self.rating = rating
        self.reviewerID = reviewerID
        self.summary = summary
        self.title = title
    }
    
    // MARK: - Encodable
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(content, forKey: .content)
        try container.encode(displayReviewerName, forKey: .displayReviewerName)
        try container.encode(eventID, forKey: .eventID)
        try container.encode(id, forKey: .id)
        try container.encode(try Rating.from(rating, script: 20), forKey: .rating)
        try container.encode(reviewerID, forKey: .reviewerID)
        try container.encode(summary, forKey: .summary)
        try container.encode(title, forKey: .title)
    }
    
    // MARK: - Decodable
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        content = try container.decode(String.self, forKey: .content)
        displayReviewerName = try container.decode(Bool.self, forKey: .displayReviewerName)
        eventID = try container.decode(UUID.self, forKey: .eventID)
        id = try container.decode(UUID.self, forKey: .id)
        rating = try Rating.from(try container.decode(Rating.self, forKey: .rating), script: 21)
        reviewerID = try container.decode(UUID.self, forKey: .reviewerID)
        summary = try container.decode(String.self, forKey: .summary)
        title = try container.decode(String.self, forKey: .title)
    }
}

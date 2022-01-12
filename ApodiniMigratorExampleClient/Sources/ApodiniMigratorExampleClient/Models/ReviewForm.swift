//
// This source file is part of the Apodini open source project
//
// SPDX-FileCopyrightText: 2019-2021 Paul Schmiedmayer and the Apodini project authors (see CONTRIBUTORS.md) <paul.schmiedmayer@tum.de>
//
// SPDX-License-Identifier: MIT
//

import Foundation

// MARK: - Model
public struct ReviewForm: Codable {
    // MARK: - CodingKeys
    private enum CodingKeys: String, CodingKey {
        case content
        case rating
        case summary
        case title
    }
    
    // MARK: - Properties
    public var content: String
    public var rating: Rating
    public var summary: String
    public var title: String
    
    // MARK: - Initializer
    public init(
        content: String,
        rating: Rating,
        summary: String,
        title: String
    ) {
        self.content = content
        self.rating = rating
        self.summary = summary
        self.title = title
    }
    
    // MARK: - Encodable
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(content, forKey: .content)
        try container.encode(try Rating.from(rating, script: 24), forKey: .rating)
        try container.encode(summary, forKey: .summary)
        try container.encode(title, forKey: .title)
    }
    
    // MARK: - Decodable
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        content = try container.decode(String.self, forKey: .content)
        rating = try Rating.from(try container.decode(Rating.self, forKey: .rating), script: 25)
        summary = try container.decode(String.self, forKey: .summary)
        title = try container.decode(String.self, forKey: .title)
    }
}

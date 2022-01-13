//
// This source file is part of the Apodini open source project
//
// SPDX-FileCopyrightText: 2019-2021 Paul Schmiedmayer and the Apodini project authors (see CONTRIBUTORS.md) <paul.schmiedmayer@tum.de>
//
// SPDX-License-Identifier: MIT
//

import Foundation

// MARK: - Model
public struct EventCategoryMediator: Codable {
    // MARK: - CodingKeys
    private enum CodingKeys: String, CodingKey {
        case categoryGroup
        case title
    }
    
    // MARK: - Properties
    public var categoryGroup: EventCategoryGroup
    public var title: String
    
    // MARK: - Initializer
    public init(
        categoryGroup: EventCategoryGroup,
        title: String
    ) {
        self.categoryGroup = categoryGroup
        self.title = title
    }
    
    // MARK: - Encodable
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(categoryGroup, forKey: .categoryGroup)
        try container.encode(title, forKey: .title)
    }
    
    // MARK: - Decodable
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        categoryGroup = try container.decode(EventCategoryGroup.self, forKey: .categoryGroup)
        title = try container.decode(String.self, forKey: .title)
    }
}

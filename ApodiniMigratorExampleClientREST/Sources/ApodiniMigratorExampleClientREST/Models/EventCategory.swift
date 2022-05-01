//
// This source file is part of the Apodini open source project
//
// SPDX-FileCopyrightText: 2019-2022 Paul Schmiedmayer and the Apodini project authors (see CONTRIBUTORS.md) <paul.schmiedmayer@tum.de>
//
// SPDX-License-Identifier: MIT
//

import Foundation

// MARK: - Model
public struct EventCategory: Codable {
    // MARK: - CodingKeys
    private enum CodingKeys: String, CodingKey {
        case group
        case id
        case status
        case title
    }
    
    // MARK: - Properties
    public var group: EventCategoryGroup
    public var id: UUID
    public var status: CategoryStatus
    public var title: String
    
    // MARK: - Initializer
    public init(
        group: EventCategoryGroup,
        id: UUID,
        status: CategoryStatus,
        title: String
    ) {
        self.group = group
        self.id = id
        self.status = status
        self.title = title
    }
    
    // MARK: - Encodable
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(try EventCategoryGroup.from(group, script: 26), forKey: .group)
        try container.encode(id, forKey: .id)
        try container.encode(title, forKey: .title)
    }
    
    // MARK: - Decodable
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        group = try EventCategoryGroup.from(try container.decode(EventCategoryGroup.self, forKey: .group), script: 27)
        id = try container.decode(UUID.self, forKey: .id)
        status = try CategoryStatus.instance(from: 6)
        title = try container.decode(String.self, forKey: .title)
    }
}

//
//  Created by ApodiniMigrator on 12.01.22
//  Copyright © 2022 TUM LS1. All rights reserved.
//

import Foundation

// MARK: - Model
public struct UserLogin: Codable {
    // MARK: - CodingKeys
    private enum CodingKeys: String, CodingKey {
        case password
        case userName = "username"
    }
    
    // MARK: - Properties
    public var password: String
    public var userName: String
    
    // MARK: - Initializer
    public init(
        password: String,
        userName: String
    ) {
        self.password = password
        self.userName = userName
    }
    
    // MARK: - Encodable
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(password, forKey: .password)
        try container.encode(userName, forKey: .userName)
    }
    
    // MARK: - Decodable
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        password = try container.decode(String.self, forKey: .password)
        userName = try container.decode(String.self, forKey: .userName)
    }
}

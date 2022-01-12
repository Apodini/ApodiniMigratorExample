//
// This source file is part of the Apodini open source project
//
// SPDX-FileCopyrightText: 2019-2021 Paul Schmiedmayer and the Apodini project authors (see CONTRIBUTORS.md) <paul.schmiedmayer@tum.de>
//
// SPDX-License-Identifier: MIT
//

import Foundation

// MARK: - Model
public struct UserRegisterForm: Codable {
    // MARK: - CodingKeys
    private enum CodingKeys: String, CodingKey {
        case birthday
        case email
        case name
        case password
        case preferredTheme
        case subscribedToNewsLetter
        case surname = "lastname"
    }
    
    // MARK: - Properties
    public var birthday: Date
    public var email: String
    public var name: String
    public var password: String
    public var preferredTheme: HomeFeedTheme
    public var subscribedToNewsLetter: Bool
    public var surname: String
    
    // MARK: - Initializer
    public init(
        birthday: Date,
        email: String,
        name: String,
        password: String,
        preferredTheme: HomeFeedTheme = try! HomeFeedTheme.instance(from: 0),
        subscribedToNewsLetter: Bool,
        surname: String
    ) {
        self.birthday = birthday
        self.email = email
        self.name = name
        self.password = password
        self.preferredTheme = preferredTheme
        self.subscribedToNewsLetter = subscribedToNewsLetter
        self.surname = surname
    }
    
    // MARK: - Encodable
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(birthday, forKey: .birthday)
        try container.encode(email, forKey: .email)
        try container.encode(name, forKey: .name)
        try container.encode(password, forKey: .password)
        try container.encode(preferredTheme, forKey: .preferredTheme)
        try container.encode(subscribedToNewsLetter, forKey: .subscribedToNewsLetter)
        try container.encode(surname, forKey: .surname)
    }
    
    // MARK: - Decodable
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        birthday = try container.decode(Date.self, forKey: .birthday)
        email = try container.decode(String.self, forKey: .email)
        name = try container.decode(String.self, forKey: .name)
        password = try container.decode(String.self, forKey: .password)
        preferredTheme = try container.decode(HomeFeedTheme.self, forKey: .preferredTheme)
        subscribedToNewsLetter = try container.decode(Bool.self, forKey: .subscribedToNewsLetter)
        surname = try container.decode(String.self, forKey: .surname)
    }
}

//
// This source file is part of the Apodini open source project
//
// SPDX-FileCopyrightText: 2019-2022 Paul Schmiedmayer and the Apodini project authors (see CONTRIBUTORS.md) <paul.schmiedmayer@tum.de>
//
// SPDX-License-Identifier: MIT
//

import Foundation

// MARK: - Model
public struct User: Codable {
    // MARK: - CodingKeys
    private enum CodingKeys: String, CodingKey {
        case birthday
        case email
        case eventsOfInterest = "interestedIn"
        case experience
        case homeFeed
        case id
        case name
        case ownEvents = "myEvents"
        case participatingEvents
        case password
        case reviews
        case subscribedToNewsLetter
        case surname
    }
    
    // MARK: - Properties
    public var birthday: Date
    public var email: String
    public var eventsOfInterest: [Event]
    public var experience: Experience
    public var homeFeed: HomeFeed?
    public var id: UUID
    public var name: String
    public var ownEvents: [Event]
    public var participatingEvents: [Event]
    public var password: String
    public var reviews: [Review]
    public var subscribedToNewsLetter: Bool
    public var surname: String
    
    // MARK: - Initializer
    public init(
        birthday: Date,
        email: String,
        eventsOfInterest: [Event],
        experience: Experience,
        homeFeed: HomeFeed?,
        id: UUID,
        name: String,
        ownEvents: [Event],
        participatingEvents: [Event],
        password: String,
        reviews: [Review],
        subscribedToNewsLetter: Bool,
        surname: String
    ) {
        self.birthday = birthday
        self.email = email
        self.eventsOfInterest = eventsOfInterest
        self.experience = experience
        self.homeFeed = homeFeed
        self.id = id
        self.name = name
        self.ownEvents = ownEvents
        self.participatingEvents = participatingEvents
        self.password = password
        self.reviews = reviews
        self.subscribedToNewsLetter = subscribedToNewsLetter
        self.surname = surname
    }
    
    // MARK: - Encodable
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(birthday, forKey: .birthday)
        try container.encode(email, forKey: .email)
        try container.encode(try [Event].from(eventsOfInterest, script: 2), forKey: .eventsOfInterest)
        try container.encode(try Experience.from(experience, script: 6), forKey: .experience)
        try container.encodeIfPresent(try HomeFeed?.from(homeFeed, script: 4), forKey: .homeFeed)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(try [Event].from(ownEvents, script: 0), forKey: .ownEvents)
        try container.encode(try [Event].from(participatingEvents, script: 10), forKey: .participatingEvents)
        try container.encode(password, forKey: .password)
        try container.encode(try [Review].from(reviews, script: 8), forKey: .reviews)
        try container.encode(subscribedToNewsLetter, forKey: .subscribedToNewsLetter)
        try container.encode(surname, forKey: .surname)
    }
    
    // MARK: - Decodable
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        birthday = try container.decode(Date.self, forKey: .birthday)
        email = try container.decode(String.self, forKey: .email)
        eventsOfInterest = try [Event].from(try container.decode([Event].self, forKey: .eventsOfInterest), script: 3)
        experience = try Experience.from(try container.decode(Experience.self, forKey: .experience), script: 7)
        homeFeed = try HomeFeed?.from(try container.decodeIfPresent(HomeFeed.self, forKey: .homeFeed), script: 5)
        id = try container.decode(UUID.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        ownEvents = try [Event].from(try container.decode([Event].self, forKey: .ownEvents), script: 1)
        participatingEvents = try [Event].from(try container.decode([Event].self, forKey: .participatingEvents), script: 11)
        password = try container.decode(String.self, forKey: .password)
        reviews = try [Review].from(try container.decode([Review].self, forKey: .reviews), script: 9)
        subscribedToNewsLetter = try container.decode(Bool.self, forKey: .subscribedToNewsLetter)
        surname = try container.decode(String.self, forKey: .surname)
    }
}

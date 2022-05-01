//
// This source file is part of the Apodini open source project
//
// SPDX-FileCopyrightText: 2019-2022 Paul Schmiedmayer and the Apodini project authors (see CONTRIBUTORS.md) <paul.schmiedmayer@tum.de>
//
// SPDX-License-Identifier: MIT
//

import Foundation

struct User: ApodiniContent, Identifiable {
    var id: UUID
    var name: String
    var surname: String
    var password: String
    var email: String
    var birthday: Date
    var subscribedToNewsLetter: Bool
    var experience: Experience
    var reviews: [Review]
    var ownEvents: [Event]
    var participatingEvents: [Event]
    var eventsOfInterest: [Event]
    var homeFeed: HomeFeed?
}

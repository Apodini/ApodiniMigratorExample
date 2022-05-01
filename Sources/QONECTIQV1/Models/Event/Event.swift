//
// This source file is part of the Apodini open source project
//
// SPDX-FileCopyrightText: 2019-2022 Paul Schmiedmayer and the Apodini project authors (see CONTRIBUTORS.md) <paul.schmiedmayer@tum.de>
//
// SPDX-License-Identifier: MIT
//

import Foundation

struct Event: ApodiniContent, Identifiable {
    var id: UUID
    var title: String
    var summary: String
    var reviews: [Review]
    var date: Date
    var duration: UInt
    var imagePath: URL
    var maxParticipants: UInt?
    var organizer: User.ID
    var tags: [String]
    var category: EventCategory
}

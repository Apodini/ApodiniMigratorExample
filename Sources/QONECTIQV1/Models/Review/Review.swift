//
// This source file is part of the Apodini open source project
//
// SPDX-FileCopyrightText: 2019-2021 Paul Schmiedmayer and the Apodini project authors (see CONTRIBUTORS.md) <paul.schmiedmayer@tum.de>
//
// SPDX-License-Identifier: MIT
//

import Foundation

struct Review: ApodiniContent {
    var id: UUID
    var title: String
    var content: String
    var eventID: Event.ID
    var reviewerID: User.ID
    var summary: String
    var rating: Rating
}

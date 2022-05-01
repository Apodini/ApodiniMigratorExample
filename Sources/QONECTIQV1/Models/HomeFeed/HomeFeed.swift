//
// This source file is part of the Apodini open source project
//
// SPDX-FileCopyrightText: 2019-2022 Paul Schmiedmayer and the Apodini project authors (see CONTRIBUTORS.md) <paul.schmiedmayer@tum.de>
//
// SPDX-License-Identifier: MIT
//

import Foundation

struct HomeFeed: ApodiniContent {
    var id: UUID
    var userID: User.ID
    var greeting: String
    var subtitle: String
    var searchBarText: String
    var events: [HomeFeedEvent]
    var categories: [HomeFeedCategory]
}

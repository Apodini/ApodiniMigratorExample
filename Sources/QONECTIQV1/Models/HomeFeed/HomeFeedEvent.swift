//
// This source file is part of the Apodini open source project
//
// SPDX-FileCopyrightText: 2019-2021 Paul Schmiedmayer and the Apodini project authors (see CONTRIBUTORS.md) <paul.schmiedmayer@tum.de>
//
// SPDX-License-Identifier: MIT
//

import Foundation

struct HomeFeedEvent: ApodiniContent {
    let eventID: Event.ID
    let title: String
    let subtitle: String
    let imageURL: URL
    let eventsCount: UInt
}

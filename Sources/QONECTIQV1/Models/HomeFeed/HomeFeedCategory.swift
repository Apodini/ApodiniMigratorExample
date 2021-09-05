//
// This source file is part of the Apodini open source project
//
// SPDX-FileCopyrightText: 2019-2021 Paul Schmiedmayer and the Apodini project authors (see CONTRIBUTORS.md) <paul.schmiedmayer@tum.de>
//
// SPDX-License-Identifier: MIT
//

import Foundation

struct HomeFeedCategory: ApodiniContent {
    let categoryID: EventCategory.ID
    let title: String
    let imageURL: URL
    let eventsCount: UInt
}

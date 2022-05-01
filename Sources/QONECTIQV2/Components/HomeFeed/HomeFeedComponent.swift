//
// This source file is part of the Apodini open source project
//
// SPDX-FileCopyrightText: 2019-2022 Paul Schmiedmayer and the Apodini project authors (see CONTRIBUTORS.md) <paul.schmiedmayer@tum.de>
//
// SPDX-License-Identifier: MIT
//

import Foundation
import Apodini

// MARK: - HomeFeedComponent
struct HomeFeedComponent: Component {
    @Apodini.Parameter(.http(.path))
    var userID: User.ID
    
    var content: some Component {
        Group("home", $userID) {
            HomeFeedHandler(userID: $userID)
                .identified(by: "getHomeFeedForUserWithID")
        }
    }
}

// MARK: - HomeFeedHandler
struct HomeFeedHandler: Handler {
    @Binding
    var userID: User.ID
    
    @Parameter
    var showPreviousEvents: Bool
    
    func handle() throws -> HomeFeed {
        try .instance(or: notFound)
    }
}

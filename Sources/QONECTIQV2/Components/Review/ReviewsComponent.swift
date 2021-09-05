//
// This source file is part of the Apodini open source project
//
// SPDX-FileCopyrightText: 2019-2021 Paul Schmiedmayer and the Apodini project authors (see CONTRIBUTORS.md) <paul.schmiedmayer@tum.de>
//
// SPDX-License-Identifier: MIT
//

import Foundation
import Apodini

// MARK: - ReviewsComponent
struct ReviewsComponent: Component {
    var content: some Component {
        Group("reviews") {
            ReviewsHandler()
                .identified(by: "getReviewsOfEventWithID")
            AddReviewHandler()
                .operation(.create)
                .identified(by: "addReviewToEvent")
            Group("posted-from") {
                ReviewsOfUserHandler()
                    .identified(by: "reviewsOfUserWithID")
            }
        }
    }
}

// MARK: - ReviewsHandler
struct ReviewsHandler: Handler {
    @Parameter
    var eventID: Event.ID
    
    @Parameter
    var ratingBetterThan: Rating = .meetsExpectation
    
    func handle() throws -> [Review] {
        [try .instance(or: notFound)]
    }
}

// MARK: - ReviewsOfUserHandler
struct ReviewsOfUserHandler: Handler {
    @Parameter
    var userId: User.ID
    
    func handle() throws -> [Review] {
        [try .instance(or: notFound)]
    }
}

// MARK: - AddReviewHandler
struct AddReviewHandler: Handler {
    @Parameter(.http(.body))
    var review: ReviewForm
    
    @Parameter
    var eventID: Event.ID
    
    @Parameter
    var userID: User.ID
    
    @Parameter
    var displayName = false
    
    func handle() throws -> ReviewForm {
        try .instance(or: notFound)
    }
}

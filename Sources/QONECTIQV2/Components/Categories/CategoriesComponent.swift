//
// This source file is part of the Apodini open source project
//
// SPDX-FileCopyrightText: 2019-2022 Paul Schmiedmayer and the Apodini project authors (see CONTRIBUTORS.md) <paul.schmiedmayer@tum.de>
//
// SPDX-License-Identifier: MIT
//

import Foundation
import Apodini

// MARK: - CategoriesComponent
struct CategoriesComponent: Component {
    @Parameter(.http(.path)) var id: EventCategory.ID
    
    var content: some Component {
        Group("categories") {
            CreateCategoryHandler()
                .operation(.create)
                .identified(by: "createCategory")
            GetCategoriesHandler()
                .identified(by: "getAllCategories")
            Group("group") {
                GroupCategoriesHandler()
                    .identified(by: "getCategoriesOfGroup")
            }
        }
        Group("category") {
            GetCategoryHandler()
                .identified(by: "getCategoryWithID")
        }
    }
}

// MARK: - CreateCategoryHandler
struct CreateCategoryHandler: Handler {
    @Parameter(.http(.body))
    var event: EventCategoryMediator
    
    func handle() throws -> EventLoopFuture<Status> {
        throw notFound
    }
}

// MARK: - GetCategoriesHandler
struct GetCategoriesHandler: Handler {
    func handle() throws -> [EventCategory] {
        [try .instance(or: notFound)]
    }
}

// MARK: - GetCategoryHandler
struct GetCategoryHandler: Handler {
    @Parameter var id: EventCategory.ID
    
    func handle() throws -> EventCategory {
        try .instance(or: notFound)
    }
}

// MARK: - GroupCategoriesHandler
struct GroupCategoriesHandler: Handler {
    @Parameter var group: EventCategoryGroup
    
    func handle() throws -> [EventCategory] {
        [try .instance(or: notFound)]
    }
}

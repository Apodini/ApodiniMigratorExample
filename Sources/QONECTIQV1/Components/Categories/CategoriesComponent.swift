//
// This source file is part of the Apodini open source project
//
// SPDX-FileCopyrightText: 2019-2021 Paul Schmiedmayer and the Apodini project authors (see CONTRIBUTORS.md) <paul.schmiedmayer@tum.de>
//
// SPDX-License-Identifier: MIT
//

import Foundation
import Apodini

// MARK: - CategoriesComponent
struct CategoriesComponent: Component {
    @Parameter(.http(.path)) var group: EventCategoryGroup
    @Parameter(.http(.path)) var id: EventCategory.ID
    
    var content: some Component {
        Group("categories") {
            CreateCategoryHandler()
                .operation(.create)
                .identified(by: "createCategory")
            GetCategoriesHandler()
                .identified(by: "getAllCategories")
            Group($id) {
                GetCategoryHandler(id: $id)
                    .identified(by: "getCategoryWithID")
            }
            Group("group", $group) {
                GroupCategoriesHandler(groupCategory: $group)
                    .identified(by: "getCategoriesOfGroup")
            }
        }
    }
}

// MARK: - CreateCategoryHandler
struct CreateCategoryHandler: Handler {
    @Parameter(.http(.body))
    var event: EventCategory
    
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
    @Binding var id: EventCategory.ID
    
    func handle() throws -> EventCategory {
        try .instance(or: notFound)
    }
}

// MARK: - GroupCategoriesHandler
struct GroupCategoriesHandler: Handler {
    @Binding var groupCategory: EventCategoryGroup
    
    func handle() throws -> [EventCategory] {
        [try .instance(or: notFound)]
    }
}


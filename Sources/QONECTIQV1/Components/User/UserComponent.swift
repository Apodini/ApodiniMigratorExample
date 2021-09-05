//
// This source file is part of the Apodini open source project
//
// SPDX-FileCopyrightText: 2019-2021 Paul Schmiedmayer and the Apodini project authors (see CONTRIBUTORS.md) <paul.schmiedmayer@tum.de>
//
// SPDX-License-Identifier: MIT
//

import Foundation
import Apodini

// MARK: - UserComponent
struct UserComponent: Component {
    @Parameter(.http(.path))
    var userID: User.ID
    
    @Parameter(.http(.path))
    var gender: Gender
    
    var content: some Component {
        Group("users") {
            Group($userID) {
                GetUserHandler(userID: $userID)
                    .identified(by: "getUserWithID")
                DeleteUserHandler(userID: $userID)
                    .operation(.delete)
                    .identified(by: "deleteUserWithID")
            }
            
            GetAllUsersHandler()
                .identified(by: "getAllUsers")
            
            
            Group("gender", $gender) {
                GenderUsersHandler(gender: $gender)
                    .identified(by: "usersOfGender")
            }
        }
        
        Group("login") {
            UserLoginHandler()
                .identified(by: "login")
        }
        
        Group("register") {
            UserRegisterFormHandler()
                .operation(.create)
                .identified(by: "register")
        }
    }
}

// MARK: - GetUserHandler
struct GetUserHandler: Handler {
    @Binding
    var userID: User.ID
    
    func handle() throws -> User {
        try .instance(or: notFound)
    }
}

// MARK: - DeleteUserHandler
struct DeleteUserHandler: Handler {
    @Binding
    var userID: User.ID
    
    func handle() throws -> EventLoopFuture<Status> {
        throw notFound
    }
}

// MARK: - GetAllUsersHandler
struct GetAllUsersHandler: Handler {
    
    func handle() throws -> [User] {
        [try .instance(or: notFound)]
    }
}

// MARK: - UserRegisterFormHandler
struct UserRegisterFormHandler: Handler {
    @Parameter(.http(.body))
    var userForm: UserRegisterForm
    
    func handle() throws -> User {
        try .instance(or: notFound)
    }
}

// MARK: - UserLoginHandler
struct UserLoginHandler: Handler {
    @Parameter(.http(.body))
    var login: UserLogin
    
    func handle() throws -> User {
        try .instance(or: notFound)
    }
}

// MARK: - GenderUsersHandler
struct GenderUsersHandler: Handler {
    @Binding
    var gender: Gender
    
    func handle() throws -> [User] {
        [try .instance(or: notFound)]
    }
}

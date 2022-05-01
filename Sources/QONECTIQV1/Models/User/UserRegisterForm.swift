//
// This source file is part of the Apodini open source project
//
// SPDX-FileCopyrightText: 2019-2022 Paul Schmiedmayer and the Apodini project authors (see CONTRIBUTORS.md) <paul.schmiedmayer@tum.de>
//
// SPDX-License-Identifier: MIT
//

import Foundation

struct UserRegisterForm: ApodiniContent {
    let name: String
    let surname: String
    let password: String
    let birthday: Date
    let email: String
    let subscribedToNewsLetter: Bool
}

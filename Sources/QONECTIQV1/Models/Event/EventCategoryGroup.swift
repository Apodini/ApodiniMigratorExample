//
// This source file is part of the Apodini open source project
//
// SPDX-FileCopyrightText: 2019-2021 Paul Schmiedmayer and the Apodini project authors (see CONTRIBUTORS.md) <paul.schmiedmayer@tum.de>
//
// SPDX-License-Identifier: MIT
//

import Foundation

enum EventCategoryGroup: String, ApodiniContent, LosslessStringConvertible, CustomStringConvertible {
    case marketing
    case blogging
    case coding
    case cooking
    case dating
    case travellinng
    case studying
    case science
    
    var description: String {
        rawValue
    }
    
    init?(_ description: String) {
        self.init(rawValue: description)
    }
}

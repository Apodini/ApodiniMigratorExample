//
// This source file is part of the Apodini open source project
//
// SPDX-FileCopyrightText: 2019-2022 Paul Schmiedmayer and the Apodini project authors (see CONTRIBUTORS.md) <paul.schmiedmayer@tum.de>
//
// SPDX-License-Identifier: MIT
//

import Foundation
import ApodiniGRPC

enum EventCategoryGroup: String, ApodiniContent, LosslessStringConvertible, CustomStringConvertible, CaseIterable, AnyProtobufEnum {
    case marketing
    case blogging
    case coding
    case cooking
    case dating
    case travel
    case science
    case entertainment
    
    var description: String {
        rawValue
    }
    
    init?(_ description: String) {
        self.init(rawValue: description)
    }
}

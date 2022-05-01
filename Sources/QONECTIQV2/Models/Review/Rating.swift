//
// This source file is part of the Apodini open source project
//
// SPDX-FileCopyrightText: 2019-2022 Paul Schmiedmayer and the Apodini project authors (see CONTRIBUTORS.md) <paul.schmiedmayer@tum.de>
//
// SPDX-License-Identifier: MIT
//

import Foundation
import ApodiniGRPC

enum Rating: String, ApodiniContent, LosslessStringConvertible, CaseIterable, AnyProtobufEnum {
    case outstanding
    case exceedsExpectation
    case meetsExpectation
    case needsImprovement
    case terrible
    
    var description: String {
        rawValue
    }
    
    init?(_ description: String) {
        self.init(rawValue: description)
    }
}

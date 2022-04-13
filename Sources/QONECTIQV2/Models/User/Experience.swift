//
// This source file is part of the Apodini open source project
//
// SPDX-FileCopyrightText: 2019-2021 Paul Schmiedmayer and the Apodini project authors (see CONTRIBUTORS.md) <paul.schmiedmayer@tum.de>
//
// SPDX-License-Identifier: MIT
//

import Foundation
import ApodiniGRPC

enum Experience: String, ApodiniContent, CustomStringConvertible, LosslessStringConvertible, CaseIterable, AnyProtobufEnum {
    case beginner
    case expert
    case unclassified
    
    var description: String {
        rawValue
    }
    
    init?(_ description: String) {
        self.init(rawValue: description)
    }
}

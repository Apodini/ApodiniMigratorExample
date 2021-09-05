//
// This source file is part of the Apodini open source project
//
// SPDX-FileCopyrightText: 2019-2021 Paul Schmiedmayer and the Apodini project authors (see CONTRIBUTORS.md) <paul.schmiedmayer@tum.de>
//
// SPDX-License-Identifier: MIT
//

import Foundation

enum Gender: String, ApodiniContent, CustomStringConvertible, LosslessStringConvertible {
    case male
    case female
    case undefined
    
    var description: String {
        rawValue
    }
    
    init?(_ description: String) {
        self.init(rawValue: description)
    }
}

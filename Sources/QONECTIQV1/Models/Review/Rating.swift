//
// This source file is part of the Apodini open source project
//
// SPDX-FileCopyrightText: 2019-2021 Paul Schmiedmayer and the Apodini project authors (see CONTRIBUTORS.md) <paul.schmiedmayer@tum.de>
//
// SPDX-License-Identifier: MIT
//

import Foundation

enum Rating: String, ApodiniContent {
    case outstanding
    case exceedsExpectation
    case meetsExpectation
    case needsImprovement
    case unacceptable
    case undefined
}

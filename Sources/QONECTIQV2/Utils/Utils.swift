//
// This source file is part of the Apodini open source project
//
// SPDX-FileCopyrightText: 2019-2022 Paul Schmiedmayer and the Apodini project authors (see CONTRIBUTORS.md) <paul.schmiedmayer@tum.de>
//
// SPDX-License-Identifier: MIT
//

import Apodini
import Shared

typealias ApodiniContent = MigratorContent

extension Handler {
    var notFound: ApodiniError {
        .init(type: .notFound)
    }
}

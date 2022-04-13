//
// This source file is part of the Apodini open source project
//
// SPDX-FileCopyrightText: 2019-2021 Paul Schmiedmayer and the Apodini project authors (see CONTRIBUTORS.md) <paul.schmiedmayer@tum.de>
//
// SPDX-License-Identifier: MIT
//

import Foundation
import SwiftProtobuf

// Codable support is only used for Migrator, and it is used to use date!
extension SwiftProtobuf.Google_Protobuf_Timestamp: Codable {
    init(from date: Date) {
        self.init()

        let timeInterval = date.timeIntervalSince1970
        self.seconds = Int64(timeInterval)
        self.nanos = Int32((timeInterval - floor(timeInterval)) * 1e9)
    }

    var asDate: Date {
        Date(timeIntervalSince1970: TimeInterval(seconds) + (TimeInterval(nanos) / 1e9))
    }

    public init(from decoder: Swift.Decoder) throws {
        self.init(from: try Date(from: decoder))
    }

    public func encode(to encoder: Encoder) throws {
        try asDate.encode(to: encoder)
    }
}

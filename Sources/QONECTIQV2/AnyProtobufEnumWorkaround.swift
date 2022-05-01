//
// This source file is part of the Apodini open source project
//
// SPDX-FileCopyrightText: 2019-2022 Paul Schmiedmayer and the Apodini project authors (see CONTRIBUTORS.md) <paul.schmiedmayer@tum.de>
//
// SPDX-License-Identifier: MIT
//

import ApodiniGRPC

// All of our enums are of RawValue == String. We need a Integer raw value for the proto number.
// With this workaround we just use the index of the enum value.

extension AnyProtobufEnum where Self: CaseIterable, Self: Equatable {
    var rawValue: Int32 {
        Int32(Self.allCases.firstIndex(of: self)!) // swiftlint:disable:this force_unwrapping
    }
}

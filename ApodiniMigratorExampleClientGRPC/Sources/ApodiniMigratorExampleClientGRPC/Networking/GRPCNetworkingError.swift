//
// This source file is part of the Apodini open source project
//
// SPDX-FileCopyrightText: 2019-2021 Paul Schmiedmayer and the Apodini project authors (see CONTRIBUTORS.md) <paul.schmiedmayer@tum.de>
//
// SPDX-License-Identifier: MIT
//

import Foundation

public enum GRPCNetworkingError: Error {
    case streamingTypeMigrationError(type: StreamingTypeMigrationErrorType)
}

/// Defines errors which might be thrown when a conversion from a
/// service side stream to service side response fails.
public enum StreamingTypeMigrationErrorType {
    /// Thrown if the first next() already fails to yield any response!
    case didNotReceiveAnyResponse
}

//
// This source file is part of the Apodini open source project
//
// SPDX-FileCopyrightText: 2019-2022 Paul Schmiedmayer and the Apodini project authors (see CONTRIBUTORS.md) <paul.schmiedmayer@tum.de>
//
// SPDX-License-Identifier: MIT
//

import NIO
import NIOSSL
import GRPC

open class GRPCNetworking {
    public static let verification: CertificateVerification = .none

    public static let hostname = "127.0.0.1"
    public static let port = 8080

    public let eventLoopGroup: EventLoopGroup

    private var _defaultChannel: GRPCChannel?
    public var defaultChannel: GRPCChannel {
        get throws {
            guard let channel = _defaultChannel else {
                let channel = try GRPCChannelPool.with(
                    target: .host(Self.hostname, port: Self.port),
                    transportSecurity: .tls(.makeClientConfigurationBackedByNIOSSL(certificateVerification: Self.verification)),
                    eventLoopGroup: eventLoopGroup
                )
                self._defaultChannel = channel
                return channel
            }

            return channel
        }
    }

    public init(eventLoopGroup: EventLoopGroup) {
        self.eventLoopGroup = eventLoopGroup
    }

    public func close() -> EventLoopFuture<Void> {
        guard let channel = _defaultChannel else {
            return eventLoopGroup.next().makeSucceededVoidFuture()
        }

        self._defaultChannel = nil
        return channel.close()
    }

    deinit {
        try! close().wait()
    }
}

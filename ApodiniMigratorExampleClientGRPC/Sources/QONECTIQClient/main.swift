//
// This source file is part of the Apodini open source project
//
// SPDX-FileCopyrightText: 2019-2022 Paul Schmiedmayer and the Apodini project authors (see CONTRIBUTORS.md) <paul.schmiedmayer@tum.de>
//
// SPDX-License-Identifier: MIT
//

import Foundation
import QONECTIQ
import NIO

let eventLoopGroup = MultiThreadedEventLoopGroup(numberOfThreads: 1)
defer {
    try! eventLoopGroup.syncShutdownGracefully()
}

let networking = GRPCNetworking(eventLoopGroup: eventLoopGroup)
defer {
    try! networking.close().wait()
}

let client = QONECTIQAsyncClient(channel: try networking.defaultChannel)

let promise: EventLoopPromise<Void> = eventLoopGroup.next().makePromise()
promise.completeWithTask {
    var input = QONECTIQ_GetEventHandlerInput()
    input.id = UUID().description
    
    let response = try await client.getEventHandler(input)
    print(response)
    
    /*
     QONECTIQ.QONECTIQ_Event:
     id: "1ABCC4A9-C494-497B-8B08-6FEBC11640EA"
     date {
       seconds: 1644318000
     }
     imagePath: "https://github.com/Apodini/Apodini"
     maxParticipants: 0
     organizer: "3916FC21-6775-4D3B-928D-70C98AD39DF0"
     category {
       id: "A3B96B4C-28DA-43BC-85B6-A366055378EC"
     }
     */
}

try promise.futureResult.wait()

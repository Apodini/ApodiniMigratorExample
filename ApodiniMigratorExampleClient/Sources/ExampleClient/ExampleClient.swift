//
// This source file is part of the Apodini open source project
//
// SPDX-FileCopyrightText: 2019-2021 Paul Schmiedmayer and the Apodini project authors (see CONTRIBUTORS.md) <paul.schmiedmayer@tum.de>
//
// SPDX-License-Identifier: MIT
//

import ApodiniMigratorExampleClient
import Foundation
import Combine

@main
struct ExampleClient {
    static var cancellables: Set<AnyCancellable> = []
    
    
    static func main() {
        API.getEventWithID(id: UUID())
            .sink { completation in
                print(completation)
            } receiveValue: { value in
                print(value)
            }
            .store(in: &cancellables)
        
        RunLoop.main.run()
    }
}

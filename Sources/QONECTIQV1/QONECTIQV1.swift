//
// This source file is part of the Apodini open source project
//
// SPDX-FileCopyrightText: 2019-2021 Paul Schmiedmayer and the Apodini project authors (see CONTRIBUTORS.md) <paul.schmiedmayer@tum.de>
//
// SPDX-License-Identifier: MIT
//

import Foundation
import Apodini
import ApodiniREST
import ApodiniGRPC
import ApodiniMigration

@main
struct QONECTIQV1: Apodini.WebService {
    var content: some Component {
        EventsComponent()
        CategoriesComponent()
        HomeFeedComponent()
        ReviewsComponent()
        UserComponent()
    }
    
    var configuration: Configuration {
        if let cert = Bundle.module.path(forResource: "cert", ofType: "pem"),
           let key = Bundle.module.path(forResource: "key", ofType: "pem") {
            HTTPConfiguration(bindAddress: .interface(port: 8080), tlsConfiguration: .init(certificatePath: cert, keyPath: key))
        }

        REST()

        GRPC(packageName: "QONECTIQ", serviceName: "QONECTIQ")
        
        Migrator(
            // exports the document of the current version at http://localhost/api-document in `yaml` format
            documentConfig: .export(.endpoint("api-document", format: .json))
        )
    }
    
    var metadata: Metadata {
        Version(major: 1, minor: 0, patch: 0)
    }
}

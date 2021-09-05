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
        REST()
        
        Migrator(
            // exports the document of the current version at http://0.0.0.0:8080/api-document in `yaml` format
            documentConfig: .export(.directory("api-document", format: .yaml))
        )
    }
    
    var metadata: Metadata {
        Version(prefix: "qonectiq", major: 1, minor: 0, patch: 0)
    }
}

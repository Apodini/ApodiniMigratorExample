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
struct QONECTIQV2: Apodini.WebService {
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
            // exports the document of the current version at directory `data` in `json` format
            // `ApodiniMigration` creates intermediary directories if they do not exist,
            // .directory export option might be useful during development to inspect the content
            documentConfig: .export(.directory("./Documents")),
            // compares the current API with the document stored at `Bundle.module`,
            // and exports the automatically generated migration guide at http://localhost/migration-guide in a `json` format
            migrationGuideConfig: .compare(
                .resource(.module, fileName: "api_qonectiq1.0.0", format: .json),
                export: .endpoint("migration-guide", format: .json)
            )
        )
    }
    
    var metadata: Metadata {
        Version(major: 2, minor: 0, patch: 0)
    }
}

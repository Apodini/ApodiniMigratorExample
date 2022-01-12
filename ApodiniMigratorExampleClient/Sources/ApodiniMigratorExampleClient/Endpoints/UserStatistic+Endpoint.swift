//
//  Created by ApodiniMigrator on 12.01.22
//  Copyright © 2022 TUM LS1. All rights reserved.
//

import Foundation

// MARK: - Endpoints
public extension UserStatistic {
    /// API call for StatisticsHandler at: {userIdentifier}/statistics
    static func statisticsOfUser(
        userIdentifier: UUID,
        authorization: String? = nil,
        httpHeaders: HTTPHeaders = [:]
    ) -> ApodiniPublisher<UserStatistic> {
        var headers = httpHeaders
        headers.setContentType(to: "application/json")
        
        var errors: [ApodiniError] = []
        errors.addError(401, message: "Unauthorized")
        errors.addError(403, message: "Forbidden")
        errors.addError(404, message: "Not found")
        errors.addError(500, message: "Internal server error")
        
        let handler = Handler<UserStatistic>(
            path: "\(userIdentifier)/statistics",
            httpMethod: .get,
            parameters: [:],
            headers: headers,
            content: nil,
            authorization: authorization,
            errors: errors
        )
        
        return NetworkingService.trigger(handler)
    }
}

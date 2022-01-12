//
//  Created by ApodiniMigrator on 12.01.22
//  Copyright © 2022 TUM LS1. All rights reserved.
//

import Foundation

// MARK: - Endpoints
public extension HomeFeed {
    /// API call for HomeFeedHandler at: {userID}
    static func getHomeFeedForUserWithID(
        showPreviousEvents: Bool = try! Bool.instance(from: 7),
        userID: UUID,
        authorization: String? = nil,
        httpHeaders: HTTPHeaders = [:]
    ) -> ApodiniPublisher<HomeFeed> {
        var parameters = Parameters()
        parameters.set(showPreviousEvents, forKey: "showPreviousEvents")
        
        var headers = httpHeaders
        headers.setContentType(to: "application/json")
        
        var errors: [ApodiniError] = []
        errors.addError(401, message: "Unauthorized")
        errors.addError(403, message: "Forbidden")
        errors.addError(404, message: "Not found")
        errors.addError(500, message: "Internal server error")
        
        let handler = Handler<HomeFeed>(
            path: "\(userID)",
            httpMethod: .get,
            parameters: parameters,
            headers: headers,
            content: nil,
            authorization: authorization,
            errors: errors
        )
        
        return NetworkingService.trigger(handler)
    }
}

//
// This source file is part of the Apodini open source project
//
// SPDX-FileCopyrightText: 2019-2022 Paul Schmiedmayer and the Apodini project authors (see CONTRIBUTORS.md) <paul.schmiedmayer@tum.de>
//
// SPDX-License-Identifier: MIT
//

import Foundation

// MARK: - Endpoints
public extension HomeFeed {
    /// API call for HomeFeedHandler at: home/{userID}
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
            path: "home/\(userID)",
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

//
//  Created by ApodiniMigrator on 12.01.22
//  Copyright © 2022 TUM LS1. All rights reserved.
//

import Foundation

// MARK: - Endpoints
public extension Empty {
    /// API call for CreateCategoryHandler at: 
    static func createCategory(
        event: EventCategory,
        authorization: String? = nil,
        httpHeaders: HTTPHeaders = [:]
    ) -> ApodiniPublisher<Empty> {
        var headers = httpHeaders
        headers.setContentType(to: "application/json")
        
        var errors: [ApodiniError] = []
        errors.addError(401, message: "Unauthorized")
        errors.addError(403, message: "Forbidden")
        errors.addError(404, message: "Not found")
        errors.addError(500, message: "Internal server error")
        
        let handler = Handler<Empty>(
            path: "",
            httpMethod: .post,
            parameters: [:],
            headers: headers,
            content: NetworkingService.encode(try! EventCategoryMediator.from(event, script: 29)),
            authorization: authorization,
            errors: errors
        )
        
        return NetworkingService.trigger(handler)
    }
    
    
    /// API call for CreateEventHandler at: 
    static func createEvent(
        event: Event,
        authorization: String? = nil,
        httpHeaders: HTTPHeaders = [:]
    ) -> ApodiniPublisher<Empty> {
        var headers = httpHeaders
        headers.setContentType(to: "application/json")
        
        var errors: [ApodiniError] = []
        errors.addError(401, message: "Unauthorized")
        errors.addError(403, message: "Forbidden")
        errors.addError(404, message: "Not found")
        errors.addError(500, message: "Internal server error")
        
        let handler = Handler<Empty>(
            path: "",
            httpMethod: .post,
            parameters: [:],
            headers: headers,
            content: NetworkingService.encode(event),
            authorization: authorization,
            errors: errors
        )
        
        return NetworkingService.trigger(handler)
    }
    
    
    /// API call for DeleteUserHandler at: {userID}
    static func deleteUserWithID(
        userID: UUID,
        authorization: String? = nil,
        httpHeaders: HTTPHeaders = [:]
    ) -> ApodiniPublisher<Empty> {
        var headers = httpHeaders
        headers.setContentType(to: "application/json")
        
        var errors: [ApodiniError] = []
        errors.addError(401, message: "Unauthorized")
        errors.addError(403, message: "Forbidden")
        errors.addError(404, message: "Not found")
        errors.addError(500, message: "Internal server error")
        
        let handler = Handler<Empty>(
            path: "\(userID)",
            httpMethod: .delete,
            parameters: [:],
            headers: headers,
            content: nil,
            authorization: authorization,
            errors: errors
        )
        
        return NetworkingService.trigger(handler)
    }
}

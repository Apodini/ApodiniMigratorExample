//
//  Created by ApodiniMigrator on 12.01.22
//  Copyright © 2022 TUM LS1. All rights reserved.
//

import Foundation

// MARK: - Endpoints
public extension Event {
    /// API call for DeleteEventHandler at: {id}
    static func deleteEventWithID(
        id: UUID,
        authorization: String? = nil,
        httpHeaders: HTTPHeaders = [:]
    ) -> ApodiniPublisher<Event> {
        var headers = httpHeaders
        headers.setContentType(to: "application/json")
        
        var errors: [ApodiniError] = []
        errors.addError(401, message: "Unauthorized")
        errors.addError(403, message: "Forbidden")
        errors.addError(404, message: "Not found")
        errors.addError(500, message: "Internal server error")
        
        let handler = Handler<Event>(
            path: "\(id)",
            httpMethod: .delete,
            parameters: [:],
            headers: headers,
            content: nil,
            authorization: authorization,
            errors: errors
        )
        
        return NetworkingService.trigger(handler)
    }
    
    
    /// API call for GetEventHandler at: {id}
    static func getEventWithID(
        id: UUID,
        authorization: String? = nil,
        httpHeaders: HTTPHeaders = [:]
    ) -> ApodiniPublisher<Event> {
        var headers = httpHeaders
        headers.setContentType(to: "application/json")
        
        var errors: [ApodiniError] = []
        errors.addError(401, message: "Unauthorized")
        errors.addError(403, message: "Forbidden")
        errors.addError(404, message: "Not found")
        errors.addError(500, message: "Internal server error")
        
        let handler = Handler<Event>(
            path: "\(id)",
            httpMethod: .get,
            parameters: [:],
            headers: headers,
            content: nil,
            authorization: authorization,
            errors: errors
        )
        
        return NetworkingService.trigger(handler)
    }
    
    
    /// API call for UpdateEventHandler at: {eventID}
    static func updateEventWithID(
        eventID: UUID,
        eventMediator: EventMediator,
        authorization: String? = nil,
        httpHeaders: HTTPHeaders = [:]
    ) -> ApodiniPublisher<Event> {
        var headers = httpHeaders
        headers.setContentType(to: "application/json")
        
        var errors: [ApodiniError] = []
        errors.addError(401, message: "Unauthorized")
        errors.addError(403, message: "Forbidden")
        errors.addError(404, message: "Not found")
        errors.addError(500, message: "Internal server error")
        
        let handler = Handler<Event>(
            path: "\(eventID)",
            httpMethod: .put,
            parameters: [:],
            headers: headers,
            content: NetworkingService.encode(eventMediator),
            authorization: authorization,
            errors: errors
        )
        
        return NetworkingService.trigger(handler)
    }
    
    
    /// API call for GetEventsHandler at: 
    static func getAllEvents(
        authorization: String? = nil,
        httpHeaders: HTTPHeaders = [:]
    ) -> ApodiniPublisher<[Event]> {
        var headers = httpHeaders
        headers.setContentType(to: "application/json")
        
        var errors: [ApodiniError] = []
        errors.addError(401, message: "Unauthorized")
        errors.addError(403, message: "Forbidden")
        errors.addError(404, message: "Not found")
        errors.addError(500, message: "Internal server error")
        
        let handler = Handler<[Event]>(
            path: "",
            httpMethod: .get,
            parameters: [:],
            headers: headers,
            content: nil,
            authorization: authorization,
            errors: errors
        )
        
        return NetworkingService.trigger(handler)
    }
    
    
    /// API call for CategoryEventsHandler at: category
    static func getEventsOfCategory(
        group: EventCategoryGroup,
        authorization: String? = nil,
        httpHeaders: HTTPHeaders = [:]
    ) -> ApodiniPublisher<[Event]> {
        var headers = httpHeaders
        headers.setContentType(to: "application/json")
        
        var errors: [ApodiniError] = []
        errors.addError(401, message: "Unauthorized")
        errors.addError(403, message: "Forbidden")
        errors.addError(404, message: "Not found")
        errors.addError(500, message: "Internal server error")
        
        let handler = Handler<[Event]>(
            path: "category",
            httpMethod: .post,
            parameters: [:],
            headers: headers,
            content: NetworkingService.encode(group),
            authorization: authorization,
            errors: errors
        )
        
        return NetworkingService.trigger(handler)
    }
    
    
    /// API call for SearchEventsHandler at: search
    static func searchEventsWithQuery(
        searchQuery: String,
        authorization: String? = nil,
        httpHeaders: HTTPHeaders = [:]
    ) -> ApodiniPublisher<[Event]> {
        var parameters = Parameters()
        parameters.set(searchQuery, forKey: "searchQuery")
        
        var headers = httpHeaders
        headers.setContentType(to: "application/json")
        
        var errors: [ApodiniError] = []
        errors.addError(401, message: "Unauthorized")
        errors.addError(403, message: "Forbidden")
        errors.addError(404, message: "Not found")
        errors.addError(500, message: "Internal server error")
        
        let handler = Handler<[Event]>(
            path: "search",
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

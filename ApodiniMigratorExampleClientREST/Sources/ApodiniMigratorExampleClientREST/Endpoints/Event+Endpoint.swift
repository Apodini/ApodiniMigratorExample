//
// This source file is part of the Apodini open source project
//
// SPDX-FileCopyrightText: 2019-2022 Paul Schmiedmayer and the Apodini project authors (see CONTRIBUTORS.md) <paul.schmiedmayer@tum.de>
//
// SPDX-License-Identifier: MIT
//

import Foundation

// MARK: - Endpoints
public extension Event {
    /// API call for DeleteEventHandler at: events/{id}
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
            path: "events/\(id)",
            httpMethod: .delete,
            parameters: [:],
            headers: headers,
            content: nil,
            authorization: authorization,
            errors: errors
        )
        
        return NetworkingService.trigger(handler)
    }
    
    
    /// API call for GetEventHandler at: events/{id}
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
            path: "events/\(id)",
            httpMethod: .get,
            parameters: [:],
            headers: headers,
            content: nil,
            authorization: authorization,
            errors: errors
        )
        
        return NetworkingService.trigger(handler)
    }
    
    
    /// API call for UpdateEventHandler at: events/{eventID}
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
            path: "events/\(eventID)",
            httpMethod: .put,
            parameters: [:],
            headers: headers,
            content: NetworkingService.encode(eventMediator),
            authorization: authorization,
            errors: errors
        )
        
        return NetworkingService.trigger(handler)
    }
    
    
    /// API call for GetEventsHandler at: events
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
            path: "events",
            httpMethod: .get,
            parameters: [:],
            headers: headers,
            content: nil,
            authorization: authorization,
            errors: errors
        )
        
        return NetworkingService.trigger(handler)
    }
    
    
    /// API call for CategoryEventsHandler at: events/category
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
            path: "events/category",
            httpMethod: .post,
            parameters: [:],
            headers: headers,
            content: NetworkingService.encode(group),
            authorization: authorization,
            errors: errors
        )
        
        return NetworkingService.trigger(handler)
    }
    
    
    /// API call for SearchEventsHandler at: events/search
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
            path: "events/search",
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

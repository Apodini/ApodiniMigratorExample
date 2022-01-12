//
//  Created by ApodiniMigrator on 12.01.22
//  Copyright © 2022 TUM LS1. All rights reserved.
//

import Combine
import Foundation

// MARK: - Endpoints
public extension User {
    /// API call for GetUserHandler at: {userID}
    static func getUserWithID(
        userID: UUID,
        authorization: String? = nil,
        httpHeaders: HTTPHeaders = [:]
    ) -> ApodiniPublisher<User> {
        var headers = httpHeaders
        headers.setContentType(to: "application/json")
        
        var errors: [ApodiniError] = []
        errors.addError(401, message: "Unauthorized")
        errors.addError(403, message: "Forbidden")
        errors.addError(404, message: "Not found")
        errors.addError(500, message: "Internal server error")
        
        let handler = Handler<User>(
            path: "\(userID)",
            httpMethod: .get,
            parameters: [:],
            headers: headers,
            content: nil,
            authorization: authorization,
            errors: errors
        )
        
        return NetworkingService.trigger(handler)
    }
    
    
    /// API call for UserLoginHandler at: 
    static func login(
        login: UserLogin,
        authorization: String? = nil,
        httpHeaders: HTTPHeaders = [:]
    ) -> ApodiniPublisher<User> {
        var headers = httpHeaders
        headers.setContentType(to: "application/json")
        
        var errors: [ApodiniError] = []
        errors.addError(401, message: "Unauthorized")
        errors.addError(403, message: "Forbidden")
        errors.addError(404, message: "Not found")
        errors.addError(500, message: "Internal server error")
        
        let handler = Handler<User>(
            path: "",
            httpMethod: .get,
            parameters: [:],
            headers: headers,
            content: NetworkingService.encode(login),
            authorization: authorization,
            errors: errors
        )
        
        return NetworkingService.trigger(handler)
    }
    
    
    /// API call for UserRegisterFormHandler at: 
    static func register(
        userForm: UserRegisterForm,
        authorization: String? = nil,
        httpHeaders: HTTPHeaders = [:]
    ) -> ApodiniPublisher<User> {
        var headers = httpHeaders
        headers.setContentType(to: "application/json")
        
        var errors: [ApodiniError] = []
        errors.addError(401, message: "Unauthorized")
        errors.addError(403, message: "Forbidden")
        errors.addError(404, message: "Not found")
        errors.addError(500, message: "Internal server error")
        
        let handler = Handler<User>(
            path: "",
            httpMethod: .post,
            parameters: [:],
            headers: headers,
            content: NetworkingService.encode(userForm),
            authorization: authorization,
            errors: errors
        )
        
        return NetworkingService.trigger(handler)
    }
    
    
    /// API call for GetAllUsersHandler at: 
    static func getAllUsers(
        authorization: String? = nil,
        httpHeaders: HTTPHeaders = [:]
    ) -> ApodiniPublisher<[User]> {
        var headers = httpHeaders
        headers.setContentType(to: "application/json")
        
        var errors: [ApodiniError] = []
        errors.addError(401, message: "Unauthorized")
        errors.addError(403, message: "Forbidden")
        errors.addError(404, message: "Not found")
        errors.addError(500, message: "Internal server error")
        
        let handler = Handler<[User]>(
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
    
    
    /// API call for GetParticipantsOfEventHandler at: {eventID}/participants
    static func getParticipantsOfEventWithID(
        eventID: UUID,
        authorization: String? = nil,
        httpHeaders: HTTPHeaders = [:]
    ) -> ApodiniPublisher<[User]> {
        var headers = httpHeaders
        headers.setContentType(to: "application/json")
        
        var errors: [ApodiniError] = []
        errors.addError(401, message: "Unauthorized")
        errors.addError(403, message: "Forbidden")
        errors.addError(404, message: "Not found")
        errors.addError(500, message: "Internal server error")
        
        let handler = Handler<[User]>(
            path: "\(eventID)/participants",
            httpMethod: .get,
            parameters: [:],
            headers: headers,
            content: nil,
            authorization: authorization,
            errors: errors
        )
        
        return NetworkingService.trigger(handler)
    }
    
    
    /// API call for ExperienceUsersHandler at: experience/{experience}
    @available(*, deprecated, message: "This endpoint is not available in the new version anymore. Calling this method results in a failing promise!")
    static func usersOfExperience(
        experience: Experience,
        authorization: String? = nil,
        httpHeaders: HTTPHeaders = [:]
    ) -> ApodiniPublisher<[User]> {
        Future { $0(.failure(ApodiniError.deletedEndpoint())) }.eraseToAnyPublisher()
    }
}

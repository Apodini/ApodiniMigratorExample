//
//  Created by ApodiniMigrator on 12.01.22
//  Copyright © 2022 TUM LS1. All rights reserved.
//

import Foundation

// MARK: - Endpoints
public extension Review {
    /// API call for AddReviewHandler at: 
    static func addReviewToEvent(
        displayName: Bool?,
        eventID: UUID,
        review: ReviewForm,
        userID: UUID,
        authorization: String? = nil,
        httpHeaders: HTTPHeaders = [:]
    ) -> ApodiniPublisher<Review> {
        var parameters = Parameters()
        parameters.set(displayName, forKey: "displayName")
        parameters.set(eventID, forKey: "eventID")
        parameters.set(userID, forKey: "userID")
        
        var headers = httpHeaders
        headers.setContentType(to: "application/json")
        
        var errors: [ApodiniError] = []
        errors.addError(401, message: "Unauthorized")
        errors.addError(403, message: "Forbidden")
        errors.addError(404, message: "Not found")
        errors.addError(500, message: "Internal server error")
        
        let handler = Handler<ReviewForm>(
            path: "",
            httpMethod: .post,
            parameters: parameters,
            headers: headers,
            content: NetworkingService.encode(review),
            authorization: authorization,
            errors: errors
        )
        
        return NetworkingService.trigger(handler)
            .tryMap { try Review.from($0, script: 28) }
            .eraseToAnyPublisher()
    }
    
    
    /// API call for ReviewsHandler at: 
    static func getReviewsOfEventWithID(
        eventID: UUID,
        ratingBetterThan: Rating?,
        authorization: String? = nil,
        httpHeaders: HTTPHeaders = [:]
    ) -> ApodiniPublisher<[Review]> {
        var parameters = Parameters()
        parameters.set(eventID, forKey: "eventID")
        parameters.set(ratingBetterThan, forKey: "ratingBetterThan")
        
        var headers = httpHeaders
        headers.setContentType(to: "application/json")
        
        var errors: [ApodiniError] = []
        errors.addError(401, message: "Unauthorized")
        errors.addError(403, message: "Forbidden")
        errors.addError(404, message: "Not found")
        errors.addError(500, message: "Internal server error")
        
        let handler = Handler<[Review]>(
            path: "",
            httpMethod: .get,
            parameters: parameters,
            headers: headers,
            content: nil,
            authorization: authorization,
            errors: errors
        )
        
        return NetworkingService.trigger(handler)
    }
    
    
    /// API call for ReviewsOfUserHandler at: posted-from
    static func reviewsOfUserWithID(
        userId: UUID,
        authorization: String? = nil,
        httpHeaders: HTTPHeaders = [:]
    ) -> ApodiniPublisher<[Review]> {
        var parameters = Parameters()
        parameters.set(userId, forKey: "userId")
        
        var headers = httpHeaders
        headers.setContentType(to: "application/json")
        
        var errors: [ApodiniError] = []
        errors.addError(401, message: "Unauthorized")
        errors.addError(403, message: "Forbidden")
        errors.addError(404, message: "Not found")
        errors.addError(500, message: "Internal server error")
        
        let handler = Handler<[Review]>(
            path: "posted-from",
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

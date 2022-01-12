//
// This source file is part of the Apodini open source project
//
// SPDX-FileCopyrightText: 2019-2021 Paul Schmiedmayer and the Apodini project authors (see CONTRIBUTORS.md) <paul.schmiedmayer@tum.de>
//
// SPDX-License-Identifier: MIT
//

import Foundation

// MARK: - API
public enum API {}

// MARK: - Endpoints
public extension API {
    /// API call for AddReviewHandler at: reviews
    static func addReviewToEvent(
        displayName: Bool?,
        eventID: UUID,
        review: ReviewForm,
        userID: UUID,
        authorization: String? = nil,
        httpHeaders: HTTPHeaders = [:]
    ) -> ApodiniPublisher<Review> {
        Review.addReviewToEvent(
            displayName: displayName,
            eventID: eventID,
            review: review,
            userID: userID,
            authorization: authorization,
            httpHeaders: httpHeaders
        )
    }
    /// API call for ReviewsHandler at: reviews
    static func getReviewsOfEventWithID(
        eventID: UUID,
        ratingBetterThan: Rating?,
        authorization: String? = nil,
        httpHeaders: HTTPHeaders = [:]
    ) -> ApodiniPublisher<[Review]> {
        Review.getReviewsOfEventWithID(
            eventID: eventID,
            ratingBetterThan: ratingBetterThan,
            authorization: authorization,
            httpHeaders: httpHeaders
        )
    }
    /// API call for ReviewsOfUserHandler at: reviews/posted-from
    static func reviewsOfUserWithID(
        userId: UUID,
        authorization: String? = nil,
        httpHeaders: HTTPHeaders = [:]
    ) -> ApodiniPublisher<[Review]> {
        Review.reviewsOfUserWithID(
            userId: userId,
            authorization: authorization,
            httpHeaders: httpHeaders
        )
    }
    /// API call for DeleteEventHandler at: events/{id}
    static func deleteEventWithID(
        id: UUID,
        authorization: String? = nil,
        httpHeaders: HTTPHeaders = [:]
    ) -> ApodiniPublisher<Event> {
        Event.deleteEventWithID(
            id: id,
            authorization: authorization,
            httpHeaders: httpHeaders
        )
    }
    /// API call for GetEventHandler at: events/{id}
    static func getEventWithID(
        id: UUID,
        authorization: String? = nil,
        httpHeaders: HTTPHeaders = [:]
    ) -> ApodiniPublisher<Event> {
        Event.getEventWithID(
            id: id,
            authorization: authorization,
            httpHeaders: httpHeaders
        )
    }
    /// API call for UpdateEventHandler at: events/{eventID}
    static func updateEventWithID(
        eventID: UUID,
        eventMediator: EventMediator,
        authorization: String? = nil,
        httpHeaders: HTTPHeaders = [:]
    ) -> ApodiniPublisher<Event> {
        Event.updateEventWithID(
            eventID: eventID,
            eventMediator: eventMediator,
            authorization: authorization,
            httpHeaders: httpHeaders
        )
    }
    /// API call for GetEventsHandler at: events
    static func getAllEvents(
        authorization: String? = nil,
        httpHeaders: HTTPHeaders = [:]
    ) -> ApodiniPublisher<[Event]> {
        Event.getAllEvents(
            authorization: authorization,
            httpHeaders: httpHeaders
        )
    }
    /// API call for CategoryEventsHandler at: events/category
    static func getEventsOfCategory(
        group: EventCategoryGroup,
        authorization: String? = nil,
        httpHeaders: HTTPHeaders = [:]
    ) -> ApodiniPublisher<[Event]> {
        Event.getEventsOfCategory(
            group: group,
            authorization: authorization,
            httpHeaders: httpHeaders
        )
    }
    /// API call for SearchEventsHandler at: events/search
    static func searchEventsWithQuery(
        searchQuery: String,
        authorization: String? = nil,
        httpHeaders: HTTPHeaders = [:]
    ) -> ApodiniPublisher<[Event]> {
        Event.searchEventsWithQuery(
            searchQuery: searchQuery,
            authorization: authorization,
            httpHeaders: httpHeaders
        )
    }
    /// API call for CreateCategoryHandler at: categories
    static func createCategory(
        event: EventCategory,
        authorization: String? = nil,
        httpHeaders: HTTPHeaders = [:]
    ) -> ApodiniPublisher<Empty> {
        Empty.createCategory(
            event: event,
            authorization: authorization,
            httpHeaders: httpHeaders
        )
    }
    /// API call for CreateEventHandler at: events
    static func createEvent(
        event: Event,
        authorization: String? = nil,
        httpHeaders: HTTPHeaders = [:]
    ) -> ApodiniPublisher<Empty> {
        Empty.createEvent(
            event: event,
            authorization: authorization,
            httpHeaders: httpHeaders
        )
    }
    /// API call for DeleteUserHandler at: users/{userID}
    static func deleteUserWithID(
        userID: UUID,
        authorization: String? = nil,
        httpHeaders: HTTPHeaders = [:]
    ) -> ApodiniPublisher<Empty> {
        Empty.deleteUserWithID(
            userID: userID,
            authorization: authorization,
            httpHeaders: httpHeaders
        )
    }
    /// API call for GetCategoryHandler at: category
    static func getCategoryWithID(
        id: UUID,
        authorization: String? = nil,
        httpHeaders: HTTPHeaders = [:]
    ) -> ApodiniPublisher<EventCategory> {
        EventCategory.getCategoryWithID(
            id: id,
            authorization: authorization,
            httpHeaders: httpHeaders
        )
    }
    /// API call for GetCategoriesHandler at: categories
    static func getAllCategories(
        authorization: String? = nil,
        httpHeaders: HTTPHeaders = [:]
    ) -> ApodiniPublisher<[EventCategory]> {
        EventCategory.getAllCategories(
            authorization: authorization,
            httpHeaders: httpHeaders
        )
    }
    /// API call for GroupCategoriesHandler at: categories/group
    static func getCategoriesOfGroup(
        groupCategory: EventCategoryGroup,
        authorization: String? = nil,
        httpHeaders: HTTPHeaders = [:]
    ) -> ApodiniPublisher<[EventCategory]> {
        EventCategory.getCategoriesOfGroup(
            groupCategory: groupCategory,
            authorization: authorization,
            httpHeaders: httpHeaders
        )
    }
    /// API call for HomeFeedHandler at: home/{userID}
    static func getHomeFeedForUserWithID(
        showPreviousEvents: Bool = try! Bool.instance(from: 7),
        userID: UUID,
        authorization: String? = nil,
        httpHeaders: HTTPHeaders = [:]
    ) -> ApodiniPublisher<HomeFeed> {
        HomeFeed.getHomeFeedForUserWithID(
            showPreviousEvents: showPreviousEvents,
            userID: userID,
            authorization: authorization,
            httpHeaders: httpHeaders
        )
    }
    /// API call for StatisticsHandler at: users/{userIdentifier}/statistics
    static func statisticsOfUser(
        userIdentifier: UUID,
        authorization: String? = nil,
        httpHeaders: HTTPHeaders = [:]
    ) -> ApodiniPublisher<UserStatistic> {
        UserStatistic.statisticsOfUser(
            userIdentifier: userIdentifier,
            authorization: authorization,
            httpHeaders: httpHeaders
        )
    }
    /// API call for GetUserHandler at: users/{userID}
    static func getUserWithID(
        userID: UUID,
        authorization: String? = nil,
        httpHeaders: HTTPHeaders = [:]
    ) -> ApodiniPublisher<User> {
        User.getUserWithID(
            userID: userID,
            authorization: authorization,
            httpHeaders: httpHeaders
        )
    }
    /// API call for UserLoginHandler at: login
    static func login(
        login: UserLogin,
        authorization: String? = nil,
        httpHeaders: HTTPHeaders = [:]
    ) -> ApodiniPublisher<User> {
        User.login(
            login: login,
            authorization: authorization,
            httpHeaders: httpHeaders
        )
    }
    /// API call for UserRegisterFormHandler at: register
    static func register(
        userForm: UserRegisterForm,
        authorization: String? = nil,
        httpHeaders: HTTPHeaders = [:]
    ) -> ApodiniPublisher<User> {
        User.register(
            userForm: userForm,
            authorization: authorization,
            httpHeaders: httpHeaders
        )
    }
    /// API call for GetAllUsersHandler at: users
    static func getAllUsers(
        authorization: String? = nil,
        httpHeaders: HTTPHeaders = [:]
    ) -> ApodiniPublisher<[User]> {
        User.getAllUsers(
            authorization: authorization,
            httpHeaders: httpHeaders
        )
    }
    /// API call for GetParticipantsOfEventHandler at: events/{eventID}/participants
    static func getParticipantsOfEventWithID(
        eventID: UUID,
        authorization: String? = nil,
        httpHeaders: HTTPHeaders = [:]
    ) -> ApodiniPublisher<[User]> {
        User.getParticipantsOfEventWithID(
            eventID: eventID,
            authorization: authorization,
            httpHeaders: httpHeaders
        )
    }
    /// API call for ExperienceUsersHandler at: users/experience/{experience}
    @available(*, deprecated, message: "This endpoint is not available in the new version anymore. Calling this method results in a failing promise!")
    static func usersOfExperience(
        experience: Experience,
        authorization: String? = nil,
        httpHeaders: HTTPHeaders = [:]
    ) -> ApodiniPublisher<[User]> {
        User.usersOfExperience(
            experience: experience,
            authorization: authorization,
            httpHeaders: httpHeaders
        )
    }
}

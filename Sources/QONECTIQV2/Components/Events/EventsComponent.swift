//
// This source file is part of the Apodini open source project
//
// SPDX-FileCopyrightText: 2019-2021 Paul Schmiedmayer and the Apodini project authors (see CONTRIBUTORS.md) <paul.schmiedmayer@tum.de>
//
// SPDX-License-Identifier: MIT
//

import Foundation
import Apodini

// MARK: - EventsComponent
struct EventsComponent: Component {
    @PathParameter var id: Event.ID
    
    var content: some Component {
        Group("events") {
            Group($id) {
                GetEventHandler(id: $id)
                    .identified(by: "getEventWithID")
                DeleteEventHandler(identifier: $id)
                    .operation(.delete)
                    .identified(by: "deleteEventWithID")
                UpdateEventHandler(eventID: $id)
                    .operation(.update)
                    .identified(by: "updateEventWithID")
                Group("participants") {
                    GetParticipantsOfEventHandler(eventIdentifier: $id)
                        .identified(by: "getParticipantsOfEventWithID")
                }
            }
            Group("search") {
                SearchEventsHandler()
                    .identified(by: "searchEventsWithQuery")
            }
            GetEventsHandler()
                .identified(by: "getAllEvents")
            CreateEventHandler()
                .operation(.create)
                .identified(by: "createEvent")
            Group("category") {
                CategoryEventsHandler()
                    .operation(.create)
                    .identified(by: "getEventsOfCategory")
            }
        }
    }
}

// MARK: - GetParticipantsOfEventHandler
struct GetParticipantsOfEventHandler: Handler {
    @Binding var eventIdentifier: Event.ID
    
    func handle() throws -> [User] {
        [try .instance(or: notFound)]
    }
}

struct SearchEventsHandler: Handler {
    @Parameter var searchQuery: String
    
    func handle() throws -> [Event] {
        [try .instance(or: notFound)]
    }
}

// MARK: - UpdateEventHandler
struct UpdateEventHandler: Handler {
    @Parameter(.http(.body))
    var eventMediator: EventMediator
    
    @Binding
    var eventID: Event.ID
    
    func handle() throws -> Event {
        try .instance(or: notFound)
    }
}

// MARK: - CategoryEventsHandler
struct CategoryEventsHandler: Handler {
    @Parameter(.http(.body)) var group: EventCategoryGroup
    
    func handle() throws -> [Event] {
        [try .instance(or: notFound)]
    }
}

// MARK: - CreateEventHandler
struct CreateEventHandler: Handler {
    @Parameter(.http(.body))
    var event: Event
    
    func handle() throws -> EventLoopFuture<Status> {
        throw notFound
    }
}

// MARK: - GetEventsHandler
struct GetEventsHandler: Handler {
    
    func handle() throws -> [Event] {
        [try .instance(or: notFound)]
    }
}

// MARK: - GetEventHandler
struct GetEventHandler: Handler {
    @Binding var id: Event.ID
    
    func handle() throws -> Event {
        try .instance(or: notFound)
    }
}

// MARK: - DeleteEventHandler
struct DeleteEventHandler: Handler {
    @Binding var identifier: Event.ID
    
    func handle() throws -> Event {
        try .instance(or: notFound)
    }
}


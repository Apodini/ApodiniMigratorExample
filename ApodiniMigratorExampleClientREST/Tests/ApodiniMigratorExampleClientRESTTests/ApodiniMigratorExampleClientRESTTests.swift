//
// This source file is part of the Apodini open source project
//
// SPDX-FileCopyrightText: 2019-2021 Paul Schmiedmayer and the Apodini project authors (see CONTRIBUTORS.md) <paul.schmiedmayer@tum.de>
//
// SPDX-License-Identifier: MIT
//

import XCTest
@testable import ApodiniMigratorExampleClientREST
@testable import ApodiniMigratorClientSupport

final class ApodiniMigratorExampleClientRESTTests: XCTestCase {
    func testCategoryStatus() throws {
        let json: JSONValue =
        """
        "available"
        """
        
        let instance = XCTAssertNoThrowWithResult(try CategoryStatus.instance(from: json))
        XCTAssertNoThrow(try CategoryStatus.encoder.encode(instance))
    }
    
    func testEmpty() throws {
        let json: JSONValue =
        """
        {
        
        }
        """
        
        let instance = XCTAssertNoThrowWithResult(try Empty.instance(from: json))
        XCTAssertNoThrow(try Empty.encoder.encode(instance))
    }
    
    func testEvent() throws {
        let json: JSONValue =
        """
        {
        "category" : {
        "group" : "marketing",
        "id" : "4F4F2133-FAB0-4DD1-B58E-A0A718124053",
        "status" : "available",
        "title" : ""
        },
        "date" : 671536800,
        "duration" : 0,
        "id" : "CB4B036E-EC46-454A-A4A5-2E25ABB2C290",
        "imagePath" : "https://github.com/Apodini/Apodini",
        "maxParticipants" : null,
        "organizer" : "643A81B6-411C-474F-82A1-1C65F2B72A4B",
        "reviews" : [],
        "summary" : "",
        "tags" : [],
        "title" : ""
        }
        """
        
        let instance = XCTAssertNoThrowWithResult(try Event.instance(from: json))
        XCTAssertNoThrow(try Event.encoder.encode(instance))
    }
    
    func testEventCategory() throws {
        let json: JSONValue =
        """
        {
        "group" : "marketing",
        "id" : "840F6636-2A94-4529-B779-BF8851AD08FB",
        "status" : "available",
        "title" : ""
        }
        """
        
        let instance = XCTAssertNoThrowWithResult(try EventCategory.instance(from: json))
        XCTAssertNoThrow(try EventCategory.encoder.encode(instance))
    }
    
    func testEventCategoryGroup() throws {
        let json: JSONValue =
        """
        "marketing"
        """
        
        let instance = XCTAssertNoThrowWithResult(try EventCategoryGroup.instance(from: json))
        XCTAssertNoThrow(try EventCategoryGroup.encoder.encode(instance))
    }
    
    func testEventMediator() throws {
        let json: JSONValue =
        """
        {
        "date" : null,
        "duration" : null,
        "maxParticipants" : null
        }
        """
        
        let instance = XCTAssertNoThrowWithResult(try EventMediator.instance(from: json))
        XCTAssertNoThrow(try EventMediator.encoder.encode(instance))
    }
    
    func testExperience() throws {
        let json: JSONValue =
        """
        "beginner"
        """
        
        let instance = XCTAssertNoThrowWithResult(try Experience.instance(from: json))
        XCTAssertNoThrow(try Experience.encoder.encode(instance))
    }
    
    func testHomeFeed() throws {
        let json: JSONValue =
        """
        {
        "categories" : [],
        "events" : [],
        "greeting" : "",
        "id" : "C4B1761F-F0E1-4653-BA9A-7B4841DED411",
        "searchBarText" : "",
        "subtitle" : "",
        "userID" : "BA971EF6-B04F-43E6-921B-BF5CF05B18D0"
        }
        """
        
        let instance = XCTAssertNoThrowWithResult(try HomeFeed.instance(from: json))
        XCTAssertNoThrow(try HomeFeed.encoder.encode(instance))
    }
    
    func testHomeFeedCategory() throws {
        let json: JSONValue =
        """
        {
        "categoryID" : "21077E78-D26C-471B-8253-4C3FC383D720",
        "eventsCount" : 0,
        "imageURL" : "https://github.com/Apodini/Apodini",
        "title" : ""
        }
        """
        
        let instance = XCTAssertNoThrowWithResult(try HomeFeedCategory.instance(from: json))
        XCTAssertNoThrow(try HomeFeedCategory.encoder.encode(instance))
    }
    
    func testHomeFeedEvent() throws {
        let json: JSONValue =
        """
        {
        "eventID" : "29B2E09B-EF7F-4110-B2C9-FA58B73109BE",
        "eventsCount" : 0,
        "imageURL" : "https://github.com/Apodini/Apodini",
        "subtitle" : "",
        "title" : ""
        }
        """
        
        let instance = XCTAssertNoThrowWithResult(try HomeFeedEvent.instance(from: json))
        XCTAssertNoThrow(try HomeFeedEvent.encoder.encode(instance))
    }
    
    func testRating() throws {
        let json: JSONValue =
        """
        "outstanding"
        """
        
        let instance = XCTAssertNoThrowWithResult(try Rating.instance(from: json))
        XCTAssertNoThrow(try Rating.encoder.encode(instance))
    }
    
    func testReview() throws {
        let json: JSONValue =
        """
        {
        "content" : "",
        "eventID" : "9965F4DB-CADB-40B4-9E09-B7D035FE3D17",
        "id" : "C0AEB02F-06C5-4944-8F26-55B81DA14872",
        "rating" : "outstanding",
        "reviewerID" : "1F782D21-A85C-445E-A0E9-D08C57408678",
        "summary" : "",
        "title" : ""
        }
        """
        
        let instance = XCTAssertNoThrowWithResult(try Review.instance(from: json))
        XCTAssertNoThrow(try Review.encoder.encode(instance))
    }
    
    func testReviewForm() throws {
        let json: JSONValue =
        """
        {
        "content" : "",
        "rating" : "outstanding",
        "summary" : "",
        "title" : ""
        }
        """
        
        let instance = XCTAssertNoThrowWithResult(try ReviewForm.instance(from: json))
        XCTAssertNoThrow(try ReviewForm.encoder.encode(instance))
    }
    
    func testUser() throws {
        let json: JSONValue =
        """
        {
        "birthday" : 671536800,
        "email" : "",
        "eventsOfInterest" : [],
        "experience" : "beginner",
        "homeFeed" : null,
        "id" : "423EBA16-D440-4992-BFCF-A864368AFBAC",
        "name" : "",
        "ownEvents" : [],
        "participatingEvents" : [],
        "password" : "",
        "reviews" : [],
        "subscribedToNewsLetter" : false,
        "surname" : ""
        }
        """
        
        let instance = XCTAssertNoThrowWithResult(try User.instance(from: json))
        XCTAssertNoThrow(try User.encoder.encode(instance))
    }
    
    func testUserLogin() throws {
        let json: JSONValue =
        """
        {
        "password" : "",
        "userName" : ""
        }
        """
        
        let instance = XCTAssertNoThrowWithResult(try UserLogin.instance(from: json))
        XCTAssertNoThrow(try UserLogin.encoder.encode(instance))
    }
    
    func testUserRegisterForm() throws {
        let json: JSONValue =
        """
        {
        "birthday" : 671536800,
        "email" : "",
        "name" : "",
        "password" : "",
        "subscribedToNewsLetter" : false,
        "surname" : ""
        }
        """
        
        let instance = XCTAssertNoThrowWithResult(try UserRegisterForm.instance(from: json))
        XCTAssertNoThrow(try UserRegisterForm.encoder.encode(instance))
    }
    
    func XCTAssertNoThrowWithResult<T>(_ expression: @autoclosure () throws -> T) -> T {
        XCTAssertNoThrow(try expression())
        do {
            return try expression()
        } catch {
            preconditionFailure("Expression threw an error: \(error.localizedDescription)")
        }
    }
}

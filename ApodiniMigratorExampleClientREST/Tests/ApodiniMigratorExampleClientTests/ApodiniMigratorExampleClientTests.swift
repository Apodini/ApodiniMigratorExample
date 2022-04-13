//
// This source file is part of the Apodini open source project
//
// SPDX-FileCopyrightText: 2019-2021 Paul Schmiedmayer and the Apodini project authors (see CONTRIBUTORS.md) <paul.schmiedmayer@tum.de>
//
// SPDX-License-Identifier: MIT
//

import XCTest
@testable import ApodiniMigratorExampleClient
@testable import ApodiniMigratorClientSupport

final class ApodiniMigratorExampleClientTests: XCTestCase {
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
        "id" : "3118A51A-51A2-406A-8832-EE950C192569",
        "status" : "available",
        "title" : ""
        },
        "date" : 663678000,
        "duration" : 0,
        "id" : "8350B94E-2584-47F7-88A3-05F2BEA1F7DE",
        "imagePath" : "https://github.com/Apodini/Apodini",
        "maxParticipants" : null,
        "organizer" : "92759F36-1F12-457E-ACD3-764BDF5593CA",
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
        "id" : "BB97662B-2D5D-4C53-B05B-308DA36767FC",
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
        "id" : "B56AEFA4-076C-4CBD-9F5C-83326F797325",
        "searchBarText" : "",
        "subtitle" : "",
        "userID" : "74476BB0-FE1B-4F86-BE0C-8F8CCAEB7AC4"
        }
        """
        
        let instance = XCTAssertNoThrowWithResult(try HomeFeed.instance(from: json))
        XCTAssertNoThrow(try HomeFeed.encoder.encode(instance))
    }
    
    func testHomeFeedCategory() throws {
        let json: JSONValue =
        """
        {
        "categoryID" : "C50329DE-AD23-42A8-95C4-64D29C76BA3F",
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
        "eventID" : "6C5AD9BB-E622-4689-ACEF-5575A90A3227",
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
        "eventID" : "24FC33C2-A754-4938-874D-3F5D685BD448",
        "id" : "CA85B336-8845-4340-9314-B6BA5F842EF0",
        "rating" : "outstanding",
        "reviewerID" : "66A5DAF5-0DC8-4A06-83D4-116CE0902317",
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
        "birthday" : 663678000,
        "email" : "",
        "eventsOfInterest" : [],
        "experience" : "beginner",
        "homeFeed" : null,
        "id" : "F3713384-542F-4A85-A3E8-CC6C39846155",
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
        "birthday" : 663678000,
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
